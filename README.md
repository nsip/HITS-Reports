HITS-Reports
============

See http://hits.dev.nsip.edu.au/

Configuration File
==================
Create a ~/.nsip_sif_data

	mysql_dsn_hits: 'dbi:mysql:database=hits'
	mysql_user: 'login'
	mysql_password: 'password'
	mysql_dsn_template: 'dbi:mysql:database=TEMPLATE'

Run a Report
============
perl bin/report {TemplateId} {ConfigFile}


Report Rules
============
The rules are defined in lib/HITS/Report/Rules.pm

Each rule defines an SQL query ("query", typically, retrieve all rows of a table), 
a cardinality ("rule", either "zero" or "morethan:n" for an integer n)
and a set of subtests to run over the results ("subtests").

Different databases may have different tables implemented; to confirm that the required table is in the database,
the tables queried are also listed, as an array. ("tables") If any of the tables is not in the database, the test 
is ignored.

Each subtest has an ID, a title, and a rule which is applied to every row in the query results.
The rule is of format: RULE_NAME:RULE_BODY
Each rule name corresponds to a method in Rules.pm
Each rule method gets a result row from the database as a hash, and a rule body, as follows:

 * lookup:field=Table/field 
   * confirm that, for field1=Table/field2, the RefId in field1 is a RefId of Table
 * notblank:field
   * confirm that field is not empty (non null)
 * enums:field=a,b,c
   * confirm that the value of field is restricted to one of the following enum values
 * subquerycount:field=Table/joinfield
   * confirm that at least one instance of Table/joinfield corresponds to field
   * used for SQL tables representing lists in SIF objects, to ensure those lists are not empty
 * subquerymatch: field=Table/matchfield;myrefIdField=Table/joinrefIdfield
   * used to match a field in the current object with a field in another object (other than RefId), via a join
   * confirm that at least one instance of Table/joinrefIdField corresponds to myrefIdField
   * AND that in the same instance, Table/matchfield matches field
   * e.g. schoolLocalId=SchoolInfo/LocalId;schoolRefId=SchoolInfo/RefId :
      * confirm that schoolRefId points to a school refId in the database
      * and that schoolLocalId points to the local school Id for the same school
 * subquerymatch_twotables: field=Table2/matchfield;myrefIdField=Table1/joinrefIdfield;Table1/Field1=Table2/Field2
   * used to match a field in the current object with a field in another object (other than RefId), via a join of two tables
   * confirm that at least one instance of Table1/joinrefIdField corresponds to myrefIdField (join)
   * AND that in the same instance, Table1/Field1 matches Table2/Field2 (join)
   * AND that Table2/matchfield matches field
   * e.g. RoomInfo_RefId=TimeTableCell/RoomInfo_RefId;ScheduledActivity_RefId=ScheduledActivty/RefId;ScheduledActivity/TimeTableCell_RefId=TimeTableCell/RefId

Report Config File
==================
	title: '',
	description: '',
	tests: [
		{
			id: 1,
			title: '',
			description: '',
			query: ''
			rule: 'zero',
			subtests: [
				{
					id: 1,
					title: 'Has a valid ref id',
					rule: 'lookup:SchoolInfo_RefId=SchoolInfo/RefId'
				}
			]
		}
	],

Output
======

	{
		"tests": [
			{
				"id": 1,
				"title": "TeachingGroups Filled",
				"errors": [
					{
						"subtest": 4,
						"data": {
							"RefId": "9c614156-e19a-4107-9b14-279d11eb2df5",
							"LocalId": "Room 506",
							"ShortName": "BIO",
							"SchoolInfo_RefId": "0E59D1D8-C43F-11E3-9050-E0F4DBD909AB",
							"LongName": "Biology",
							"SchoolYear": "7",
							"KLA": ""
						},
						"details": "Input (KLA = ) must not be blank\n"
					},
				],
				"score": 98,
				"weight": "0.5"
			},
		],
	}

Maintenance
===========
If you add a new report:

1. Edit lib/HITS/Report/Rules.pm _lookups(), to add any new database tables containing RefIds that need to be tested against
2. If you need any new rules, you will need to edit Edit lib/HITS/Report/Rules.pm to add a new sub, patterned after the existing rules
3. Add a new directory for the report
4. Add a file in.pl to the directory, patterned after the existing report scripts
5. Add tests to the tests => [] array. Each test validates the results of a single database query (typically a query for all instances of an object)
6. Add subtests to each test.
   * Ensure that mandatory elements and enum types are included in subtest validation


Presentation
============

