#!/bin/perl
use strict;
use warnings;

sub strip_beginning {
	my $fh = shift or die "File Handle is undefined";
	my $terminator_re = qr/academic-history-report row/;
	while (my $line = <$fh>) {
		if ($line =~ $terminator_re) {
			return 1;
		}
	}
	return 0;
}

sub parse_academic_history {
	my $fh = shift or die "File Hanle is undefined";
	my $terminator_re = qr/<\/history-academic>/;
	my $course_html_re = qr/<div class="courses\s/;
	my $delimiter_re = qr/\s+/;
	my $course_code_re = qr/\w{3}\d{3}[H|Y][1|5]/;
	my $course_name_re = qr/(\w+\s?)+/;
	my $weight_re = qr/0\.50|1\.00/;
	my $letter_grade_re = qr/[ABCD][-+]?/;
	my $course_code;
	my $course_name;
	my $course_name2;
	my $course_grade;
	my $course_avg;
	my $weight;

	my $state = 0;


	while (my $line = <$fh>) {
		if ($line =~ $terminator_re) {
			return 1;
		}
		if ($state == 0) {
			if (($course_code, $course_name, undef, $weight, $course_grade, $course_avg) = $line =~ /${course_html_re}.*(${course_code_re})\s+(${course_name_re})\s+(${weight_re})\s+\d+\s+(${letter_grade_re})\s+(${letter_grade_re})\s+/) {
				print $line;
				print $course_code . "\n";
				print "${course_name}\n";
				print "${weight}\n";
				print "${course_grade}\n";
				print "${course_avg}\n";
				$state++;
			}
		}
		elsif ($state == 1) {
			#if course name is too long that it goes to another line
			if (($course_name2) = $line =~ /^\s+${course_name_re}\s+$/) {
				print "${course_name2}\n";
			}
			$state++;
		}
	}
}

my $fh;
my $filename;

# Note: $#ARGV is number of arguments - 1 (ARGV[0] is not the program name)
if ($#ARGV < 0) {
	die "Path to Academic History must be provided\n";
}

$filename = $ARGV[0];

open($fh, '<', $filename) or die $!;

if (!strip_beginning($fh)) {
	die "Please input a valid HTML Transcript file from ACORN\n";
}

parse_academic_history($fh);

close($fh);