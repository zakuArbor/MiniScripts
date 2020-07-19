#!/bin/perl
use strict;
use warnings;
use lib "scripts/";
require 'Course.pm';
use Data::Dumper;


use Course;

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

sub trim_string {
	my $str = shift;
	$str =~ s/^\s+|\s+\n?$//g;
	$str;
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
	my $course_note = qr/EXT/;
	my $session_header_re = qr/<h3 class="sessionHeader pre-elem">(.*)<\/h3>/;
	my $course_code;
	my $course_name;
	my $course_name2;
	my $course_grade;
	my $course_avg;
	my $weight;
	my $course;
	my $semester_name;
	my @courses = qw();

	my $SEMESTER_HEADER_STATE = 0;
	my $COURSE_HEADER_STATE = 1;
	my $COURSE_BODY_STATE = 2;

	my $state = $SEMESTER_HEADER_STATE;

	while (my $line = <$fh>) {
		chomp($line);

		if ($line =~ $terminator_re) {
			return 1;
		}

		if ($state == $SEMESTER_HEADER_STATE) {
			if (($semester_name) = $line =~ /$session_header_re/) {
				$state = $COURSE_HEADER_STATE;
				print "****\n";
				print Dumper(\@courses);
				print "****\n";
			}
		}
		elsif ($state == $COURSE_HEADER_STATE) {
			if ($line =~ /${course_html_re}/) {
				$line =~ s/${course_html_re}//g;
				$state = $COURSE_BODY_STATE;
			}
		}
		if ($state == $COURSE_BODY_STATE) {
			if ($line =~ /$sem_end_re/) {
				$state = $SEMESTER_HEADER_STATE;
			}

			if (($course_name2) = $line =~ /^\s+${course_name_re}\s+$/) {
				#if course name is too long that it goes to another line
				$course_name2 = trim_string($course_name2);
				print $courses[-1]->append_course_name($course_name2);
			}
			elsif (($course_code, $course_name, undef, $weight, $course_grade, $course_avg) = $line =~ /$course_re/) {
				if (!($line =~ /\s+$course_note$/)) {
					$course_name = trim_string($course_name);
					push(@courses, Course->new({
						course_code => $course_code,
						course_name => $course_name,
						weight      => $weight,
						course_grade=> $course_grade,
						course_avg  => $course_avg
					}));
				}
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