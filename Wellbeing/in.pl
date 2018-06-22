{
	title => 'Wellbeing Report',
	description => 'Wellbeing data has been created correctly',


	tests => [
		{
			id => 'R1',
			title => 'PersonalisedPlan Filled',
			description => 'This test validates the personalised plan records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PersonalisedPlan
			},
			tables => ['PersonalisedPlan'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 1, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 2, 
					title => 'StudentPersonal_RefId is mandatory', 
					rule => 'notblank:StudentPersonal_RefId'
				},
				{
					id => 3, 
					title => 'SchoolInfo_RefId is mandatory', 
					rule => 'notblank:SchoolInfo_RefId'
				},
				{
					id => 4, 
					title => 'SchoolInfo_RefId points to existing school', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => 5, 
					title => 'StudentPersonal_RefId points to existing student', 
					rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
				},
				{
					id => 6, 
					title => 'PersonalisedPlanCategory is mandatory', 
					rule =>'notblank:PersonalisedPlanCategory'
				},
				{
					id => 7, 
					title => 'PersonalisedPlanStartDate is mandatory', 
					rule =>'notblank:PersonalisedPlanStartDate'
				},
				{
					id => 8, 
					title => 'PersonalisedPlanCategory value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsPersonalisedPlanType ',
					rule =>'enum:PersonalisedPlanCategory=Ac,At,B,L,M,O,S'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R2',
			title => 'PersonalisedPlan/DocumentList Filled',
			description => 'This test validates the DocumentList list in the PersonalisedPlan records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PersonalisedPlan_Document
			},
			tables => ['PersonalisedPlan_Document'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 9, 
					title => 'Location is mandatory', 
					rule => 'notblank:Location'
				},
			],
			weight => 0.1,
		},
		
		{
			id => 'R3',
			title => 'WellbeingResponse Filled',
			description => 'This test validates the wellbeing response records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					WellbeingResponse
			},
			tables => ['WellbeingResponse'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 10, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
                                {
                                        id => 11,
                                        title => 'StudentPersonal_RefId is mandatory',
                                        rule => 'notblank:StudentPersonal_RefId'
                                },
                                {
                                        id => 12,
                                        title => 'SchoolInfo_RefId is mandatory',
                                        rule => 'notblank:SchoolInfo_RefId'
                                },
                                {
                                        id => 13,
                                        title => 'SchoolInfo_RefId points to existing school',
                                        rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                },
                                {
                                        id => 14,
                                        title => 'StudentPersonal_RefId points to existing student',
                                        rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                },
				{
					id => 15, 
					title => 'Date is mandatory', 
					rule => 'notblank:Date'
				},
				{
					id => 16, 
					title => 'WellbeingResponseStartDate is mandatory', 
					rule => 'notblank:WellbeingResponseStartDate'
				},
                                {
                                        id => 17,
                                        title => 'SuspensionContainer_SuspensionCategory uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsSuspensionCategoryType',
                                        rule =>'enum:SuspensionContainer_SuspensionCategory=E,I,O,P,R,S,W,WE'
                                },
                                {
                                        id => 18,
                                        title => 'SuspensionContainer_Status uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingStatusType',
                                        rule =>'enum:SuspensionContainer_Status=O,R,U'
                                },
                                {
                                        id => 19,
                                        title => 'DetentionContainer_DetentionCategory uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsDetentionCategoryType',
                                        rule =>'enum:DetentionContainer_DetentionCategory=A,AR,B,L,MR,O,R'
                                },
                                {
                                        id => 20,
                                        title => 'DetentionContainer_Status uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingStatusType',
                                        rule =>'enum:DetentionContainer_Status=O,R,U'
                                },
                                {
                                        id => 21,
                                        title => 'PlanRequiredContainer_Status uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingStatusType',
                                        rule =>'enum:PlanRequiredContainer_Status=O,R,U'
                                },
                                {
                                        id => 22,
                                        title => 'AwardContainer_Status uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingStatusType',
                                        rule =>'enum:AwardContainer_Status=O,R,U'
                                },
                                {
                                        id => 23,
                                        title => 'OtherWellbeingResponseContainer_Status uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingStatusType',
                                        rule =>'enum:OtherWellbeingResponseContainer_Status=O,R,U'
                                },
			],
			weight => 0.1,
		},

                {       
                        id => 'R4',
                        title => 'WellbeingResponse/Suspension/WithdrawalTimeList Filled',
                        description => 'This test validates the Suspension/WithdrawalTimeList list in the WellbeingResponse records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        WellbeingResponse_SuspensionContainer_WithdrawalTime
                        },
                        tables => ['WellbeingResponse_SuspensionContainer_WithdrawalTime'],
                        rule => 'morethan:0',
                        subtests => [
                                {       
                                        id => 24, 
                                        title => 'WithdrawalDate is mandatory',
                                        rule => 'notblank:WithdrawalDate'
                                },
                                {
                                        id => 25,
                                        title => 'TimeTableSubject_RefId points to existing timetable subject',
                                        rule => 'lookup:TimeTableSubject_RefId=TimeTableSubject/RefId'
                                },
                                {
                                        id => 26,
                                        title => 'ScheduledActivity_RefId points to existing scheduled activity',
                                        rule => 'lookup:ScheduledActivity_RefId=ScheduledActivity/RefId'
                                },
                                {
                                        id => 27,
                                        title => 'TimeTableCell_RefId points to existing timetable cell',
                                        rule => 'lookup:TimeTableCell_RefId=TimeTableCell/RefId'
                                },

                        ],
                        weight => 0.1,
                },

                {               
                        id => 'R5',
                        title => 'WellbeingResponse/PlanRequired/PlanRequiredList Filled',
                        description => 'This test validates the PlanRequired/PlanRequiredList list in the WellbeingResponse records submitted to the database',                              
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingResponse_PlanRequiredContainer_PlanRequired
                        },      
                        tables => ['WellbeingResponse_PlanRequiredContainer_PlanRequired'],
                        rule => 'morethan:0', 
                        subtests => [   
                                {       
                                        id => 28,
                                        title => 'PersonalisedPlan_RefId points to existing personalised plan',
                                        rule => 'lookup:PersonalisedPlan_RefId=PersonalisedPlan/RefId'
                                },      
                        ],              
                        weight => 0.1,
                },              
                                        
                {               
                        id => 'R6',
                        title => 'WellbeingResponse/PersonInvolvementList Filled',
                        description => 'This test validates the PersonInvolvementList list in the WellbeingResponse records submitted to the database',                         
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingResponse_PersonInvolvement
                        },      
                        tables => ['WellbeingResponse_PersonInvolvement'],
                        rule => 'morethan:0',
                        subtests => [   
                                {
                                        id => 29,
                                        title => 'PersonRefId_SIF_RefObject value uses prescribed enums : StudentPersonal, StaffPersonal, StudentContactPersonal',
                                        rule =>'enum:PersonRefId_SIF_RefObject=StudentPersonal,StaffPersonal,StudentContactPersonal'
                                },
                                {
                                        id => 30,
                                        title => 'PersonRefId points to existing school',
                                        rule => 'lookup_sifrefobject:PersonRefId=PersonRefId_SIF_RefObject/RefId'
                                },
                        ],
                        weight => 0.1,
                },

                {
                        id => 'R7',     
                        title => 'WellbeingResponse/DocumentList Filled',
                        description => 'This test validates the DocumentList list in the WellbeingResponse records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingResponse_Document
                        },      
                        tables => ['WellbeingResponse_Document'],
                        rule => 'morethan:0', 
                        subtests => [   
                                {       
                                        id => 31,
                                        title => 'Location is mandatory',
                                        rule => 'notblank:Location'
                                },      
                        ],              
                        weight => 0.1,  
                },              

                {
                        id => 'R8',
                        title => 'WellbeingEvent Filled',
                        description => 'This test validates the wellbeing event records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        WellbeingEvent
                        },
                        tables => ['WellbeingEvent'],
                        rule => 'morethan:0',
                        subtests => [   
                                {       
                                        id => 32, 
                                        title => 'RefId is mandatory',
                                        rule => 'notblank:RefId'
                                },      
                                {       
                                        id => 33, 
                                        title => 'StudentPersonal_RefId is mandatory',
                                        rule => 'notblank:StudentPersonal_RefId'
                                },      
                                {       
                                        id => 34, 
                                        title => 'SchoolInfo_RefId is mandatory',
                                        rule => 'notblank:SchoolInfo_RefId'
                                },      
                                {       
                                        id => 35, 
                                        title => 'SchoolInfo_RefId points to existing school',
                                        rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                },      
                                {       
                                        id => 36, 
                                        title => 'StudentPersonal_RefId points to existing student',
                                        rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                },      
                                {       
                                        id => 37, 
                                        title => 'WellbeingEventCategoryClass is mandatory',
                                        rule =>'notblank:WellbeingEventCategoryClass'
                                },      
                                {       
                                        id => 38, 
                                        title => 'WellbeingEventDate is mandatory',
                                        rule =>'notblank:WellbeingEventDate'
                                },      
                                {       
                                        id => 39, 
                                        title => 'WellbeingEventTimePeriod is mandatory',
                                        rule =>'notblank:WellbeingEventTimePeriod'
                                },      
                                {       
                                        id => 40, 
                                        title => 'WellbeingEventCategoryClass value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingEventCategoryClassType',
                                        rule =>'enum:WellbeingEventCategoryClass=D,N,O,P'
                                },
                                {       
                                        id => 41, 
                                        title => 'WellbeingEventLocationDetails_EventLocation value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingEventLocationType',
                                        rule =>'enum:WellbeingEventLocationDetails_EventLocation=C,Ex,In,L,O,Off,On,Ov,P'
                                },
                                {       
                                        id => 42, 
                                        title => 'WellbeingEventTimePeriod value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingEventTimePeriodType',
                                        rule =>'enum:WellbeingEventTimePeriod=A,AM,B,Ex,O,PM,R,W'
                                },
                                {
                                        id => 43,
                                        title => 'Status uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingStatusType',
                                        rule =>'enum:Status=O,R,U'
                                },
                                {
                                        id => 44,
                                        title => 'ConfidentialFlag uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsYesOrNoCategoryType',
                                        rule =>'enum:ConfidentialFlag=N,U,X,Y'
                                },

                        ],
                        weight => 0.1,
                },
                
                {       
                        id => 'R9',     
                        title => 'WellbeingEvent/DocumentList Filled',
                        description => 'This test validates the DocumentList list in the WellbeingEvent records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingEvent_Document
                        },      
                        tables => ['WellbeingEvent_Document'],
                        rule => 'morethan:0',
                        subtests => [  
                                {       
                                        id => 45,
                                        title => 'Location is mandatory',
                                        rule => 'notblank:Location'
                                },
                        ],             
                        weight => 0.1,
                },

                {
                        id => 'R10',
                        title => 'WellbeingEvent/PersonInvolvementList Filled',
                        description => 'This test validates the PersonInvolvementList list in the WellbeingEvent records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingEvent_PersonInvolvement
                        },
                        tables => ['WellbeingEvent_PersonInvolvement'],
                        rule => 'morethan:0',
                        subtests => [
                                {
                                        id => 46,
                                        title => 'PersonRefId_SIF_RefObject value uses prescribed enums : StudentPersonal, StaffPersonal, StudentContactPersonal',
                                        rule =>'enum:PersonRefId_SIF_RefObject=StudentPersonal,StaffPersonal,StudentContactPersonal'
                                },
                                {
                                        id => 47,
                                        title => 'PersonRefId points to existing school',
                                        rule => 'lookup_sifrefobject:PersonRefId=PersonRefId_SIF_RefObject/RefId'
                                },
                        ],
                        weight => 0.1,
                },

                {
                        id => 'R10',
                        title => 'WellbeingEvent/FollowUpActionList Filled',
                        description => 'This test validates the FollowUpActionList list in the WellbeingEvent records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        WellbeingEvent_FollowupAction
                        },
                        tables => ['WellbeingEvent_FollowupAction'],
                        rule => 'morethan:0',
                        subtests => [
                                {       
                                        id => 48, 
                                        title => 'WellbeingResponse_RefId points to existing wellbring response',
                                        rule => 'lookup:WellbeingResponse_RefId=WellbeingResponse/RefId'
                                },      
                        ],
                        weight => 0.1,
                },

                {
                        id => 'R11',
                        title => 'WellbeingCharacteristic Filled',
                        description => 'This test validates the wellbeing characteristic records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        WellbeingCharacteristic
                        },
                        tables => ['WellbeingCharacteristic'],
                        rule => 'morethan:0',
                        subtests => [
                                {
                                        id => 49,
                                        title => 'RefId is mandatory',
                                        rule => 'notblank:RefId'
                                },
                                {
                                        id => 50,
                                        title => 'StudentPersonal_RefId is mandatory',
                                        rule => 'notblank:StudentPersonal_RefId'
                                },
                                {
                                        id => 51,
                                        title => 'SchoolInfo_RefId points to existing school',
                                        rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                },
                                {
                                        id => 52,
                                        title => 'StudentPersonal_RefId points to existing student',
                                        rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                },
                                {
                                        id => 53,
                                        title => 'WellbeingCharacteristicClassification value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingCharacteristicClassificationType',
                                        rule =>'enum:WellbeingCharacteristicClassification=D,M,O,S'
                                },
                                {
                                        id => 54,
                                        title => 'WellbeingCharacteristicConfidentialFlag uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsYesOrNoCategoryType',
                                        rule =>'enum:WellbeingCharacteristicConfidentialFlag=N,U,X,Y'
                                },
                                {
                                        id => 55,
                                        title => 'WellbeingCharacteristicAlert uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsYesOrNoCategoryType',
                                        rule =>'enum:WellbeingCharacteristicAlert=N,U,X,Y'
                                },

                        ],
                        weight => 0.1,
                },

                {      
                        id => 'R12',    
                        title => 'WellbeingCharacteristic/DocumentList Filled',
                        description => 'This test validates the DocumentList list in the WellbeingCharacteristic records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingCharacteristic_Document
                        },     
                        tables => ['WellbeingCharacteristic_Document'],
                        rule => 'morethan:0',
                        subtests => [ 
                                {      
                                        id => 56,
                                        title => 'Location is mandatory',
                                        rule => 'notblank:Location'
                                },
                        ],
                        weight => 0.1,
                },

                {
                        id => 'R13',
                        title => 'WellbeingAppeal Filled',
                        description => 'This test validates the wellbeing appeal records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        WellbeingAppeal
                        },
                        tables => ['WellbeingAppeal'],
                        rule => 'morethan:0',
                        subtests => [
                                {
                                        id => 57,
                                        title => 'RefId is mandatory',
                                        rule => 'notblank:RefId'
                                },
                                {
                                        id => 58,
                                        title => 'StudentPersonal_RefId is mandatory',
                                        rule => 'notblank:StudentPersonal_RefId'
                                },
                                {
                                        id => 59,
                                        title => 'SchoolInfo_RefId is mandatory',
                                        rule => 'notblank:SchoolInfo_RefId'
                                },
                                {
                                        id => 60,
                                        title => 'SchoolInfo_RefId points to existing school',
                                        rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                },
                                {
                                        id => 61,
                                        title => 'StudentPersonal_RefId points to existing student',
                                        rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                },
                                {
                                        id => 62,
                                        title => 'WellbeingResponse_RefId is mandatory',
                                        rule =>'notblank:WellbeingResponse_RefId'
                                },
                                {
                                        id => 63,
                                        title => 'WellbeingResponse_RefId points to existing wellbeing response',
                                        rule => 'lookup:WellbeingResponse_RefId=WellbeingResponse/RefId'
                                },
                                {
                                        id => 64,
                                        title => 'AppealStatusCode value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingAppealStatusType',
                                        rule =>'enum:AppealStatusCode=N,N/S,RE,SU'
                                },
                        ],
                        weight => 0.1,
                },

                {
                        id => 'R14',
                        title => 'WellbeingAppeal/DocumentList Filled',
                        description => 'This test validates the DocumentList list in the WellbeingAppeal records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM    
                                        WellbeingAppeal_Document
                        },
                        tables => ['WellbeingAppeal_Document'],
                        rule => 'morethan:0',
                        subtests => [
                                {
                                        id => 65,
                                        title => 'Location is mandatory',
                                        rule => 'notblank:Location'
                                },
                        ],
                        weight => 0.1,
                },

                {       
                        id => 'R15',
                        title => 'WellbeingAlert Filled',
                        description => 'This test validates the wellbeing alert records submitted to the database',
                        query => q{
                                SELECT
                                        *
                                FROM
                                        WellbeingAlert
                        },
                        tables => ['WellbeingAlert'],
                        rule => 'morethan:0',
                        subtests => [   
                                {       
                                        id => 66,
                                        title => 'RefId is mandatory',
                                        rule => 'notblank:RefId'
                                },      
                                {       
                                        id => 67,
                                        title => 'StudentPersonal_RefId is mandatory',
                                        rule => 'notblank:StudentPersonal_RefId'
                                },      
                                {       
                                        id => 68,
                                        title => 'SchoolInfo_RefId is mandatory',
                                        rule => 'notblank:SchoolInfo_RefId'
                                },      
                                {       
                                        id => 69,
                                        title => 'SchoolInfo_RefId points to existing school',
                                        rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
                                },      
                                {       
                                        id => 70,
                                        title => 'StudentPersonal_RefId points to existing student',
                                        rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
                                },      
                                {       
                                        id => 71,
                                        title => 'Date is mandatory',
                                        rule =>'notblank:Date'
                                },      
                                {       
                                        id => 72,
                                        title => 'WellbeingAlertStartDate is mandatory',
                                        rule =>'notblank:WellbeingAlertStartDate'
                                },      
                                {       
                                        id => 73,
                                        title => 'WellbeingAlertCategory value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsWellbeingAlertCategoryType',
                                        rule =>'enum:WellbeingAlertCategory=D,E,L,M,O,P,S'
                                },
                                {
                                        id => 74,
                                        title => 'EnrolmentRestricted uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/3.4.3/CodeSets.html#AUCodeSetsYesOrNoCategoryType',
                                        rule =>'enum:EnrolmentRestricted=N,U,X,Y'
                                },

                        ],
                        weight => 0.1,
                },


        

	]
};






__END__

COMMON
