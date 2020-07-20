#!/bin/perl
use strict;
use warnings;
use lib "scripts/";
require 'Course.pm';
use Data::Dumper;


use Course;

# TODO
# * parse data where there is no course average (i.e. Arnold's courses)
# * find what to label for each course's semester (i.e. should we categorize fall-winter + summer as one year, or have a series of semesters, etc)

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

sub to_json {
	my ($fh, $courses_ref) = @_;
	foreach my $c (@$courses_ref) {
		print($fh $c->to_string() . ",\n");
	}
}

sub generate_courses_file {
	my $fh;
	open($fh, '>', "courses.js") or die $!;
	print($fh "function get_courses() {\n");
	print($fh "\treturn [\n");
	to_json($fh, shift);
	print($fh "\t];\n");
	print($fh "}\n");
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
	my $letter_grade_re = qr/[ABCD][-+]?|CR|NCR|\*|\s/;
	my $course_re = qr/(${course_code_re})\s+(${course_name_re})\s+(${weight_re})\s+${mark_re}\s+(${letter_grade_re})\s+(${letter_grade_re})/;
	my $sem_end_re = qr/<\/div>/;
	my $course_note = qr/EXT/;
	my $session_header_re = qr/<h3 class="sessionHeader pre-elem">20(\d{2})\s+(Fall|Winter|Summer).*<\/h3>/;
	my $course_code;
	my $course_name;
	my $course_name2;
	my $course_grade;
	my $course_avg;
	my $weight;
	my $course;
	my $semester_year;
	my $semester_session;
	my @courses = qw();

	my $SEMESTER_HEADER_STATE = 0;
	my $COURSE_HEADER_STATE = 1;
	my $COURSE_BODY_STATE = 2;

	my $state = $SEMESTER_HEADER_STATE;

	while (my $line = <$fh>) {
		chomp($line);

		if ($line =~ $terminator_re) {
			return \@courses;
		}

		if ($state == $SEMESTER_HEADER_STATE) {
			if (($semester_year, $semester_session) = $line =~ /$session_header_re/) {
				$state = $COURSE_HEADER_STATE;
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
				#print Dumper(\@courses);
			}

			if (($course_name2) = $line =~ /^\s+${course_name_re}\s+$/) {
				#if course name is too long that it goes to another line
				$course_name2 = trim_string($course_name2);
				#print $courses[-1]->append_course_name($course_name2);
			}
			elsif (($course_code, $course_name, undef, $weight, $course_grade, $course_avg) = $line =~ /$course_re/) {
				if (!($line =~ /\s+$course_note$/)) {
					
					$course_name = trim_string($course_name);

					$course_avg =~ s/\s+/*/g; #if course average is blank

					my $sem = $semester_session . " '" . $semester_year;

					push(@courses, Course->new({
						course_code => $course_code,
						course_name => $course_name,
						weight      => $weight,
						course_grade=> $course_grade,
						course_avg  => $course_avg,
						semester    => $sem,
					}));
				}
			}
		}
	}
}

my $fh;
my $filename;
my $courses_ref;

# Note: $#ARGV is number of arguments - 1 (ARGV[0] is not the program name)
if ($#ARGV < 0) {
	die "Path to Academic History must be provided\n";
}

$filename = $ARGV[0];

open($fh, '<', $filename) or die $!;

if (!strip_beginning($fh)) {
	die "Please input a valid HTML Transcript file from ACORN\n";
}

$courses_ref = parse_academic_history($fh);

close($fh);

if (!$courses_ref) {
	print(STDERR "Failed to parse Academic History\n");
	return -1;
}

generate_courses_file($courses_ref);
0;