package Course;

use strict;
use warnings;

sub new {
	my ($class, $args) = @_;
	my $self = bless {
		course_code  => $args->{course_code}, 
		course_name  => $args->{course_name}, 
		weight       => $args->{weight}, 
		course_grade => $args->{course_grade}, 
		course_avg   => $args->{course_avg},
		semester     => $args->{semester},
		}, $class;
}

sub get_course_name {
	my $self = shift;
	$self->{course_name};
}

sub append_course_name {
	my $self = shift;
	$self->{course_name} .= " " . shift; 
}

sub set_course_name {
	my $self = shift;
	$self->{course_name} = shift; 
}

sub to_string {
	my $self = shift;
	return 
	"\t{\n" .
			"\t\tcourse_code: \"$self->{course_code}\",\n" .
			"\t\tcourse_name: \"$self->{course_name}\",\n" .
			"\t\tweight:      $self->{weight},\n"      .
			"\t\tcourse_grade:\"$self->{course_grade}\",\n".
			"\t\tcourse_avg:  \"$self->{course_avg}\",\n"  . 
			"\t\tsemester:    \"$self->{semester}\",\n"    .
	"\t}";
}

1;
