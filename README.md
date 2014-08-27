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
The rules are define in lib/HITS/Report/Rules.pm

Each method gets the row from the database as a hash and a rule as follows:

 * lookup:field=Table/field
 * notblank:field
 * enums:field=a,b,c
 * subquerycount:field=Table/field

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

Presentation
============

