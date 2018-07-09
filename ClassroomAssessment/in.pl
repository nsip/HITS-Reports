{
	title => 'Gradebook Report',
	description => 'Test Gradebook data has been created correctly',

	tests => [
		{
			id => 'R1',
			title => 'GradingAssignment Filled',
			description => 'This test validates the grading assignment records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					GradingAssignment
			},
			tables => ['GradingAssignment'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 1, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
                                #				{
                                #	id => 2, 
                                #	title => 'TeachingGroup_RefId points to existing school', 
                                #	rule => 'lookup:TeachingGroup_RefId=TeachingGroup/RefId'
                                #},
				{
					id => 3, 
					title => 'Description is mandatory', 
					rule => 'notblank:Description'
				},
				{
					id => 4, 
					title => 'PointsPossible is mandatory', 
					rule => 'notblank:PointsPossible'
				},
			],
			weight => 0.1,
		},


		{
			id => 'R2',
			title => 'GradingAssignmentScore Filled',
			description => 'This test validates the grading assignment score records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					GradingAssignmentScore
			},
			tables => ['GradingAssignmentScore'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 21, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
			   {
						id => 22,
						title => 'StudentPersonalRefId is mandatory',
						rule => 'notblank:StudentPersonal_RefId'
				},
                                #{
                                #		id => 23,
                                #		title => 'StudentPersonalRefId points to existing student',
                                #		rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                #},
                                #{
                                #		id => 25,
                                #		title => 'TeachingGroupRefId points to existing teaching group',
                                #		rule => 'lookup:TeachingGroup_RefId=TeachingGroup/RefId'
                                #},
				{
						id => 26,
						title => 'GradingAssignmentRefId is mandatory',
						rule => 'notblank:GradingAssignment_RefId'
				},
                                #{
                                #		id => 27,
                                #		title => 'GradingAssignmentRefId points to existing grading assignment',
                                #		rule => 'lookup:GradingAssignment_RefId=GradingAssignment/RefId'
                                #},
			],
			weight => 0.1,
		},


	]
};


__END__

COMMON
