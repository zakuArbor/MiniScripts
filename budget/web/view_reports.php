<H1>View Reports</H1>
<?php 

	/*Add security such as randomized token*/

	include ($_SERVER['DOCUMENT_ROOT'] . "/web/header.php"); 

	if (isset($_REQUEST['select'])) {

	}

	$sql = "SELECT report.report_id, store.store_id, store_name, date, SUM(qty * unit_cost) AS total_cost 
	FROM report 
	JOIN store ON report.store_id = store.store_id
	JOIN record ON report.report_id = record.report_id
	WHERE report.user_id = :user_id
	GROUP BY report.report_id
	ORDER BY date DESC";

	$reports = array_prepare_select($sql, $pdo, ['user_id' => $user_id], $error_code);
	?>
	<table>
		<tr>
			<th>Number</th>
			<th>STORE</th>
			<th>DATE</th>
			<th>TOTAL COST</th>
		</tr>
		<?php
		$i = 1;
		foreach ($reports as $report) {
			echo "<tr>";
			echo "<td><a href = 'view_report.php?report_id=$i'>$i</a></td>";
			echo "<td><a href = 'view_reports.php?select=$report[store_id]'>$report[store_name]</a></td>";
			echo "<td>$report[date]</td>";
			echo "<td>$report[total_cost]</td>";
			echo "</tr>";
			$i++;
		}
		?>
	</table>