#!/usr/bin/perl
use strict;
use warnings;

use DBI;

require("library.pl");

if (@ARGV != 3) {
        printf(STDERR "usage: %s file user password\n", $0);
        exit 1;
}

my $user = $ARGV[1];
my $password = $ARGV[2]; 
if (!&validFile($ARGV[0])) {
	printf(STDERR "%s: Invalid file\n", $ARGV[0]);
        exit(1);
}
if (!&validDate($ARGV[0])) {
	printf(STDERR "%s: Is not a valid file name\n", $ARGV[0]);
	exit(1);
}
if (!&validFile("type.csv")) {
	printf(STDERR "%s: Invalid file\n", "type.csv");
}

my $dbh = DBI->connect("DBI:mysql:database=budget", "$user", "$password", { RaiseError => 1, AutoCommit => 0 });

my($date, undef) = split(/\.csv/, $ARGV[0]);
my $sth = $dbh->prepare("SELECT date_id FROM date WHERE date = ?;");
my $sth1 = $dbh->prepare("INSERT INTO date (date) VALUES(?)");
$sth->execute($date);
my $date_id = $dbh->selectrow_array($sth);
if (!$date_id) {
	$sth1->execute($date);
	$sth->execute($date);
	$date_id = $dbh->selectrow_array($sth);
}

my $line;

$sth = $dbh->prepare("SELECT type_name FROM type WHERE type_id = ?;");
$sth1 = $dbh->prepare("INSERT INTO type (type_id, type_name) VALUES (?, ?)");
my $sth2 = $dbh->prepare("UPDATE type SET type_name = ? WHERE type_id = ?");

my $fh = &open_read_file("type.csv");
while (<$fh>) {
	chomp;
	my ($type_id, $type_name) = split/ /;
	$sth->execute($type_id);
	my ($name) = $dbh->selectrow_array($sth);
	if ($name && $name ne $type_name) {
		$sth2->execute($type_name, $type_id);
	}
	elsif (!$name) {
		$sth1->execute($type_id, $type_name);
	}
}


$fh = &open_read_file($ARGV[0]);
$sth = $dbh->prepare("INSERT INTO item(type_id, item_name, quantity, unit_cost, total_cost, date_id) VALUES (?,?,?,?,?,?)");

while ($line = <$fh>) {
	chown($line);
	my @fields = split(", ", $line);

	my @record_details;
	my $i = 0;
	foreach my $field (@fields) {
		chomp($field);
		$record_details[$i] = $field;
		if (($i == 0 || $i == 2) && !&isInt($record_details[$i], 1)) {print $field;
			exit(1);
		}
		elsif ($i == 3 && !&isMoney($record_details[$i], 1)) {
			exit(1);
		}
		elsif ($i == 4 && !&isMoney($record_details[$i], 1)) {
			exit(1);
		}
		$i++;
	}
	if (@record_details == 4) {
		push(@record_details, &total_cost($record_details[2], $record_details[3]));
	}
	push(@record_details, $date_id); 
	$sth->execute(@record_details);
}
close($fh);
$dbh->commit;
$dbh->disconnect;

# Calculate and return the total cost of an item
# @param $_[0]: Qunantity >= 1
# @param $_[1]: Unit cost 
# @return: Return total cost of buying x amount of items
sub total_cost {
	return $_[0] * $_[1];
}

sub validDate {
	if ($_[0] =~ /^2\d{3}-[0-3]\d\.csv$/) {
		return 1;
	}
	return 0;
}
