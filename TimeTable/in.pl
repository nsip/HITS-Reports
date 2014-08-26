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
				rule=>'subquerycount:RefId=TeachingGroup_Student/TeachingGroup_RefId'
			},
			{
				id => 3, 
				title => 'Check number of teachers', 
				rule=>'subquerycount:RefId=TeachingGroup_Teacher/TeachingGroup_RefId'
			},
			{
				id => 4, 
				title => 'Invalid KLA', 
				rule => 'notblank:KLA',
			},
		],
		weight => 1,
	},
]

