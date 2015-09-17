{
	title => 'Enrolment Report',
	description => 'Test Enrolment data has been created correctly',

# commenting out all tests on redundant data, which we cannot currently perform as the database receiving the SIF payloads is normalised

	tests => [
		{
			id => 'R1',
			title => 'StudentPersonal Filled',
			description => 'This test validates the student records submitted to the database',
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
					title => 'LocalId is mandatory', 
					rule => 'notblank:LocalId'
				},
				{
					id => 3, 
					title => 'FamilyName is mandatory', 
					rule => 'notblank:FamilyName'
				},
				{
					id => 4, 
					title => 'GivenName is mandatory', 
					rule => 'notblank:GivenName'
				},
				{
					id => 5, 
					title => 'SchoolInfoRefId points to existing school', 
					rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
					id => 6, 
					title => 'MostRecent/Parent1EmploymentType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ', 
					rule =>'enum:MostRecent_Parent1EmploymentType=1,2,3,4,8,9'
				},
				{
					id => 7, 
					title => 'MostRecent/Parent2EmploymentType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ', 
					rule =>'enum:MostRecent_Parent2EmploymentType=1,2,3,4,8,9'
				},
				{
					id => 8, 
					title => 'MostRecent/Parent1SchoolEducation uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
					rule =>'enum:MostRecent_Parent1SchoolEducation=0,1,2,3,4'
				},
				{
					id => 9, 
					title => 'MostRecent/Parent2SchoolEducation uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
					rule =>'enum:MostRecent_Parent2SchoolEducation=0,1,2,3,4'
				},
				{
					id => 10, 
					title => 'MostRecent/Parent1NonSchoolEducation uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
					rule =>'enum:MostRecent_Parent1NonSchoolEducation=0,5,6,7,8'
				},
				{
					id => 11, 
					title => 'MostRecent/Parent1NonSchoolEducation uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
					rule =>'enum:MostRecent_Parent1NonSchoolEducation=0,5,6,7,8'
				},
				{
						id => 12,
						title => 'YearLevel uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYearLevelCodeType ',
						rule => 'enum:YearLevel=1,2,3,4,5,6,7,8,9,10,11,11,12,13,CC,K,K3,K4,P,PS,UG'
				},
			],
			weight => 0.1,
		},


		{
			id => 'R2',
			title => 'StudentSchoolEnrollment Filled',
			description => 'This test validates the student enrollment records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentSchoolEnrollment
			},
			tables => ['StudentSchoolEnrollment'],
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
				{
						id => 23,
						title => 'StudentPersonalRefId points to existing student',
						rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
				},
				{
						id => 24,
						title => 'SchoolInfoRefId is mandatory',
						rule => 'notblank:SchoolInfo_RefId'
				},
				{
						id => 25,
						title => 'SchoolInfoRefId points to existing school',
						rule => 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				},
				{
						id => 26,
						title => 'MembershipType is mandatory',
						rule => 'notblank:MembershipType'
				},
				{
					id => 27, 
					title => 'MembershipType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEnrollmentTypeType ',
					rule =>'enum:MembershipType=01,02,03'
				},
				{
						id => 28,
						title => 'TimeFrame is mandatory',
						rule => 'notblank:TimeFrame'
				},
				{
					id => 29, 
					title => 'TimeFrame uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEnrollmentTimeFrameType ',
					rule =>'enum:TimeFrame=C,F,H'
				},
				{
						id => 30,
						title => 'SchoolYear is mandatory',
						rule => 'notblank:SchoolYear'
				},
				{
					id => 31, 
					title => 'SchoolYear between 2000 and 2020 ',
					rule =>'enum:SchoolYear=2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020'
				},
				{
						id => 32,
						title => 'EntryDate is mandatory',
						rule => 'notblank:EntryDate'
				},
				{
						id => 33,
						title => 'YearLevel uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYearLevelCodeType ',
						rule => 'enum:YearLevel=1,2,3,4,5,6,7,8,9,10,11,11,12,13,CC,K,K3,K4,P,PS,UG'
				},
				{
						id => 34,
						title => 'RecordClosureReason uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/SIFAU.html#obj:StudentSchoolEnrollment ',
						rule => 'enum:RecordClosureReason=SchoolExit,TimeDependentDataChange,EndOfYear,CampusExit'
				},
				{
						id => 35,
						title => 'PromotionStatus uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/SIFAU.html#obj:StudentSchoolEnrollment ',
						rule => 'enum:PromotionStatus=Promoted,Demoted,Retained,NA'
				},
			],
			weight => 0.1,
		},


		{
			id => 'R3',
			title => 'Address Filled',
			description => 'This test validates the address lists submitted to the database',
			query => q{
				SELECT
					*
				FROM
					Address
			},
			tables => ['Address'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 41, 
					title => 'City is mandatory', 
					rule => 'notblank:City'
				},
			   {
						id => 42,
						title => 'PostalCode is mandatory',
						rule => 'notblank:PostalCode'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R4',
			title => 'LangugeList Filled',
			description => 'This test validates the language lists submitted to the database',
			query => q{
				SELECT
					*
				FROM
					Language
			},
			tables => ['Language'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 51, 
					title => 'LanguageCode is mandatory', 
					rule => 'notblank:LanguageCode'
				},
			   {
						id => 52,
						title => 'LanguageType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsLanguageTypeType ',
						rule => 'enum:LanguageType=1,2,3,4,5,6,9'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R5',
			title => 'StudentContactPersonal Filled',
			description => 'This test validates the student contact records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentContactPersonal
			},
			tables => ['StudentContactPersonal'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 61, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 62, 
					title => 'FamilyName is mandatory', 
					rule => 'notblank:FamilyName'
				},
				{
					id => 63, 
					title => 'GivenName is mandatory', 
					rule => 'notblank:GivenName'
				},
				{
					id => 64, 
						title => 'EmailType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmailTypeType ',
						rule => 'enum:EmailType=01,02,03,04,05,06,07'
				},
				{
					id => 65, 
						title => 'PhoneNumberType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsTelephoneNumberTypeType ',
						rule => 'enum:PhoneNumberType=0096,0350,0359,0370,0400,0426,0437,0448,0478,0486,0777,0779,0887,0888,0889,2364'
				},
				{
					id => 66, 
					title => 'EmploymentType uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ', 
					rule =>'enum:EmploymentType=1,2,3,4,8,9'
				},
				{
					id => 67, 
					title => 'SchoolEducationLevel uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
					rule =>'enum:SchoolEducationLevel=0,1,2,3,4'
				},
				{
					id => 68, 
					title => 'NonSchoolEducation uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
					rule =>'enum:NonSchoolEducation=0,5,6,7,8'
				},
			],
			weight => 0.1,
		},


		{
			id => 'R6',
			title => 'StudentContactRelationship Filled',
			description => 'This test validates the student contact relationship records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StudentContactRelationship
			},
			tables => ['StudentContactRelationship'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 81, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
			   {
						id => 82,
						title => 'StudentPersonalRefId is mandatory',
						rule => 'notblank:StudentPersonal_RefId'
				},
				{
						id => 83,
						title => 'StudentPersonalRefId points to existing student',
						rule => 'lookup:StudentPersonal_RefId=StudentPersonal/RefId'
				},
				{
						id => 84,
						title => 'StudentContactPersonalRefId is mandatory',
						rule => 'notblank:StudentContactPersonal_RefId'
				},
				{
						id => 85,
						title => 'StudentContactPersonalRefId points to existing school',
						rule => 'lookup:StudentContactPersonal_RefId=StudentContactPersonal/RefId'
				},
				{
					id => 86, 
					title => 'Relationship is mandatory', 
					rule => 'notblank:Relationship'
				},
				{
					id => 87, 
						title => 'Relationship uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsRelationshipToStudentType ',
						rule => 'enum:Relationship=01,02,03,04,05,06,07,08,09,10,11,12,13,99'
				},
				{
					id => 88, 
						title => 'ParentLegalGuardian uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:ParentLegalGuardian=N,U,X,Y'
				},
				{
					id => 89, 
						title => 'PickupRights uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:PickupRights=N,U,X,Y'
				},
				{
					id => 90, 
						title => 'LivesWith uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:LivesWith=N,U,X,Y'
				},
				{
					id => 91, 
						title => 'AccessToRecords uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:AccessToRecords=N,U,X,Y'
				},
				{
					id => 92, 
						title => 'EmergencyContact uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:EmergencyContact=N,U,X,Y'
				},
				{
					id => 93, 
						title => 'HasCustody uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:HasCustody=N,U,X,Y'
				},
				{
					id => 94, 
						title => 'DisciplinaryContact uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:DisciplinaryContact=N,U,X,Y'
				},
				{
					id => 95, 
						title => 'PrimaryCareProvider uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:PrimaryCareProvider=N,U,X,Y'
				},
				{
					id => 96, 
						title => 'FeesBilling uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:FeesBilling=N,U,X,Y'
				},
				{
					id => 97, 
						title => 'FamilyMail uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:FamilyMail=N,U,X,Y'
				},
				{
					id => 98, 
						title => 'InterventionOrder uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
						rule => 'enum:InterventionOrder=N,U,X,Y'
				},
				
			],
			weight => 0.1,
		},

	]
};


__END__

COMMON
