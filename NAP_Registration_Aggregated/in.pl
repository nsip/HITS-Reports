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
                                #				{
                                #	id => 7, 
                                #	title => 'Sex uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSexCodeType ', 
                                #	rule =>'enum:Sex=1,2,3,9'
                                #},
				{
					id => 8, 
					title => 'YearLevel is mandatory',
					rule =>'notblank:YearLevel'
				},
                                #{
                                #	id => 9, 
                                #	title => 'YearLevel uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYearLevelCodeType ',
                                #	rule =>'enum:YearLevel=1,2,3,4,5,6,7,8,9,10,11,12,13,CC,K,K3,K4,P,PS,UG'
                                #},
				{
					id => 10, 
					title => 'IndigenousStatus is mandatory',
					rule =>'notblank:IndigenousStatus'
				},
                                #{
                                #	id => 11, 
                                #	title => 'IndigenousStatus uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsIndigenousStatusType ',
                                #	rule =>'enum:IndigenousStatus=1,2,3,4,9'
                                #},
                                #{
                                #	id => 13, 
                                #	title => 'LBOTE uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
                                #	rule =>'enum:LBOTE=N,U,X,Y'
                                #},
                                

				{
					id => 22, 
					title => 'MostRecent_Parent1SchoolEducation is mandatory',
					rule =>'notblank:MostRecent_Parent1SchoolEducation'
				},
                                #{
                                #	id => 23, 
                                #	title => 'MostRecent_Parent1SchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
                                #	rule =>'enum:MostRecent_Parent1SchoolEducation=0,1,2,3,4'
                                #},
				{
					id => 24, 
					title => 'MostRecent_Parent2SchoolEducation is mandatory',
					rule =>'notblank:MostRecent_Parent2SchoolEducation'
				},
                                #{
                                #	id => 25, 
                                #	title => 'MostRecent_Parent2SchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsSchoolEducationLevelTypeType ',
                                #	rule =>'enum:MostRecent_Parent2SchoolEducation=0,1,2,3,4'
                                #},
				{
					id => 26, 
					title => 'MostRecent_Parent1SchoolNonEducation is mandatory',
					rule =>'notblank:MostRecent_Parent1NonSchoolEducation'
				},
                                #{
                                #	id => 27, 
                                #	title => 'MostRecent_Parent1NonSchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
                                #	rule =>'enum:MostRecent_Parent1NonSchoolEducation=0,5,6,7,8'
                                #},
				{
					id => 28, 
					title => 'MostRecent_Parent2SchoolNonEducation is mandatory',
					rule =>'notblank:MostRecent_Parent2NonSchoolEducation'
				},
                                #{
                                #	id => 29, 
                                #	title => 'MostRecent_Parent2NonSchoolEducation uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsNonSchoolEducationType ',
                                #	rule =>'enum:MostRecent_Parent2NonSchoolEducation=0,5,6,7,8'
                                #},
				{
					id => 30, 
					title => 'MostRecent_Parent1EmploymentType is mandatory',
					rule =>'notblank:MostRecent_Parent1EmploymentType'
				},
                                #{
                                #	id => 31, 
                                #	title => 'MostRecent_Parent1EmploymentType uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ',
                                #	rule =>'enum:MostRecent_Parent1EmploymentType=1,2,3,4,8,9'
                                #},
				{
					id => 32, 
					title => 'MostRecent_Parent2EmploymentType is mandatory',
					rule =>'notblank:MostRecent_Parent2EmploymentType'
				},
                                #{
                                #	id => 33, 
                                #	title => 'MostRecent_Parent2EmploymentType uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsEmploymentTypeType ',
                                #	rule =>'enum:MostRecent_Parent2EmploymentType=1,2,3,4,8,9'
                                #},
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
					rule =>'notblank:CountryofBirth'
				},
				# not writing an enum validator for http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsStandardAustralianClassificationOfCountriesSACCType . The only real validation is four-digit number, which the current ruls language cannot represent 
				{
					id => 37, 
					title => 'FFPOS is mandatory',
					rule =>'notblank:MostRecent_FFPOS'
				},
                                #{
                                #	id => 38, 
                                #	title => 'FFPOS uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsFFPOSStatusCodeType ',
                                #	rule =>'enum:MostRecent_FFPOS=1,2,9'
                                #},
                                #{
                                #	id => 39, 
                                #	title => 'OfflineDelivery uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
                                #	rule =>'enum:OfflineDelivery=N,U,X,Y'
                                #},
                                #{
                                #	id => 40, 
                                #	title => 'Sensitive uses prescribed SIF enum: http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ',
                                ##	rule =>'enum:SensitiveData=N,U,X,Y'
                                #},
                                {
                                        id => 41,
                                        title => 'TestLevel is mandatory',
                                        rule =>'notblank:MostRecent_TestLevel',
                                },
                                #{
                                #        id => 42,
                                #        title => 'TestLevel uses prescribed SIF enum: 3,5,7,9',
                                #        rule =>'enum:MostRecent_TestLevel=3,5,7,9',
                                #},
				{
					id => 43, 
					title => 'MostRecent_SchoolACARAId is mandatory',
					rule =>'notblank:MostRecent_SchoolACARAId'
				},
				{
					id => 44, 
					title => 'MostRecent_SchoolLocalId is mandatory',
					rule =>'notblank:MostRecent_SchoolLocalId'
				},
				{
                                        id => 45,
                                        title => 'Must have a registered language',
                                        rule => 'subquerycount:RefId=Language/Person_RefId'
                                },
			],
			weight => 0.1,
		},
	]
};


__END__

COMMON
