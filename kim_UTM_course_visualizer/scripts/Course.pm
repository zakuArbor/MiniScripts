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
		course_avg   => $args->{course_avg}
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
"{
	course_code: $self->{course_code},
	course_name: $self->{course_name},
	weight:      $self->{weight},
	course_grade:$self->{course_grade},
	course_avg:  $self->{course_avg}
}";
}

1;
