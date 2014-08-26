package HITS::Report::Rules;
use perl5i::2;

sub new {
	my ($class, $ref) = @_;
}

sub lookup {
	my ($self, $in, $rule) = @_;
}

sub noblank {
	my ($self, $row, $rule) = @_;
	if ( !exists($row->{$rule}) || !defined($row->{$rule}) || $row->{$rule} eq '') {
		die "Input ($field = $row->{$field}) must not be blank";
	}
	return 1;
}

# enums:field=a,b,c
sub enum {
	my ($self, $row, $rule) = @_;
	my ($field, $enums) = split(/=/, $rule, 2);
	foreach my $e (split(/,/, $enums)) {
		if ($e eq $row->{$field}) {
			return 1;
		}
	}
	die "Input ($field = $row->{$field}) does not match any enums ($enums)";
}

1;
