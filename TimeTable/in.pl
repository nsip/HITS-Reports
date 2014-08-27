[
	{
		id => 1,
		title => 'TeachingGroups Filled',
		description => 'Details on how this test is done',
		# XXX How to restrict this just to Teaching Groups for this ID
		query => q{
			SELECT
				*
			FROM
				TeachingGroup
			-- XXX
			ORDER BY
				KLA
			LIMIT 10
		},
		rule => 'morethan:0',
		subtests => [
			{
				id => 1, 
				title => 'Validate SchoolInfoRefId exists in local system', 
				rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId}'
			},
			{
				id => 2, 
				title => 'Check number of students', 
				rule =>'subquerycount:RefId=TeachingGroup_Student/TeachingGroup_RefId'
			},
			{
				id => 3, 
				title => 'Check number of teachers', 
				rule =>'subquerycount:RefId=TeachingGroup_Teacher/TeachingGroup_RefId'
			},
			{
				id => 4, 
				title => 'Invalid KLA', 
				rule => 'notblank:KLA',
			},
		],
		weight => 0.5,
	},

	{
		id => 2,
		title => 'The payload contains n TimeTableCell? objects (n>0)',
		query => q{
			SELECT
				*
			FROM
				TimeTableCell
		},
		rule => 'morethan:0',
		subtests => [
			{
				id => 1, 
				title => 'Validate SchoolInfoRefId exists in local system', 
				rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId}'
			},
		],
		weight => 1,
	},

	{
		id => 3,
		title => 'The payload contains a ScheduledActivity',
		query => q{
			SELECT
				*
			FROM
				ScheduledActivity
		},
		rule => 'morethan:0',
		subtests => [
			{
				id => 1, 
				title => 'Validate SchoolInfoRefId exists in local system', 
				rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId}'
			},
		],
		weight => 0.5,
	},

	{
		id => 4,
		title => 'The payload contains a TimeTable',
		query => q{
			SELECT
				*
			FROM
				TimeTable
		},
		rule => 'morethan:0',
		subtests => [
			{
				id => 1, 
				title => 'Validate SchoolInfoRefId exists in local system', 
				rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId}'
			},
		],
		weight => 0.5,
	},

]


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

