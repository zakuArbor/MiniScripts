<?php 
	include ($_SERVER['DOCUMENT_ROOT'] . "/web/header.php"); 
	
	/*
	STEPS TO STORE DATA
	1. Retrieve store_id
		a. If store_id is 0 (other), then try finding if the store is in the database
		b. If store_id is not found, then insert the store to the database
	2. Retrieve the date of the record
	3. Start retrieving record data (using "finite state machine")
	*/

	//STEP 1: Retriving store_id
	if (!($store_id = htmlspecialchars($_POST['store'], ENT_QUOTES))) {
		$store = htmlspecialchars($_POST['other_store'], ENT_QUOTES);
		echo $store;
		echo "test";
	}

	if (isset($store) && $store) { //a store not listed in the form

		////STEP 1a: check if the store is in the database
		$sql = "SELECT store_id FROM store WHERE store_name like :store_name";
		if (is_error(($match_store = single_return_prepare_select ($sql, $pdo, ['store_name' => $store], $error_code)), $error_code)) {
			//STEP 1b: insert store into the database
			$sql = "INSERT INTO store ('store_name') VALUES (:store_name)";
			if (is_error(prepare_non_query ($sql, $pdo, [$store], $error_code), $error_code)) {
				echo "Failed1";
				die();
			}

			//STEP 1b: Retrieve newly added store's id
			$sql = "SELECT store_id FROM store WHERE store_name = :store_name";
			if (is_error(($match_store = single_return_prepare_select ($sql, $pdo, ['store_name' => $store], $error_code)), $error_code)) {
				echo "Failed";
				die();
			}
		}
	}

	//STEP 2: Get the date of the report
	if (!($date = htmlspecialchars($_POST['date']))) {
		$date = date("Y-m-d");
	}

	//STEP 3: Gather record data
	//$item_name = $_POST['item_name'];
	$qty = $_POST['record'];
	$record = $_POST["record"];
	var_dump($record);
	
	



?>