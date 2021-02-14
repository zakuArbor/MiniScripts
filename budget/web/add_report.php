<?php 
	include ($_SERVER['DOCUMENT_ROOT'] . "/web/header.php"); 

	$sql = "SELECT * FROM um";
	$ums = array_prepare_select($sql, $pdo, [], $error_code);
	$sql = "SELECT * FROM type";
	$categories = array_prepare_select($sql, $pdo, [], $error_code);
?>

<script type="text/javascript">
	var item_input = function (record_count) { 
		return "<label for = 'input_item_name'>Item Name: </label>" +
	"<input id = 'input_item_name' type = 'text' name = 'record[" + record_count + "][item_name]' placeholder='e.g. Apple' required><br>";	
	}

	var qty_input = function (record_count) {
		return "<label for = 'input_qty'>Quantity: </label>" + 
		"<input type = 'text' id = 'input_qty' name = 'record[" + record_count + "][qty]' placeholder = 'e.g. 10' pattern = '^\\d*\\.?\\d{0,4}$' title = 'A number with maximum of 4 decimal places'>" +
		"<br>";
	}

	var um_input = function (record_count) {
		return "<label for = 'input_um'>Unit Measurement: </label>" +
		"<select id = 'input_um' name = 'record[" + record_count + "][um]'>" +
			"<?php 
			foreach($ums as $um) {
				echo "<option value = $um[um_id]>$um[um]</option>";
			}
			?>" +
		"</select><br>";
	}

	var item_type_input = function (record_count) {
		return "<label for = 'input_item_type'>Item Category: </label>" + 
		"<select id = 'input_item_type' name = 'record[" + record_count + "][item_cat]'>" +
			"<option value = 0>other</option> " +
			"<?php
				foreach($categories as $category) {
					echo "<option value = $category[type_id]>$category[type]</option>";
				}
			?>" +
		"</select><br>";	
	}

	var unit_cost_input = function (record_count) {
		return "<label for = 'input_unit_cost'>Unit Cost: </label>" + 
		"<input id = 'input_unit_cost' type = 'text' name = 'record[" + record_count + "][unit_cost]' placeholder='0.00' " +"pattern = '\\d*\\.?\\d{0,2}'><br>";
	}

	var record_inputs = function (record_count) { 
		return (item_input(record_count) + qty_input(record_count) + um_input(record_count) + item_type_input(record_count) + unit_cost_input(record_count));
	}	
</script>

CREATE REPORT

<form action = "process_reports.php" method = "post" enctype='application/json'>
	<label for = "input_store">Store</label>
	<select id = "input_store" name = "store">
		<option value = 0 >other</option>
		<?php
		$user_id = 19;
		$sql = "SELECT * FROM store JOIN 
				(SELECT DISTINCT store_id 
				FROM report
				WHERE user_id = :user_id 
				GROUP BY store_id
				ORDER BY count(store_id)
				LIMIT 10) AS user_most_visit 
				ON user_most_visit.store_id = store.store_id";
		$stores = array_prepare_select($sql, $pdo, ['user_id' => $user_id], $error_code);
		foreach($stores as $store) {
			echo "<option value = $store[store_id]>$store[store_name]</option> ";
		}
		?>
	</select><br>

	<div id = "other_store"> 
		<label for = "input_add_store">Store: </label>
		<input type = "text" id = "input_add_store" name = "other_store" placeholder="e.g. Walmart"><br>
	</div>

	<label for = "input_date">Date: </label>
	<input type = "date" name = "date" id = "input_date" min = "1997-01-01"><br>
	
	<div id = "record">
		<script>
			document.write(record_inputs(1));
		</script>

	</div>

	<div id = "add_record">Add a new record</div>
	<input type = "submit">
</form>
<script type="text/javascript">
	var element_other_store = document.getElementById("other_store");
	var element_record = document.getElementById("record");
	var element_add_record = document.getElementById("add_record");

	var record_count = 1; //+ 1 for initial record, all reports must have at least one record

	var removeRecordEventHandler = function(event, action_element) {
		event.target.parentElement.removeEventListener('click', removeRecordEventHandler);
		event.target.parentElement.remove();
		//remove();
		console.log(event);
		//console.log(event.target);
	}

	document.getElementById("input_store").onchange = function (e) {
		if (this.value == 0) {
			element_other_store.style.display = "";
			console.log("show");
		}
		else {
			element_other_store.style.display = "none";	
			console.log("hidden");
		}
	}

	function record() {
		var new_elem = document.createElement('div');
		var delete_record_html = "<div id = 'delete_record" + record_count + "'>Delete Record</div>";
		new_elem.setAttribute("id", "record" + record_count);
		new_elem.innerHTML = record_inputs(record_count) + delete_record_html;		
		element_record.appendChild(new_elem);
		document.getElementById("delete_record" + record_count).addEventListener('click', removeRecordEventHandler);
	}

	element_add_record.onclick = function (e) {
		record_count++;
		record();
	}

</script>