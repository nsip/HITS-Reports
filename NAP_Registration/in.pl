{
	title => 'NAPLAN Registration Report',
	description => 'NAPLAN Registration data has been created correctly',

	tests => [
		{
			id => 'N1',
			title => 'StudentPersonal Filled',
			description => 'This test validates the student personal records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentPersonal
			},
			tables => ['StudentPersonal'],
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
				{
					id => 3, 
					title => 'StudentPersonalRefId points to existing student', 
					rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
				},
				{
					id => 4, 
					title => 'SchoolInfoRefId is mandatory', 
					rule => 'notblank:SchoolInfo_RefId'
				},
				{
					id => 5, 
					title => 'SchoolInfoRefId points to existing school', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
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
				{
					id => 8, 
					title => 'Day value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsDayValueCodeType ', 
					rule =>'enums:DayValue=AM,Full,N/A,Partial,PM'
				},
				{
					id => 9, 
					title => 'AttendanceCode is mandatory', 
					rule =>'notblank:AttendanceCode'
				},
				{
					id => 10, 
					title => 'Attendance code uses prescribed SIF enums: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceCodeType ', 
					rule =>'enums:AttendanceCode=0,100,101,111,112,113,114,116,117,118,119,200,201,202,203,204,205,206,207,208,209,210,211,300,400,401,500,600,601,602,603,604,605,606,607,608,609,610,611,612,700,701,702,800,801,802,803,804,805,900,901,902,903,904,999'
				},
				{
					id => 11, 
					title => 'AttendanceStatus is mandatory', 
					rule =>'notblank:AttendanceStatus'
				},
				{
					id => 12, 
					title => 'Attendance status uses prescribed SIF enums: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAttendanceStatusType',
					rule =>'enums:AttendanceStatus=01,02,99,NA'
				},
			],
			weight => 0.1,
		},

	]
};


__END__

COMMON
