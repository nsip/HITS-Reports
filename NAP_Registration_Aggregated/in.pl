{
	title => 'NAPLAN Registration Report (aggregated)',
	description => 'NAPLAN Registration data has been created correctly. Intended for school systems, which are submitting StudentPersonal and StudentSchoolEnrollment objects. ',

	tests => [
		{
			id => '1',
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
					title => 'BirthDate is mandatory', 
					rule => 'notblank:BirthDate'
				},
				{
					id => 6, 
					title => 'Sex is mandatory', 
					rule =>'notblank:Sex'
				},
				{
					id => 7, 
					title => 'Sex uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSexCodeType ', 
					rule =>'enum:Sex=1,2,3,9'
				},
				{
					id => 8, 
					title => 'YearLevel is mandatory',
					rule =>'notblank:YearLevel'
				},
				{
					id => 9, 
					title => 'YearLevel uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYearLevelCodeType ',
					rule =>'enum:YearLevel=1,2,3,4,5,6,7,8,9,10,11,12,13,CC,K,K3,K4,P,PS,UG'
				},
				{
					id => 10, 
					title => 'IndigenousStatus is mandatory',
					rule =>'notblank:IndigenousStatus'
				},
				{
					id => 11, 
					title => 'IndigenousStatus uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsIndigenousStatusType ',
					rule =>'enum:IndigenousStatus=1,2,3,4,9'
				},
				{
					id => 12, 
					title => 'LBOTE is mandatory',
					rule =>'notblank:LBOTE'
				},
				{
					id => 13, 
					title => 'LBOTE uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
					rule =>'enum:LBOTE=N,U,X,Y'
				},
				{
					id => 14, 
					title => 'MostRecent_Parent1Sex is mandatory',
					rule =>'notblank:MostRecent_Parent1Sex'
				},
				{
					id => 15, 
					title => 'MostRecent_Parent1Sex uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSexCodeType ',
					rule =>'enum:MostRecent_Parent1Sex=1,2,3,9'
				},
				{
					id => 16, 
					title => 'MostRecent_Parent2Sex is mandatory',
					rule =>'notblank:MostRecent_Parent2Sex'
				},
				{
					id => 17, 
					title => 'MostRecent_Parent2Sex uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSexCodeType ',
					rule =>'enum:MostRecent_Parent2Sex=1,2,3,9'
				},
				{
					id => 18, 
					title => 'MostRecent_Parent1Relationship is mandatory',
					rule =>'notblank:MostRecent_Parent1Relationship'
				},
				{
					id => 19, 
					title => 'MostRecent_Parent1Relationship uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsRelationshipToStudentType ',
					rule =>'enum:MostRecent_Parent1Relationship=01,02,03,04,05,06,07,08,09,10,11,12,13,19'
				},
				{
					id => 20, 
					title => 'MostRecent_Parent2Relationship is mandatory',
					rule =>'notblank:MostRecent_Parent2Relationship'
				},
				{
					id => 21, 
					title => 'MostRecent_Parent2Relationship uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsRelationshipToStudentType ',
					rule =>'enum:MostRecent_Parent2Relationship=01,02,03,04,05,06,07,08,09,10,11,12,13,19'
				},
				{
					id => 22, 
					title => 'MostRecent_Parent1SchoolEducation is mandatory',
					rule =>'notblank:MostRecent_Parent1SchoolEducation'
				},
				{
					id => 23, 
					title => 'MostRecent_Parent1SchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
					rule =>'enum:MostRecent_Parent1SchoolEducation=0,1,2,3,4'
				},
				{
					id => 24, 
					title => 'MostRecent_Parent2SchoolEducation is mandatory',
					rule =>'notblank:MostRecent_Parent2SchoolEducation'
				},
				{
					id => 25, 
					title => 'MostRecent_Parent2SchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
					rule =>'enum:MostRecent_Parent2SchoolEducation=0,1,2,3,4'
				},
				{
					id => 26, 
					title => 'MostRecent_Parent1SchoolNonEducation is mandatory',
					rule =>'notblank:MostRecent_Parent1NonSchoolEducation'
				},
				{
					id => 27, 
					title => 'MostRecent_Parent1NonSchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
					rule =>'enum:MostRecent_Parent1NonSchoolEducation=0,5,6,7,8'
				},
				{
					id => 28, 
					title => 'MostRecent_Parent2SchoolNonEducation is mandatory',
					rule =>'notblank:MostRecent_Parent2NonSchoolEducation'
				},
				{
					id => 29, 
					title => 'MostRecent_Parent2NonSchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
					rule =>'enum:MostRecent_Parent2NonSchoolEducation=0,5,6,7,8'
				},
				{
					id => 30, 
					title => 'MostRecent_Parent1EmploymentType is mandatory',
					rule =>'notblank:MostRecent_Parent1EmploymentType'
				},
				{
					id => 31, 
					title => 'MostRecent_Parent1EmploymentType uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ',
					rule =>'enum:MostRecent_Parent1EmploymentType=1,2,3,4,8,9'
				},
				{
					id => 32, 
					title => 'MostRecent_Parent2EmploymentType is mandatory',
					rule =>'notblank:MostRecent_Parent2EmploymentType'
				},
				{
					id => 33, 
					title => 'MostRecent_Parent2EmploymentType uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ',
					rule =>'enum:MostRecent_Parent2EmploymentType=1,2,3,4,8,9'
				},
				{
					id => 34, 
					title => 'MostRecent_Parent1Language is mandatory',
					rule =>'notblank:MostRecent_Parent1Language'
				},
				# not writing an enum validator for http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAustralianStandardClassificationOfLanguagesASCLType . The only real validation is four-digit number, which the current ruls language cannot represent 
				{
					id => 35, 
					title => 'MostRecent_Parent2Language is mandatory',
					rule =>'notblank:MostRecent_Parent2Language'
				},
				{
					id => 36, 
					title => 'CountryOfBirth is mandatory',
					rule =>'notblank:CountryOfBirth'
				},
				# not writing an enum validator for http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsStandardAustralianClassificationOfCountriesSACCType . The only real validation is four-digit number, which the current ruls language cannot represent 
				{
					id => 37, 
					title => 'FFPOS is mandatory',
					rule =>'enum:LBOTE=N,U,X,Y'
				},
				{
					id => 38, 
					title => 'FFPOS uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsFFPOSStatusCodeType ',
					rule =>'enum:FFPOS=1,2,9'
				},
				{
					id => 39, 
					title => 'ESL is mandatory',
					rule =>'notblank:ESL'
				},
				{
					id => 40, 
					title => 'ESL uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
					rule =>'enum:FFPOS=N,U,X,Y'
				},
				{
					id => 39, 
					title => 'ParentPermissionForMatching is mandatory',
					rule =>'notblank:ParentPermissionForMatching'
				},
				{
					id => 40, 
					title => 'ParentPermissionForMatching uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
					rule =>'enum:ParentPermissionForMatching=N,U,X,Y'
				},
				{
					id => 41, 
					title => 'MostRecent_SchoolACARAId is mandatory',
					rule =>'notblank:MostRecent_SchoolACARAId'
				},
				{
					id => 42, 
					title => 'MostRecent_SchoolLocalId is mandatory',
					rule =>'notblank:MostRecent_SchoolLocalId'
				},
			],
			weight => 0.1,
		},

		{
			id => '2',
			title => 'StaffPersonal Filled',
			description => 'This test validates the staff personal records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					StaffPersonal
			},
			tables => ['StaffPersonal'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 51, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 52, 
					title => 'LocalId is mandatory', 
					rule => 'notblank:LocalId'
				},
				{
					id => 53, 
					title => 'FamilyName is mandatory',
					rule => 'notblank:FamilyName'
				},
				{
					id => 54, 
					title => 'GivenName is mandatory', 
					rule => 'notblank:GivenName'
				},
				{
					id => 55, 
					title => 'Email is mandatory', 
					rule => 'notblank:Email'
				},

			],
			weight => 0.1,
		},
		
		{
			id => '3',
			title => 'SystemRole Filled',
			description => 'This test validates the system role records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					SystemRole
			},
			tables => ['SystemRole'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 101, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 102, 
					title => 'SIF_RefId is mandatory', 
					rule => 'notblank:LocalId'
				},
				{
					id => 103, 
					title => 'SIF_RefId points to existing staff record', 
					rule => 'lookup:SIF_RefId=StaffPersonal/RefId'
				},
{
					id => 104, 
					title => 'object has a role scope', 
					rule => 'subquerycount:RefId=SystemRole_RoleScope/SystemRoleRefId'
				},
			],
			weight => 0.1,
		},

		{
			id => '3',
			title => 'SystemRole_RoleScope Filled',
			description => 'This test validates the role scope entries (= School IDs) for system role records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					SystemRole_RoleScope
			},
			tables => ['SystemRole_RoleScope'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 111, 
					title => 'RoleScopeName is mandatory', 
					rule => 'notblank:RoleScopeName'
				},
				
			],
			weight => 0.1,
		},

	]
};


__END__

COMMON
