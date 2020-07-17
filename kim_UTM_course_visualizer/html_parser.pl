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
	my $course_html_re = qr/.*<div class="courses\s.*">/;
	my $delimiter_re = qr/\s+/;
	my $course_code_re = qr/\w{3}\d{3}[H|Y][1|5]/;
	my $course_name_re = qr/([\w+\s?]+)/;
	my $weight_re = qr/0\.50|1\.00/;
	my $mark_re = qr/\d+|\s{2}/; #Note: this script will not capture your Mark in the course, just your grade (i.e. letter grade) 
	my $letter_grade_re = qr/[ABCD][-+]?|CR|NCR/;
	my $course_re = qr/(${course_code_re})\s+(${course_name_re})\s+(${weight_re})\s+${mark_re}\s+(${letter_grade_re})\s+(${letter_grade_re})/;
	my $sem_end_re = qr/<\/div>/;
	my $course_code
;	my $course_name;
	my $course_name2;
	my $course_grade;
	my $course_avg;
	my $weight;

	my $state = 0;


	while (my $line = <$fh>) {
		if ($line =~ $terminator_re) {
			return 1;
		}

		
		if ($state == 0 && $line =~ /${course_html_re}/) {
			$line =~ s/${course_html_re}//g;
			$state++;
		}
		
		if ($state > 0) {
			if ($line =~ /$sem_end_re/) {
				$state = 0;
			}

			if (($course_code, $course_name, undef, $weight, $course_grade, $course_avg) = $line =~ /$course_re/) {
				print $course_code . "\n";
				print "${course_name}\n";
				print "${weight}\n";
				print "${course_grade}\n";
				print "${course_avg}\n";
				$state = 2;
			}
			elsif ($state == 2) {
				
				#if course name is too long that it goes to another line
				if (($course_name2) = $line =~ /^\s+${course_name_re}\s+$/) {
					print "course2: ${course_name2}\n";
				}
				else { #another course
					print("test");
					if (($course_code, $course_name, undef, $weight, $course_grade, $course_avg) = $line =~ /$course_re/) {
						print $course_code . "\n";
						print "${course_name}\n";
						print "${weight}\n";
						print "${course_grade}\n";
						print "${course_avg}\n";
					}
				}
				$state = 1;
			}
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