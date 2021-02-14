#Add record to file
#@param $_[0]: $ARGV the parameters passed in the order of: type_id item unit_cost [total_amount]
#@param $_[1]: The file name to be written
sub writeRecord {
	my $fh;
	if(!open($fh, ">>", pop(@_))) {
		die "Cannot open file\n";
	}
	my($last_field) = pop(@_);
	foreach (@_) {
		print $fh "$_, ";
	}
	print $fh $last_field."\n";
	close($fh);
}

#Check if variable is a Money Type (a valid monetary value)
#@param $_[0]: the variable to check whether if it is a money type
#@param $_[1]: error message option [boolean]
#@return: return 1 [true] iff $_[0] is a valid money amount otherwise return 0 [False]
#RESTRICTIONS: $_[0] >= 0
sub isMoney {
	if ($_[0] =~ /^(\d+|\d+\.\d\d?)$/) {
		return 1;
	}
	if ($_[1]) {
		printf(STDERR "Input should be a valid money amount\n");
	}
	return 0;
}

#Check if a variable is an integer
#@param $_[0]: the variable to check whether if it is an integer or not
#@param $_[1]: error message option [boolean]
#@return: return 1 [True] iff $_[0] is an int otherwise return 0 [False]
sub isInt {
	if ($_[0] =~ /^\d+$/) {
		return 1;
	}
	if ($_[1]) {
		printf(STDERR "Input should be an integer\n");
	}	
	return 0;
} 

#Check if file exists and is a regular writtable file.
#@param $_[0]: the variable to check 
#@return: return 1 [True] iff $_[0] is a valid regular writtable file otherwise return 0 [False]
sub validFile {
	my $status = 1;
	if (!-e $_[0]) {
		$status = 0;
	}
	elsif (!-f $_[0]) {
		printf STDERR "%s: Is not a regular file\n", $_[0];
		$status = 0;
	}
	elsif (!-w $_[0]) {
		printf STDERR "%s: Does not have sufficient permission to write to file %s\n", $0, $_[0];
		$status = 0;
	}
	elsif (!-r $_[0]) {
		printf STDERR "%s: Unable to read file\n", $_[0];
		$status = 0;
	}
	return $status;
}

# Open file
# @param $_[0]: File name to open
# @return: return the file handler
sub open_read_file {
	my $fh;
	if (!open($fh, "<:encoding(UTF-8)", $_[0])) {
		printf STDERR "%s: Failed to read file\n", $_[0];
		exit 1;
	}
	return $fh;
}

sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

1;
