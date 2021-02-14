#!/usr/bin/perl
use strict;
use warnings;

require "library.pl";

my $usage_message = "usage: %s type_id item quantity unit_cost [total_amount] [file]\n";
my $int_error = "%s: must be a type of int\n";
my $money_error = "%s: must be a valid money amount\n";
my $file;

if (@ARGV < 4 || @ARGV > 6) {
	printf STDERR $usage_message, $0;
	exit 1;
}
elsif (!&isInt($ARGV[0])) {
	printf STDERR $int_error, "type_id";
	printf STDERR $usage_message, $0;
	exit 1;
}
elsif (!&isInt($ARGV[2])) {
	printf STDERR $int_error, "quantity";
        printf STDERR $usage_message, $0;
        exit 1;
}
elsif (!&isMoney($ARGV[3])) {
	printf STDERR $money_error, "unit cost";
	printf STDERR $usage_message, $0;
	exit 1;
}
elsif (@ARGV >= 5) { 
	if (@ARGV == 5 && !&isMoney($ARGV[4])) {
		if (!&validFile($ARGV[4])) {	
			printf STDERR $money_error, "total_amount";
        		printf STDERR $usage_message, $0;
        		exit 1;
		}
		else {
			$file = $ARGV[4];
		}
	}
	elsif (@ARGV == 6) {
		if (!&isMoney($ARGV[4])) {
			printf STDERR $money_error, "total_amount";
                        printf STDERR $usage_message, $0;
			exit 1;
		}
		if (!&validFile($ARGV[5])) {
			exit 1;
		}
	}
}
else {
	$file = $ARGV[5];
}

if (!$file) {
	use POSIX qw(strftime);
	$file = strftime "%Y", localtime;
	$file .= "-";
	$file .= strftime "%m", localtime;
	$file .= ".csv";
}

&writeRecord(@ARGV, $file);
