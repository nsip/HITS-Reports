{
	title => 'Attendance Report',
	description => 'Test Attendance data has been created correctly',

# commenting out all tests on redundant data, which we cannot currently perform as the database receiving the SIF payloads is normalised
       
        # disabling all referential integrity and enum checks, since they are being sanitised by the SIF Framework before they hit the database.

	tests => [
		{
			id => 'R1',
			title => 'StudentDailyAttendance Filled',
			description => 'This test validates the student daily attendance records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentDailyAttendance
			},
			tables => ['StudentDailyAttendance'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 1, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 2, 
					title => 'StudentPersonalRefId is mandatory', 
					rule => 'notblank:StudentPersonal_RefId'
				},
                                #				{
                                #	id => 3, 
                                #	title => 'StudentPersonalRefId points to existing student', 
                                #	rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                #},
				{
					id => 4, 
					title => 'SchoolInfoRefId is mandatory', 
					rule => 'notblank:SchoolInfo_RefId'
				},
                                #{
                                #	id => 5, 
                                #	title => 'SchoolInfoRefId points to existing school', 
                                #	rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                #},
				{
					id => 6, 
					title => 'CalendarDate is mandatory', 
					rule =>'notblank:CalendarDate'
				},
				{
					id => 7, 
					title => 'SchoolYear is mandatory', 
					rule =>'notblank:SchoolYear'
				},
                                #{
                                #	id => 8, 
                                #	title => 'Day value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsDayValueCodeType ', 
                                #	rule =>'enum:DayValue=AM,Full,N/A,Partial,PM'
                                #},
				{
					id => 9, 
					title => 'AttendanceCode is mandatory', 
					rule =>'notblank:AttendanceCode'
				},
                                #{
                                #	id => 10, 
                                #	title => 'Attendance code uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceCodeType ', 
                                #	rule =>'enum:AttendanceCode=0,100,101,102,111,112,113,114,116,117,118,119,200,201,202,203,204,205,206,207,208,209,210,211,300,400,401,500,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,700,701,702,800,801,802,803,804,805,900,901,902,903,904,905,999'
                                #},
				{
					id => 11, 
					title => 'AttendanceStatus is mandatory', 
					rule =>'notblank:AttendanceStatus'
				},
                                #{
                                #	id => 12, 
                                #	title => 'Attendance status uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceStatusType',
                                #	rule =>'enum:AttendanceStatus=01,02,99,NA'
                                #},
			],
			weight => 0.1,
		},

		{
			id => 'R4',
			title => 'StudentAttendanceTimeList Filled',
			description => 'This test validates the student attendance time list records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentAttendanceTimeList
			},
			tables => ['StudentAttendanceTimeList'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 35, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 36, 
					title => 'StudentPersonalRefId is mandatory', 
					rule => 'notblank:StudentPersonal_RefId'
				},
                                #{
                                #	id => 37, 
                                #	title => 'StudentPersonalRefId points to existing student', 
                                #	rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                #},
				{
					id => 38, 
					title => 'SchoolInfoRefId is mandatory', 
					rule => 'notblank:SchoolInfo_RefId'
				},
                                #{
                                #	id => 39, 
                                #	title => 'SchoolInfoRefId points to existing school', 
                                #	rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                #},
				{
					id => 40, 
					title => 'CalendarDate is mandatory', 
					rule =>'notblank:AttendanceTimeListDate'
				},
				{
					id => 41, 
					title => 'SchoolYear is mandatory', 
					rule =>'notblank:SchoolYear'
				},
				{
					id => 42, 
					title => 'Check number of times', 
					rule =>'subquerycount:RefId=StudentAttendanceTimeList_AttendanceTime/StudentAttendanceTimeList_RefId'
				},
			],
			weight => 0.1,
		},
		
		{
			id => 'R5',
			title => 'StudentAttendanceTimeList AttendanceTimes Filled',
			description => 'This test validates the attendance times list in the student attendance time list records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentAttendanceTimeList_AttendanceTime
			},
			tables => ['StudentAttendanceTimeList_AttendanceTime'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 43, 
					title => 'AttendanceCode is mandatory', 
					rule => 'notblank:Code'
				},
				{
					id => 44, 
					title => 'AttendanceStatus is mandatory', 
					rule => 'notblank:AttendanceStatus'
				},
				{
					id => 45, 
					title => 'StartTime is mandatory', 
					rule => 'notblank:StartTime'
				},
				{
					id => 46, 
					title => 'EndTime is mandatory', 
					rule => 'notblank:EndTime'
				},
                                #{
                                #	id => 47, 
                                #	title => 'Attendance code uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceCodeType ', 
                                #	rule =>'enum:Code=0,100,101,102,111,112,113,114,116,117,118,119,200,201,202,203,204,205,206,207,208,209,210,211,300,400,401,500,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,700,701,702,800,801,802,803,804,805,900,901,902,903,904,905,999'
                                #},
                                #{
                                #	id => 48, 
                                #	title => 'Attendance status uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceStatusType',
                                #	rule =>'enum:AttendanceStatus=01,02,99,NA'
                                #},				
                                #{
                                #        id => 49,
                                #        title => 'TimeTableSubject_RefId points to existing timetable subject',
                                #        rule => 'lookup:TimeTableSubject_RefId=TimeTableSubject/RefId'
                                #},
			],
			weight => 0.1,
		},

                {
                        id => 'R6',
                        title => 'StudentAttendanceTimeList PeriodAttendance Filled',
                        description => 'This test validates the period attendance list in the student attendance time list records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        StudentAttendanceTimeList_PeriodAttendance
                        },
                        tables => ['StudentAttendanceTimeList_PeriodAttendance'],
                        rule => 'morethan:0',
                        subtests => [
                                {
                                        id => 50,
                                        title => 'AttendanceCode is mandatory',
                                        rule => 'notblank:attendanceCode'
                                },
                                {
                                        id => 51,
                                        title => 'AttendanceStatus is mandatory',
                                        rule => 'notblank:attendanceStatus'
                                },
                                {
                                        id => 52,
                                        title => 'AttendanceDate is mandatory',
                                        rule => 'notblank:attendanceDate'
                                },
                                #{
                                #        id => 53,
                                #        title => 'Attendance code uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceCodeType ',
                                #	rule =>'enum:attendanceCode=0,100,101,102,111,112,113,114,116,117,118,119,200,201,202,203,204,205,206,207,208,209,210,211,300,400,401,500,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,700,701,702,800,801,802,803,804,805,900,901,902,903,904,905,999'
                                #},
                                #{
                                #        id => 54,
                                #        title => 'Attendance status uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceStatusType',
                                #        rule =>'enum:attendanceStatus=01,02,99,NA'
                                #},
                                #{
                                #        id => 55,
                                #        title => 'ScheduledActivity_RefId points to existing scheduled activity',
                                #        rule => 'lookup:scheduledActivity_RefId=ScheduledActivity/RefId'
                                #},
                                #{
                                #        id => 56,
                                #        title => 'timeTableSubject_RefId points to existing timetable subject',
                                #        rule => 'lookup:timeTableSubject_RefId=TimeTableSubject/RefId'
                                #},
                                #{
                                #        id => 57,
                                #        title => 'timeTableCell_RefId points to existing timetable subject',
                                #        rule => 'lookup:timeTableCell_RefId=TimeTableCell/RefId'
                                #},
                        ],
                        weight => 0.1,
                },

                {
                        id => 'R7',
                        title => 'StudentAttendanceTimeList PeriodAttendance RoomInfo Filled',
                        description => 'This test validates the rooms for the period attendance list in the student attendance time list records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        StudentAttendanceTimeList_PeriodAttendance_RoomInfo
                        },
                        tables => ['StudentAttendanceTimeList_PeriodAttendance_RoomInfo'],
                        rule => 'morethan:0',
                        subtests => [
                                {
                                        id => 58,
                                        title => 'RoomInfo_RefId is mandatory',
                                        rule => 'notblank:RoomInfo_RefId'
                                },
                                #{
                                #        id => 59,
                                #        title => 'RoomInfo_RefId points to existing room',
                                #        rule => 'lookup:RoomInfo_RefId=RoomInfo/RefId'
                                #},
                        ],
                        weight => 0.1,
                },

                {       
                        id => 'R8',
                        title => 'StudentAttendanceTimeList PeriodAttendance TeacherCover Filled',
                        description => 'This test validates the teacher coverage descriptions for the period attendance list in the student attendance time list records submitted to the database', 
                        query => q{
                                SELECT
                                        *
                                FROM
                                        StudentAttendanceTimeList_PeriodAttendance_TeacherCover
                        },
                        tables => ['StudentAttendanceTimeList_PeriodAttendance_TeacherCover'],
                        rule => 'morethan:0',
                        subtests => [   
                                {       
                                        id => 60,
                                        title => 'staffPersonal_RefId is mandatory',
                                        rule => 'notblank:staffPersonal_RefId'
                                },
                                #{
                                #        id => 61,
                                #        title => 'staffPersonal_RefId points to existing staff member',
                                #        rule => 'lookup:staffPersonal_RefId=StaffPersonal/RefId'
                                #},
                                #{
                                #        id => 62,
                                #        title => 'Credit uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsTeacherCoverCreditType',
                                #        rule =>'enum:credit=Casual,Extra,In-Lieu,Underload',
                                #},
                                #{
                                #        id => 63,
                                #        title => 'Supervision uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsTeacherCoverSupervisionType',
                                #        rule =>'enum:supervision=MergedClass,MinimalSupervision,Normal',
                                #},
                        ],
                        weight => 0.1,
                },

		
		{
			id => 'R2',
			title => 'StudentAttendanceSummary Filled',
			description => 'This test validates the student attendance summary records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentAttendanceSummary
			},
			tables => ['StudentAttendanceSummary'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 13, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 14, 
					title => 'StudentPersonalRefId is mandatory', 
					rule => 'notblank:StudentPersonal_RefId'
				},
                                #{
                                #	id => 15, 
                                #	title => 'StudentPersonalRefId points to existing student', 
                                #	rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                #},
				{
					id => 16, 
					title => 'SchoolInfoRefId is mandatory', 
					rule => 'notblank:SchoolInfo_RefId'
				},
                                #{
                                #	id => 17, 
                                #	title => 'SchoolInfoRefId points to existing school', 
                                #	rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                #},
				{
					id => 18, 
					title => 'SchoolYear is mandatory', 
					rule => 'notblank:SchoolYear'
				},
				{
					id => 19, 
					title => 'StartDate is mandatory', 
					rule => 'notblank:StartDate'
				},
				{
					id => 20, 
					title => 'EndDate is mandatory', 
					rule => 'notblank:EndDate'
				},
				{
					id => 21, 
					title => 'DaysAttended is mandatory', 
					rule => 'notblank:DaysAttended'
				},
				{
					id => 22, 
					title => 'ExcusedAbsences is mandatory', 
					rule => 'notblank:ExcusedAbsences'
				},
				{
					id => 23, 
					title => 'UnexcusedAbsences is mandatory', 
					rule => 'notblank:UnexcusedAbsences'
				},
				{
					id => 24, 
					title => 'DaysInMembership is mandatory', 
					rule => 'notblank:DaysInMembership'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R3',
			title => 'StudentPeriodAttendance Filled',
			description => 'This test validates the student period attendance records submitted to the database',
			# XXX How to restrict this just to Teaching Groups for this ID
			query => q{
				SELECT
					*
				FROM
					StudentPeriodAttendance
			},
			tables => ['StudentPeriodAttendance'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 25, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 26, 
					title => 'StudentPersonalRefId is mandatory', 
					rule => 'notblank:StudentPersonal_RefId'
				},
                                #				{
                                #	id => 27, 
                                #	title => 'StudentPersonalRefId points to existing student', 
                                #	rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                #},
				{
					id => 28, 
					title => 'SchoolInfoRefId is mandatory', 
					rule => 'notblank:SchoolInfo_RefId'
				},
                                #{
                                #	id => 29, 
                                #	title => 'SchoolInfoRefId points to existing school', 
                                #	rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                #},
				{
					id => 30, 
					title => 'CalendarDate is mandatory', 
					rule =>'notblank:CalendarDate'
				},
				{
					id => 31, 
					title => 'AttendanceCode is mandatory', 
					rule =>'notblank:AttendanceCode'
				},
                                #{
                                #	id => 32, 
                                #	title => 'Attendance code uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceCodeType ', 
                                #	rule =>'enum:AttendanceCode=0,100,101,102,111,112,113,114,116,117,118,119,200,201,202,203,204,205,206,207,208,209,210,211,300,400,401,500,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,700,701,702,800,801,802,803,804,805,900,901,902,903,904,905,999'
                                #},
				{
					id => 33, 
					title => 'AttendanceStatus is mandatory', 
					rule =>'notblank:AttendanceStatus'
				},
                                #{
                                #	id => 34, 
                                #	title => 'Attendance status uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceStatusType',
                                #	rule =>'enum:AttendanceStatus=01,02,99,NA'
                                #},
			],
			weight => 0.1,
		},

	]
};


__END__

COMMON
