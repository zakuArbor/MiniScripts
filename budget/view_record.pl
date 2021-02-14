#!/usr/bin/perl
use strict;
use warnings;

require "library.pl";


my $file;
my $input;

if (@ARGV > 1) {
	printf STDERR "usage: %s file\n", $0;
	exit 1;
}

#should check item type file

if (@ARGV == 1) {
	if (!&validFile($ARGV[0])) {
		if (-e $ARGV[0]) {
			exit 2;	
		}
	}
	$file = $ARGV[0];
	if (&emptyFile($ARGV[0])) {
		$input = &insertMenu();
	}
	else {
		$input = &mainMenu();
	}
}
else {
	use POSIX qw(strftime);
	$file = strftime "%m", localtime;
	$file .= "-";
	$file .= strftime "%Y", localtime;
	$file .= ".csv";
	
	if (&emptyFile($file)) {
		$input = &insertMenu();
	}
	else {
		$input = &mainMenu();
	}	
}

while ($input != 4) {
	if ($input == 1) {
    	&insert_prompt($file);
    }
    elsif ($input == 2) {
        &edit_prompt($file);
    }
    elsif ($input == 3) {
        &delete_prompt($file);
    }
	$input = &mainMenu();
}

# Prompt user for row to delete 
# @param $_[0]: Name of the csv file 
sub delete_prompt {
	my $max_row_id = `cat $file | wc -l`;
	my $row_id;
	my $valid_input = 0;
	my $file = $_[0];

	while (!$valid_input) {
		print("Input row # to delete: ");
		$row_id = <STDIN>;
		chown($row_id);
		if (validId($row_id, $max_row_id)) {
			$valid_input = 1;
		}
	}
	&delete_record($file, $row_id);
}

# Delete a specified row from the csv file
# @param $_[0]: Name of the csv file
# @param $_[1]: Row id that indicates which record to delete in the csv file
sub delete_record {
	my $row_id = $_[1];
	my $fh_in = &open_read_file($_[0]);
	my $fh_out;
	my $line;
	
	if (!open($fh_out, ">", "$_[0].new")) {
		printf(STDERR "%s: Failed to open file for writing\n");
		exit 1;
	}
	while ($line = <$fh_in>) {
		chown($line);
		if ($. != $row_id) {
			print $line;
			print($fh_out $line);
		}
	}
	close($fh_out);
	close($fh_in);
	rename "$_[0].new",$_[0] or die "unable to rename '$_[0].new' to '$_[0]': $!";	
}

# Validate all fields of the record to be added
# @param $_[0]: Name of the csv file to insert the record
sub insert_prompt {
	my $is_valid;

	my $type_id;
	while (!$is_valid) {
		print "Item Type: ";
		$type_id = <STDIN>;
		chomp($type_id);
		if (!&isInt($type_id)) {
			print "Please input a valid integer\n";
		}
		else {
			$is_valid = 1;
		}
	}
	print "Item Name: ";
	my $item_name = <STDIN>;
	chomp($item_name);
	
	$is_valid = 0;
	my $qty;
	while (!$is_valid) {
		print "Quantity: ";
		$qty = <STDIN>;
		chomp($qty);
		if (!&isInt($qty) == 1) {
			print "Please input a valid number\n";
		}
		elsif ($qty <= 0) {
			print "Please input a quantity over 0\n";
		}
		else {
			$is_valid = 1;
		}
	}
	
	$is_valid = 0;
	my $unit_cost;
	while (!$is_valid) {
		print "Unit Cost: ";
		$unit_cost = <STDIN>;
		chomp($unit_cost);
		if (!&isMoney($unit_cost)) {
			print "Please input a valid cost\n";
		}
		elsif ($unit_cost == 0) {
			print "Please input a cost over \$0\n";
		}
		else {
			$is_valid = 1;
		}
	}

	my $total_cost;
	$is_valid = 0;
	while (!$is_valid) {
		print "Total Cost [Optional: You can leave it blank]: ";
		$total_cost = <STDIN>;
		chomp($total_cost);
		$total_cost = &trim($total_cost);
		if (!$total_cost) {
			$is_valid = 1;
		}
		elsif (!&isMoney($total_cost)) {
			print "Please input a valid cost\n";
		}
		elsif (&isMoney($total_cost) && $total_cost < 0) {
			print "Please input a cost over \$0\n";
		}
		else {
			$is_valid = 1
		}
	}
	if ($total_cost) {
		&writeRecord($type_id, $item_name, $qty, $unit_cost, $total_cost, $file);
	}
	else {
		&writeRecord($type_id, $item_name, $qty, $unit_cost, $file);
	}
}

# Prompt user for a row and field to edit
# @param $_[0]: Name of the csv file
sub edit_prompt {
	my $valid_input = 0;
	my $max_row_id = `cat $file | wc -l`;
	my $row_id;

	while (!$valid_input) {
		print("Input row # to edit: ");
		$row_id = <STDIN>;
		chown($row_id);
		if (validId($row_id, $max_row_id)) {
			$valid_input = 1;
		}
	}

	$valid_input = 0;
	my $col_id;
	print("What columns do you wish to edit.\n");
	print("1. Item Type Id\n");
	print("2. Item Name\n");
	print("3. Quantity\n");
	print("4. Unit Cost\n");
	print("5. Total Cost\n");
	while (!$valid_input) {
		print("Edit Column: ");
		$col_id = <STDIN>;
		chown($col_id);
		if (&validId($col_id, 5)) {
			$valid_input = 1;
		}
	}
	printf("Current: %s\n", &fetchData($_[0], $row_id, $col_id));

	$valid_input = 0;
	my $new_data;

	while (!$valid_input) {
		printf("New: ");
		$new_data = <STDIN>;
		chomp($new_data);
		if (&validateField($col_id, $new_data)) {
			$valid_input = 1;
		}
	}
	&updateData($_[0], $row_id, $col_id, $new_data);
}

# Validate input based on the selected field
# @param $_[0]: Field id that repr. the field to edit
# @param $_[1]: Data to parse if valid for the specified field
sub validateField {
	my $field_id = $_[0];
	my $data = $_[1];
	if ($field_id == 1) {
		#&validateItemId($data);
		return &isInt($data, 1);
	}
	elsif ($field_id == 2) {
		return 1;
	}
	elsif ($field_id == 3) {
		return &isInt($data, 1);
	}
	elsif ($field_id == 4 || $field_id == 5) {
		return &isMoney($data, 1);
	}
	return 0; #should never occur
}

# Update record to file
# @param $_[0]: File to read record data [$file]
# @param $_[1]: The record row to edit [$row_id]
# @param $_[2]: The field/column to edit[$col_id]
# @param $_[3]: Value to overwrite
# @return: return data from row $_[1] and col $_[2]
sub updateData {
	my $row_id = $_[1];
	my $col_id = $_[2];
	my $last_data;

	my $fh_in = &open_read_file($_[0]);
	my $fh_out;
	if (!open($fh_out, ">", "$_[0].new")) {
		printf(STDERR "%s: Failed to open file for writing\n");
		exit 1;
	}
	my $line;
	while ($line = <$fh_in>) {
		chown($line);
		if ($. == $row_id) {
			my @fields = split(", ", $line);
			if (@fields < $col_id) {
				$last_data = $_[3];
			}
			else {
				$fields[$col_id-1] = $_[3]; #$col_id -1 because an array starts from 0
				$last_data = pop(@fields);
			}
			foreach my $field (@fields) {
				chomp($field);
				print ($fh_out "$field, ");
			}
			print($fh_out "$last_data");
			if (!($last_data =~ /\n/)) {
				print($fh_out "\n");
			}
		}
		else {
			print($fh_out $line);
		}
	}
	close($fh_out);
	close($fh_in);
	rename "$_[0].new",$_[0] or die "unable to rename '$_[0].new' to '$_[0]': $!";
}


# Fetch data from a specific row and column
# @param $_[0]: File to read record data [$file]
# @param $_[1]: The record row to edit [$row_id]
# @param $_[2]: The field/column to edit[$col_id]
# @return: return data from row $_[1] and col $_[2]
sub fetchData {
	my $row_num = 0;
	my $row_id = $_[1];
	my $col_id = $_[2];

	my $fh = &open_read_file($_[0]);
	while (my $line = <$fh>) {
		$row_num += 1;
		if ($row_num == $_[1]) {
			chown($line);
			my @fields = split(", ", $line);
			if (@fields < $col_id) {
				return "";
			}
			return $fields[$col_id - 1]; #array starts from index 0
		}
	}
	close($fh);
}

# Check if id is type of int and valid
# @param $_[0]: variable to check 
# @param $_[1]: max id number
# @return: return 1 if id is type int and valid otherwise 0
sub validId {
	my $status = 1;
	if (!&isInt($_[0])) {
		print("Please input a valid integer\n");
		$status = 0;
	}
	elsif ($_[0] <= 0 || $_[0] > $_[1]) {
		print("Please input a valid id# \n");
		$status = 0;
	}
	return $status;
}

# Check if file is empty
# @param $_[0]: File name
# @return: return 1 [True] iff file is empty
sub emptyFile {
	if (!-s $_[0]) {
		return 1;
	}
	return 0;
}

# Display file contents
# @param $_[0]: file name 
sub displayFile {
	printf "type_id, item_name, quantity, unit_cost\n";
	print("[Begin File]\n");
	my $fh = &open_read_file($_[0]);
	while (my $line = <$fh>) {
		chown($line);
		print $line;
	}
	close($fh);
	print("[END OF FILE]\n");
}

# Display main menu and retrieve input
# @return: return an integer that represents option number 1-4
sub mainMenu {
	my $valid_command;

	print "*" x40 . "\n";
	print " MENU\n";
	print " 1. Insert a spending record\n";
	print " 2. Edit a spending record\n";
	print " 3. Delete a spending record\n";
	print " 4. Exit\n";
	print "*" x40 . "\n";

	&displayFile($file);

	print "Please input a number between 1 and 4: ";
	
	chomp(($valid_command = <STDIN>));	
	while (!&isInt($valid_command) || $valid_command == 0 || $valid_command > 4) {
		print "Please input a number between 1 and 4: ";
		chomp($valid_command = <STDIN>);
	}
	return $valid_command;
}

# Display insert menu (a modified menu since file is empty)
# @return: return 1 for insert or 4 to exit the program
sub insertMenu {
	my $valid_command;

	print "*" x 40 . "\n";
	print " Menu\n";
	print " 1. Insert a spending record\n";
	print " 2. Exit\n";
	print "*" x 40 . "\n";

	printf "File is empty\n";

	print "Please input option 1 or 2: ";
	
	chomp(($valid_command = <STDIN>));
	while (!&isInt($valid_command) || $valid_command == 0 || $valid_command > 2) {
                print "Please input either 1 or 2: ";
                chomp($valid_command = <STDIN>);
        }
	if ($valid_command == 2) {
		$valid_command = 4; #convert to the reg value of exit command
	}
	return $valid_command;
}
