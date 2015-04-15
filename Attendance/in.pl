{
	title => 'Attendance Report',
	description => 'Test Attendance data has been created correctly',

# commenting out all tests on redundant data, which we cannot currently perform as the database receiving the SIF payloads is normalised

	tests => [
		{
			id => 1,
			title => 'TeachingGroups Filled',
			description => 'This test validates the teaching group records submitted to the database',
			# XXX How to restrict this just to Teaching Groups for this ID
			query => q{
				SELECT
					*
				FROM
					TeachingGroup
			},
			rule => 'morethan:0', 
			subtests => [
				{
					id => 17, 
					title => 'Validate SchoolInfoRefId exists in local system (warning)', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => 21, 
					title => 'Check number of students', 
					rule =>'subquerycount:RefId=TeachingGroup_Student/TeachingGroup_RefId'
				},
				{
					id => 23, 
					title => 'Check number of teachers (warning)', 
					rule =>'subquerycount:RefId=TeachingGroup_Teacher/TeachingGroup_RefId'
				},


				{
					id => 19,
					title => 'Validate TimeTableSubjectRefId exists in local system (warning)', 
					rule => 'lookup:TimeTableSubject_RefId=TimeTableSubject/RefId'
				},
			],
			weight => 0.5,
		},

		{
			id => '21a',
			title => 'TeachingGroups_Students Filled',
			description => 'This test validates the students in the teaching group records submitted to the database',
			# XXX How to restrict this just to Teaching Groups for this ID
			query => q{
				SELECT
					*
				FROM
					TeachingGroup_Student
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => '22c', 
					title => 'Validate PreferredGivenName exists in local system', 
					rule => 'subquerymatch:StudentPersonal_PreferredGivenName=StudentPersonal/PreferredGivenName;StudentPersonal_RefId=StudentPersonal/RefId'
				},
				{
					id => '22d', 
					title => 'Validate MiddleName exists in local system', 
					rule => 'subquerymatch:StudentPersonal_MiddleName=StudentPersonal/MiddleName;StudentPersonal_RefId=StudentPersonal/RefId'
				},
				{
					id => '22e', 
					title => 'Validate MiddleName exists in local system', 
					rule => 'subquerymatch:StudentPersonal_FamilyName=StudentPersonal/FamilyName;StudentPersonal_RefId=StudentPersonal/RefId'
				},
			],
			weight => 0.5,
		},

		{
			id => '23a',
			title => 'TeachingGroups_Teacher Filled',
			description => 'This test validates the staff in the teaching group records submitted to the database',
			# XXX How to restrict this just to Teaching Groups for this ID
			query => q{
				SELECT
					*
				FROM
					TeachingGroup_Teacher
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => '24c', 
					title => 'Validate PreferredGivenName exists in local system', 
					rule => 'subquerymatch:StaffPersonal_PreferredGivenName=StaffPersonal/PreferredGivenName;StaffPersonal_RefId=StaffPersonal/RefId'
				},
				{
					id => '24d', 
					title => 'Validate MiddleName exists in local system', 
					rule => 'subquerymatch:StaffPersonal_MiddleName=StaffPersonal/MiddleName;StaffPersonal_RefId=StaffPersonal/RefId'
				},
				{
					id => '24e', 
					title => 'Validate MiddleName exists in local system', 
					rule => 'subquerymatch:StaffPersonal_FamilyName=StaffPersonal/FamilyName;StaffPersonal_RefId=StaffPersonal/RefId'
				},
			],
			weight => 0.5,
		},

		{
			id => 2,
			title => 'The payload contains n TimeTableCell objects (n>0)',
			description => 'This test validates the timetable cell records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					TimeTableCell
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => '36b', 
					title => 'Validate SchoolInfoRefId exists in local system (warning)', 
					rule => 'notblank:SchoolInfo_RefId'
				},
				{
					id => '36b', 
					title => 'Validate SchoolInfoRefId exists in local system', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => '27a', 
					title => 'Validate TimeTableRefId exists in local system', 
					rule => 'notblank:TimeTable_RefId'
				},
				{
					id => '27b', 
					title => 'Validate TimeTableRefId exists in local system', 
					rule => 'lookup:TimeTable_RefId=TimeTable/RefId'
				},
				{
					id => '28a', 
					title => 'Validate TimeTableSubjectRefId exists in local system', 
					rule => 'notblank:TimeTableSubject_RefId'
				},
				{
					id => '28b', 
					title => 'Validate TimeTableSubjectRefId exists in local system', 
					rule => 'lookup:TimeTableSubject_RefId=TimeTableSubject/RefId'
				},
				{
					id => '30a', 
					title => 'Validate TeachingGroupRefId exists in local system', 
					rule => 'notblank:TeachingGroup_RefId'
				},
				{
					id => '30b', 
					title => 'Validate TeachingGroupRefId exists in local system', 
					rule => 'lookup:TeachingGroup_RefId=TeachingGroup/RefId'
				},
				{
					id => '32a', 
					title => 'Validate RoomInfoRefId exists in local system', 
					rule => 'notblank:RoomInfo_RefId'
				},
				{
					id => '32b', 
					title => 'Validate RoomInfoRefId exists in local system', 
					rule => 'lookup:RoomInfo_RefId=RoomInfo/RefId'
				},
				{
					id => '34a', 
					title => 'Validate StaffPersonalRefId exists in local system (warning)', 
					rule => 'notblank:StaffPersonal_RefId'
				},
				{
					id => '34b', 
					title => 'Validate StaffPersonalRefId exists in local system', 
					rule => 'lookup:StaffPersonal_RefId=StaffPersonal/RefId'
				},
			],
			weight => 1,
		},
		{
			id => 3,
			title => 'The payload contains a ScheduledActivity',
			description => 'This test validates the scheduled activity records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					ScheduledActivity
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => '38a', 
					title => 'The provided ScheduleActivity objects are dated instances of TimeTableCell', 
					rule => 'lookup:TimeTableCell_RefId=TimeTableCell/RefId'
				},
				{
					id => '38b', 
					title => 'The provided ScheduleActivity objects are dated instances of TimeTableCell', 
					rule => 'notblank:Date'
				},
			],
			weight => 0.5,
		},
		{
			id => '42b',
			title => 'ScheduledActivity_Room Filled',
			description => 'This test validates that the rooms in the ScheduledActivity submitted to the database are valid',
			query => q{
				SELECT
					*
				FROM
					ScheduledActivity_Room
			},
			rule => 'morethan:0',
			subtests => [
			],
			weight => 0.5,
		},
		{
			id => '44b',
			title => 'ScheduledActivity_TeachingGroup Filled',
			description => 'This test validates that the teaching groups in the ScheduledActivity submitted to the database are valid',
			query => q{
				SELECT
					*
				FROM
					ScheduledActivity_TeachingGroup
			},
			rule => 'morethan:0',
			subtests => [
			],
			weight => 0.5,
		},
		{
			id => '45b',
			title => 'ScheduledActivity_Teacher Filled',
			description => 'This test validates that the teachers in the ScheduledActivity submitted to the database are valid',
			query => q{
				SELECT
					*
				FROM
					ScheduledActivity_Teacher
			},
			rule => 'morethan:0',
			subtests => [
			],
			weight => 0.5,
		},
		{
			id => 4,
			title => 'The payload contains a TimeTable',
			description => 'TODO',
			query => q{
				SELECT
					*
				FROM
					TimeTable
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => 15, 
					title => 'Validate SchoolInfoRefId exists in local system (warning)', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
			],
			weight => 0.5,
		},

	]
};


__END__

COMMON
	There are n SchoolInfo? links in the payload (n>=1)
	All SchoolInfo? links in the payload are to Objects provided by HITS to the client
	There are n StudentPersonal? links in the payload (n>=1)
	All StudentPersonal? links in the payload are to Objects provided by HITS to the client
	There are n StaffPersonal? links in the payload (n>=1)
	All StaffPersonal? links in the payload are to Objects provided by HITS to the client
	There are n RoomInfo? links in the payload (n>=1)
	All RoomInfo? links in the payload are to Objects provided by HITS to the client
	There are n TimeTableSubject? links in the payload (n>=1)
				{
					id => 39, 
					title => 'Validate DayId exists in TimeTableCell', 
					rule => 'lookup:DayId=TimeTableCell/DayId'
				},
			],
			weight => 0.5,
		},
		{
			id => 4,
			title => 'The payload contains a TimeTable',
			description => 'TODO',
			query => q{
				SELECT
					*
				FROM
					TimeTable
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => 15, 
					title => 'Validate SchoolInfoRefId exists in local system (warning)', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => '16a', 
					title => 'Validate SchoolInfoLocalId exists in local system', 
					rule => 'subquerymatch:SchoolInfo_LocalId=SchoolInfo/LocalId;SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => '16b', 
					title => 'Validate SchoolInfoSchoolName exists in local system', 
					rule => 'subquerymatch:SchoolInfo_SchoolName=SchoolInfo/SchoolName;SchoolInfo_RefId=SchoolInfo/RefId'
				},
			],
			weight => 0.5,
		},

	]
};


__END__

COMMON
	There are n SchoolInfo? links in the payload (n>=1)
	All SchoolInfo? links in the payload are to Objects provided by HITS to the client
	There are n StudentPersonal? links in the payload (n>=1)
	All StudentPersonal? links in the payload are to Objects provided by HITS to the client
	There are n StaffPersonal? links in the payload (n>=1)
	All StaffPersonal? links in the payload are to Objects provided by HITS to the client
	There are n RoomInfo? links in the payload (n>=1)
	All RoomInfo? links in the payload are to Objects provided by HITS to the client
	There are n TimeTableSubject? links in the payload (n>=1)
				{
					id => 39, 
					title => 'Validate DayId exists in TimeTableCell', 
					rule => 'lookup:DayId=TimeTableCell/DayId'
				},
			],
			weight => 0.5,
		},
		{
			id => 4,
			title => 'The payload contains a TimeTable',
			description => 'TODO',
			query => q{
				SELECT
					*
				FROM
					TimeTable
			},
			rule => 'morethan:0',
			subtests => [
				{
					id => 15, 
					title => 'Validate SchoolInfoRefId exists in local system (warning)', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => '16a', 
					title => 'Validate SchoolInfoLocalId exists in local system', 
					rule => 'subquerymatch:SchoolInfo_LocalId=SchoolInfo/LocalId;SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => '16b', 
					title => 'Validate SchoolInfoSchoolName exists in local system', 
					rule => 'subquerymatch:SchoolInfo_SchoolName=SchoolInfo/SchoolName;SchoolInfo_RefId=SchoolInfo/RefId'
				},
			],
			weight => 0.5,
		},

	]
};


__END__

COMMON
	There are n SchoolInfo? links in the payload (n>=1)
	All SchoolInfo? links in the payload are to Objects provided by HITS to the client
	There are n StudentPersonal? links in the payload (n>=1)
	All StudentPersonal? links in the payload are to Objects provided by HITS to the client
	There are n StaffPersonal? links in the payload (n>=1)
	All StaffPersonal? links in the payload are to Objects provided by HITS to the client
	There are n RoomInfo? links in the payload (n>=1)
	All RoomInfo? links in the payload are to Objects provided by HITS to the client
	There are n TimeTableSubject? links in the payload (n>=1)
	All TimeTableSubject? links in the payload are to Objects provided by HITS to the client

Note: We do not expect every instance of SchoolInfo?, StudentPersonal?, StaffPersonal?, RoomInfo?, TimeTableSubject? provided by HITS to be referenced by the returned objects. We are not testing for the completeness of timetabling software running over provisioned data, but only for the validity of the SIF payload they generate

Each instance of TimeTable? links to a School (Warning if it does not)

For each instance of TimeTable? linked to a School, TimeTable/SchoolLocalId? matches SchoolInfo/LocalId?, and TimeTable/SchoolName? matches SchoolInfo/SchoolName?, for that school (if provided)

Each instance of TeachingGroup? links to a School (Warning if it does not)

For each instance of TeachingGroup? linked to a School, TeachingGroup/SchoolLocalId? matches SchoolInfo/LocalId? (if provided)

Each instance of TeachingGroup? links to a TimeTable? Subject (warning if it does not)

For each instance of TeachingGroup? linked to a TimeTable? Subject, TeachingGroup/TimeTableSubjectLocalId? matches TimeTableSubject/LocalId? (if provided)

Each instance of TeachingGroup? links to n Students

For each instance of TeachingGroup? linked to a Student, TeachingGroup/StudentList/TeachingGroupStudent/StudentLocalId? matches StudentPersonal/LocalId?, and TeachingGroup/StudentList/TeachingGroupStudent/PersonInfo/Name? matches StudentPersonal/Name?

Each instance of TeachingGroup? links to n Staff (Warning if it does not)

For each instance of TeachingGroup? linked to a Staff, TeachingGroup/TeacherList/TeachingGroupTeacher/StaffLocalId? matches StaffPersonal/LocalId?, and TeachingGroup/TeacherList/TeachingGroupTeacher/PersonInfo/Name? matches StudentPersonal/Name?

Each instance of TeachingGroup? links to n Rooms (Warning if it does not)

For each instance of TeachingGroup? linked to a Room, TeachingGroup/TeachingGroupPeriodList/TeachingGroupPeriod/RoomNumber? matches RoomInfo/RoomNumber? (if provided)

Each instance of TimeTable? Cell links to a Timetable

Each instance of TimeTable? Cell links to a Timetable Subject

For each instance of TimeTable? Cell linked to a Timetable Subject, TimeTableCell/SubjectLocalId? matches TimeTableSubject/LocalId? (if provided)

Each instance of TimeTable? Cell links to a Teaching Group

For each instance of TimeTable? Cell linked to a TeachingGroup?, TimeTableCell/TeachingGroupLocalId? matches TeachingGroup/LocalId? (if provided)

Each instance of TimeTable? Cell links to a Room

For each instance of TimeTable? Cell linked to a Room, TimeTableCell/RoomNumber? matches RoomInfo/RoomNumber? (if provided)

Each instance of TimeTable? Cell may link to a Staff (Warning if it does not)

For each instance of TimeTable? Cell linked to a Staff, TimeTableCell/StaffLocalId? matches StaffPersonal/LocalId? (if provided)

Each instance of TimeTable? Cell may link to a School (Warning if it does not)

For each instance of TimeTable? Cell linked to a School, TimeTableCell/SchoolLocalId? matches SchoolInfo/LocalId? (if provided)

Each ScheduledActivity? provided is a dated instance of a TimeTableCell? object

[rule: ScheduledActivity/DayId? = TimeTableCell/DayId?

ScheduledActivity/PeriodId? = TimeTableCell/PeriodId?

ScheduledActivity/TimeTableRefId? = TimeTableCell/TimeTableRefId?

ScheduledActivity/Rooms/RoomInfoRefId? = TimeTableCell/RoomInfoRefId?

ScheduledActivity/TimeTableSubjectRefId? = TimeTableCell/TimeTableSubectRefId?

ScheduledActivity/TeachingGroup/TeachingGroupRefId? = TimeTableCell/TeachingGroupRefId?

ScheduledActivity/Teachers/TeacherCover/StaffPersonalRefId? = TimeTableCell/StaffPersonalRefId?]

