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
				TeachinGroup
		},
		subtests => [
			{
				id => 1, 
				title => 'Validate SchoolInfoRefId exists in local system', 
				rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId}'
			},
			{
				id => 2, 
				title => 'Check number of students', 
				rule=>'custom'
			},
			{
				id => 3, 
				title => 'Check number of teachers', 
				rule=>'custom',
			},
			{
				id => 4, 
				title => 'Invalid KLA', 
				rule => 'notblank:KLA',
			},
		],
		weight => 1,
	},

	{
		id => 2,
		title => 'TimeTableCell Filled',
		description => 'Details on how this test is done',
		subtests => [
		],
		weight => 1,
	},
]

