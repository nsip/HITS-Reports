package HITS::Report::Rules;
use perl5i::2;

sub new {
	my ($class, $dbh) = @_;
	my $self = bless {
		dbh => $dbh,
		lookup => {},
	}, ref($class) || $class;
	$self->_lookups;
	return $self;
}

sub _lookups {
	my ($self) = @_;
	foreach my $t (qw/
		StaffPersonal 
		TeachingGroup
		SchoolInfo
		TimeTableSubject
		TimeTableCell
		ScheduledActivity
		StudentPersonal
		RoomInfo
		TimeTable
	/) {
		$self->{lookup}->{$t} = {};
		my $lsth = $self->{dbh}->prepare("SELECT RefId FROM $t");
		$lsth->execute;
		while (my $ref = $lsth->fetchrow_hashref) {
			$self->{lookup}->{$t}{$ref->{RefId}} = 1;
		}
	}
}


# lookup:field=Table/field
sub lookup {
	my ($self, $row, $rule) = @_;
	my ($field, $table) = split(/=/, $rule, 2);
	$table =~ s|/.+$||;
	if ( $self->{lookup}{$table}{$row->{$field}} ) {
		return 1;
	}
	die "Lookup $field does not exist in $table\n";
}

# notblank:field
sub notblank {
	my ($self, $row, $rule) = @_;
	if ( !exists($row->{$rule}) || !defined($row->{$rule}) || $row->{$rule} eq '') {
		$row->{$rule} //= '';
		die "Input ($rule = $row->{$rule}) must not be blank\n";
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
	die "Input ($field = $row->{$field}) does not match any enums ($enums)\n";
}

# subquerycount:field=Table/field
sub subquerycount {
	my ($self, $row, $rule) = @_;
	my ($field, $part) = split(/=/, $rule, 2);
	my ($table, $joinfield) = split(m|/|, $part, 2);

	my $sth = $self->{dbh}->prepare(qq{
		SELECT
			count(*) as count
		FROM
			$table
		WHERE
			$joinfield = ?
	});
	$sth->execute($row->{$field});
	my $ref = $sth->fetchrow_hashref;

	if ($ref->{count} > 0) {
		return 1;
	}
	die "No matching count for $table against $field/$joinfield\n";
}

1;
