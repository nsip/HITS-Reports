{
	title => 'Financials Report',
	description => 'Financials data has been created correctly',


	tests => [
		{
			id => 'R1',
			title => 'Invoice Filled',
			description => 'This test validates the invoice records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					Invoice
			},
			tables => ['Invoice'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 1, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 2, 
					title => 'InvoicedEntity is mandatory', 
					rule => 'notblank:InvoicedEntity'
				},
				{
					id => 3, 
					title => 'InvoicedEntity_SIFRefObject is mandatory', 
					rule => 'notblank:InvoicedEntity_SIFRefObject'
				},
				{
					id => 10, 
					title => 'InvoicedEntity_SIFRefObject value uses prescribed enums : Debtor, PurchaseOrder ', 
					rule =>'enum:InvoicedEntity_SIFRefObject=Debtor,PurchaseOrder'
				},
				{
					id => 4, 
					title => 'InvoicedEntity points to existing school', 
					rule => 'lookup_sifrefobject:InvoicedEntity=InvoicedEntity_SIFRefObject/RefId'
				},
				{
					id => 5, 
					title => 'BillingDate is mandatory', 
					rule =>'notblank:BillingDate'
				},
				{
					id => 6, 
					title => 'TransactionDescription is mandatory', 
					rule =>'notblank:TransactionDescription'
				},
				{
					id => 7, 
					title => 'BilledAmount is mandatory', 
					rule =>'notblank:BilledAmount'
				},
				{
					id => 8, 
					title => 'BilledAmountType is mandatory', 
					rule =>'notblank:BilledAmountType'
				},
				{
					id => 9, 
					title => 'BilledAmountType value uses prescribed enums : Debit, Credit ', 
					rule =>'enum:BilledAmountType=Debit,Credit'
				},
				{
					id => 11, 
					title => 'Ledger is mandatory', 
					rule =>'notblank:Ledger'
				},
				{
					id => 12, 
					title => 'Ledger value uses prescribed enums : Creditor, Family, Sundry ', 
					rule =>'enum:Ledger=Creditor,Family,Sundry'
				},
				{
					id => 13, 
					title => 'LocationInfoRefId points to existing location', 
					rule =>'lookup:LocationInfoRefId=LocationInfo/RefId'
				},
				{
					id => 14, 
					title => 'RelatedPurchaseOrderRefId points to existing purchase order', 
					rule =>'lookup:RelatedPurchaseOrderRefId=PurchaseOrder/RefId'
				},
				{
					id => 15, 
					title => 'Voluntary value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsYesOrNoCategoryType ', 
					rule =>'enum:Voluntary=N,U,X,Y'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R2',
			title => 'Invoice/FinancialAccountRefIdList Filled',
			description => 'This test validates the FinancialAccountRefId list in the Invoice records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					Invoice_FinancialAccount
			},
			tables => ['Invoice_FinancialAccount'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 26, 
					title => 'FinancialAccount_RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 27, 
					title => 'FinancialAccount_RefId points to existing financial account', 
					rule => 'lookup:FinancialAccount_RefId=FinancialAccount/RefId'
				},
			],
			weight => 0.1,
		},
		
		{
			id => 'R3',
			title => 'FinancialAccount Filled',
			description => 'This test validates the financial account records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					FinancialAccount
			},
			tables => ['FinancialAccount'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 28, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 29, 
					title => 'LocationInfo_RefId points to existing financial account', 
					rule => 'lookup:LocationInfo_RefId=LocationInfo/RefId'
				},
				{
					id => 30, 
					title => 'AccountNumber is mandatory', 
					rule => 'notblank:AccountNumber'
				},
				{
					id => 31, 
					title => 'Name is mandatory', 
					rule => 'notblank:Name'
				},
			],
			weight => 0.1,
		},
	
		{
			id => 'R5',
			title => 'ChargedLocationInfo Filled',
			description => 'This test validates the chargeable location records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					LocationInfo
			},
			tables => ['LocationInfo'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 38, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 39, 
					title => 'LocationType is mandatory', 
					rule => 'notblank:LocationType'
				},
				{
					id => 40, 
					title => 'LocationType value uses prescribed enums : School NonSchool', 
					rule => 'enum:LocationType=School,NonSchool'
				},
				{
					id => 41, 
					title => 'SiteCategory is mandatory', 
					rule => 'notblank:SiteCategory'
				},
				{
					id => 42, 
					title => 'Name is mandatory', 
					rule => 'notblank:Name'
				},
				{
					id => 43, 
					title => 'LocalId is mandatory', 
					rule =>'notblank:LocalId'
				},
				{
					id => 44, 
					title => 'Parent_LocationInfo_RefId points to existing chargeable location', 
					rule => 'lookup:Parent_LocationInfo_RefId=LocationInfo/RefId'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R6',
			title => 'PaymentReceipt Filled',
			description => 'This test validates the payment receipt records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PaymentReceipt
			},
			tables => ['PaymentReceipt'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 45, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 46, 
					title => 'TransactionType is mandatory', 
					rule => 'notblank:TransactionType'
				},
				{
					id => 47, 
					title => 'TransactionType value uses prescribed enums : GL receipt, GL payment, Creditor payment, Creditor receipt, Debtor receipt, Debtor payment', 
					rule => 'enum:TransactionType=GL receipt,GL payment,Creditor payment,Creditor receipt,Debtor receipt,Debtor payment'
				},
				{
					id => 48, 
					title => 'VendorInfo_RefId points to existing vendor', 
					rule => 'lookup:VendorInfo_RefId=VendorInfo/RefId'
				},
				{
					id => 49, 
					title => 'Debtor_RefId points to existing debtor', 
					rule => 'lookup:Debtor_RefId=Debtor/RefId'
				},
				{
					id => 50, 
					title => 'PurchaseOrder_RefId points to existing purchase order', 
					rule => 'lookup:PurchaseOrder_RefId=PurchaseOrder/RefId'
				},
				{
					id => 51, 
					title => 'LocationInfo_RefId points to existing chargeable location', 
					rule => 'lookup:LocationInfo_RefId=LocationInfo/RefId'
				},
				{
					id => 52, 
					title => 'TransactionDate is mandatory', 
					rule => 'notblank:TransactionDate'
				},			
				{
					id => 53, 
					title => 'ReceivedAmount is mandatory', 
					rule => 'notblank:ReceivedAmount'
				},	
				{
					id => 54, 
					title => 'ReceivedAmountType is mandatory', 
					rule => 'notblank:ReceivedAmountType'
				},			
				{
					id => 55, 
					title => 'ReceivedAmountType value uses prescribed enums : Debit Credit', 
					rule => 'enum:ReceivedAmountType=Debit,Credit'
				},
				{
					id => 58, 
					title => 'ReceivedTransactionId is mandatory', 
					rule => 'notblank:ReceivedTransactionId'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R7',
			title => 'PurchaseOrder/FinancialAccountRefIdList Filled',
			description => 'This test validates the FinancialAccountRefId list in the purchase order records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PurchaseOrder_FinancialAccount
			},
			tables => ['PurchaseOrder_FinancialAccount'],
			rule => 'morethan:0', 
			subtests => [
				{
					id => 56, 
					title => 'FinancialAccount_RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 57, 
					title => 'FinancialAccount_RefId points to existing financial account', 
					rule => 'lookup:FinancialAccount_RefId=FinancialAccount/RefId'
				},
			],
			weight => 0.1,
		},
		
		{
			id => 'R8',
			title => 'PurchaseOrder Filled',
			description => 'This test validates the purchase order records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PurchaseOrder
			},
			tables => ['PurchaseOrder'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 59, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 60, 
					title => 'FormNumber is mandatory', 
					rule => 'notblank:FormNumber'
				},
				{
					id => 61, 
					title => 'VendorInfo_RefId is mandatory', 
					rule => 'notblank:VendorInfo_RefId'
				},
				{
					id => 62, 
					title => 'VendorInfo_RefId points to existing vendor', 
					rule => 'lookup:VendorInfo_RefId=VendorInfo/RefId'
				},
				{
					id => 63, 
					title => 'LocationInfo_RefId points to existing chargeable location', 
					rule => 'lookup:LocationInfo_RefId=LocationInfo/RefId'
				},
				{
					id => 64, 
					title => 'EmployeePersonal_RefId points to existing purchase order', 
					rule => 'lookup:EmployeePersonal_RefId=StaffPersonal/RefId'
				},
				{
					id => 65, 
					title => 'Check number of purchasing items', 
					rule => 'subquerycount:RefId=PurchaseOrder_PurchasingItems/PurchaseOrder_RefId'
				},				
			],
			weight => 0.1,
		},

		{
			id => 'R9',
			title => 'PurchaseOrder/PurchasingItems Filled',
			description => 'This test validates the purchasing items lists in the purchase order records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PurchaseOrder_PurchasingItems
			},
			tables => ['PurchaseOrder_PurchasingItems'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 66, 
					title => 'ItemDescription is mandatory', 
					rule => 'notblank:ItemDescription'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R10',
			title => 'PurchaseOrder/PurchasingItems/ExpenseAccounts Filled',
			description => 'This test validates the expense accounts within the purchasing items lists in the purchase order records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					PurchaseOrder_PurchasingItems_ExpenseAccount
			},
			tables => ['PurchaseOrder_PurchasingItems_ExpenseAccount'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 67, 
					title => 'AccountCode is mandatory', 
					rule => 'notblank:AccountCode'
				},
				{
					id => 68, 
					title => 'Amount is mandatory', 
					rule => 'notblank:Amount'
				},
				{
					id => 69, 
					title => 'FinancialAccount_RefId points to existing financial account', 
					rule => 'lookup:FinancialAccount_RefId=FinancialAccount/RefId'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R11',
			title => 'VendorInfo Filled',
			description => 'This test validates the vendor records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					VendorInfo
			},
			tables => ['VendorInfo'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 70, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 71, 
					title => 'Name is mandatory', 
					rule => 'notblank:Name'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R12',
			title => 'Journal Filled',
			description => 'This test validates the journal records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					Journal
			},
			tables => ['Journal'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 72, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 73, 
					title => 'Debit_FinancialAccount_RefId is mandatory', 
					rule => 'notblank:Debit_FinancialAccount_RefId'
				},
				{
					id => 74, 
					title => 'Debit_FinancialAccount_RefId points to existing financial account', 
					rule => 'lookup:Debit_FinancialAccount_RefId=FinancialAccount/RefId'
				},
				{
					id => 75, 
					title => 'Credit_FinancialAccount_RefId is mandatory', 
					rule => 'notblank:Credit_FinancialAccount_RefId'
				},
				{
					id => 76, 
					title => 'Credit_FinancialAccount_RefId points to existing financial account', 
					rule => 'lookup:Credit_FinancialAccount_RefId=FinancialAccount/RefId'
				},
				{
					id => 77, 
					title => 'OriginatingTransaction_RefId_SIFRefObject value uses prescribed enums : Debtor, PurchaseOrder ', 
					rule =>'enum:OriginatingTransaction_RefId_SIFRefObject=Invoice,PaymentReceipt,PurchaseOrder'
				},
				{
					id => 78, 
					title => 'OriginatingTransaction_RefId points to existing object', 
					rule => 'lookup_sifrefobject:OriginatingTransaction_RefId=OriginatingTransaction_RefId_SIFRefObject/RefId'
				},
				{
					id => 79, 
					title => 'Amount is mandatory', 
					rule => 'notblank:Amount'
				},
				{
					id => 80, 
					title => 'FinancialClass_RefId points to existing financial class', 
					rule => 'lookup:FinancialClass_RefId=FinancialClass/RefId'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R13',
			title => 'Debtor Filled',
			description => 'This test validates the debtor records submitted to the database',
			query => q{
				SELECT
					*
				FROM
					Debtor
			},
			tables => ['Debtor'],
			rule => 'morethan:0',
			subtests => [
				{
					id => 81, 
					title => 'RefId is mandatory', 
					rule => 'notblank:RefId'
				},
				{
					id => 82, 
					title => 'BilledEntity is mandatory', 
					rule => 'notblank:BilledEntity'
				},
				{
					id => 83, 
					title => 'BilledEntity_SIFRefObject is mandatory', 
					rule => 'notblank:BilledEntity_SIFRefObject'
				},
				{
					id => 84, 
					title => 'BilledEntity_SIFRefObject value uses prescribed enums : StudentContactPersonal, VendorInfo ', 
					rule =>'enum:BilledEntity_SIFRefObject=StudentContactPersonal,VendorInfo'
				},
				{
					id => 85, 
					title => 'BilledEntity points to existing object', 
					rule => 'lookup_sifrefobject:BilledEntity=BilledEntity_SIFRefObject/RefId'
				},
			],
			weight => 0.1,
		},

		{
			id => 'R14',
			title => 'Address Filled',
			description => 'This test validates the address entries within records submitted to the database',
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
					id => 86, 
					title => 'AddressType is mandatory', 
					rule => 'notblank:AddressType'
				},
				{
					id => 87, 
					title => 'AddressType value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAddressTypeType ', 
					rule =>'enum:AddressType=0123,0123A,0124,0124A,0125,0765,0765A,9999,9999A'
				},
				{
					id => 88, 
					title => 'AddressRole is mandatory', 
					rule => 'notblank:AddressRole'
				},
				{
					id => 89, 
					title => 'AddressRole value uses prescribed enums : http://specification.sifassociation.org/Implementation/AU/1.3/html/CodeSets.html#AUCodeSetsAddressRoleType ', 
					rule =>'enum:AddressRole=012A,012B,012C,013A,1073,1074,1075,2382,9999'
				},
				{
					id => 90, 
					title => 'Line1 is mandatory', 
					rule => 'notblank:Line1'
				},
				{
					id => 91, 
					title => 'City is mandatory', 
					rule => 'notblank:City'
				},
				{
					id => 92, 
					title => 'StateProvince is mandatory', 
					rule => 'notblank:StateProvince'
				},
				{
					id => 93, 
					title => 'PostalCode is mandatory', 
					rule => 'notblank:PostalCode'
				},
			],
			weight => 0.1,
		},

	]
};


__END__

COMMON
