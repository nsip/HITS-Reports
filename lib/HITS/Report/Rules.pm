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

# Store RefIds of all objects in the database in a hash table
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

# All rules are of format Rule_name:Rule_content
# All routines here have the name Rule_name
# All routines have the parameters $row = database row processed by the rule, $rule = Rule_content

# lookup:field=Table/field
# ignores /field value. Used only to verify existence of RefIds
# treats field as optional
# i.e. this will confirm that, for field1=Table/field2, the RefId in field1 is a RefId of Table; it
# will not confirm that the RefId is registered under field2 in Table (because it assumes one RefId per Table)
sub lookup {
	my ($self, $row, $rule) = @_;
	my ($field, $table) = split(/=/, $rule, 2);
	$table =~ s|/.+$||;
	return 1 unless $row->{$field};
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

# subquerycount:field=Table/joinfield
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

# subquerymatch: field=Table/matchfield;myrefIdField=Table/joinrefIdfield
# e.g. schoolLocalId=SchoolInfo/LocalId;schoolRefId=SchoolInfo/RefId
# do not run query if local field is absent
sub subquerymatch {
	my ($self, $row, $rule) = @_;
	my ($rule1, $rule2) = split(/;/, $rule, 2);
	my ($field, $part) = split(/=/, $rule1, 2);
	my ($table, $joinfield) = split(m|/|, $part, 2);
	my ($myrefIdField, $joinrefIdField) = split(/=/, $rule2, 2);
	$joinrefIdField =~ s#^.*/##;

	return 1 unless $row->{$field};
	my $sth = $self->{dbh}->prepare(qq{
		SELECT
			count(*) as count
		FROM
			$table
		WHERE
			$joinfield = ?
		AND
			$joinrefIdField = ?
	});
	$sth->execute($row->{$field}, $row->{$myrefIdField});
	my $ref = $sth->fetchrow_hashref;

	if ($ref->{count} > 0) {
		return 1;
	}
	die "No matching count for $table against $field/$joinfield\n";
}

# subquerymatch: field=Table2/matchfield;myrefIdField=Table11/joinrefIdfield;Table1/Field1=Table2/Field2
# use where we have to traverse two tables to get to match
# e.g. RoomInfo_RefId=TimeTableCell/RoomInfo_RefId;ScheduledActivity_RefId=ScheduledActivty/RefId;ScheduledActivity/TimeTableCell_RefId=TimeTableCell/RefId
# do not run query if local field is absent
sub subquerymatch_twotables {
	my ($self, $row, $rule) = @_;
	my ($rule1, $rule2, $rule3) = split(/;/, $rule, 2);
	my ($field, $part) = split(/=/, $rule1, 2);
	my ($table, $joinfield) = split(m|/|, $part, 2);
	my ($myrefIdField, $joinrefIdField) = split(/=/, $rule2, 2);
	my ($table0, $joinfield0) = split(m|/|, $part, 2);
	my ($part1, $part2) = split(/=/, $rule3, 2);
	my ($table1, $joinfield1) = split(m|/|, $part1, 2);
	my ($table2, $joinfield2) = split(m|/|, $part2, 2);
	my $tfield = ($table1 eq $table) ? $joinfield1 : $joinfield2;
	my $t0field = ($table2 eq $table) ? $joinfield1 : $joinfield2;

	return 1 unless $row->{$field};
	my $sth = $self->{dbh}->prepare(qq{
		SELECT
			count(*) as count
		FROM
			$table t, $table0 t0
		WHERE
			t.$joinfield = ?
		AND
			t0.$joinrefIdField = ?
		AND
			t.$tfield = t0.$t0field
	});
	$sth->execute($row->{$field}, $row->{$myrefIdField});
	my $ref = $sth->fetchrow_hashref;

	if ($ref->{count} > 0) {
		return 1;
	}
	die "No matching count for $table against $field/$joinfield\n";
}

1;
