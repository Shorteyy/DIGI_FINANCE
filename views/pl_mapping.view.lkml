view: pl_mapping {
sql_table_name: `digi_finance.pl_mapping` ;;

  dimension: accountname {
    type: string
    sql: ${TABLE}.Accountname ;;
  }

  dimension: accountnr {
    type: number
    sql: ${TABLE}.Accountnr ;;
  }

  dimension: combination {
    type: string
    sql: ${TABLE}.Combination ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension: company__account {
    primary_key: yes
    type: string
    sql: ${TABLE}.`Company - Account` ;;
  }

  dimension: pl_group {
    type: string
    sql: ${TABLE}.`PL Group` ;;
  }

  dimension: pl_hierarchy {
    type: string
    sql: ${TABLE}.`PL Hierarchy` ;;
  }

  dimension: pl_subgroup {
    type: string
    sql: ${TABLE}.`PL Subgroup` ;;
    order_by_field: PL_Group_Sort
  }
  dimension: PL_Group_Sort {
    type: number
    sql: CASE
          WHEN ${pl_subgroup} = 'Revenue' THEN 1
          WHEN ${pl_subgroup} = 'Cost of sales' THEN 2
          WHEN ${pl_subgroup} = 'Inventory Movement' THEN 3
          WHEN ${pl_subgroup} = 'Capitalization' THEN 4
          WHEN ${pl_subgroup} = 'Payroll' THEN 5
          WHEN ${pl_subgroup} = 'Contractors' THEN 6
          WHEN ${pl_subgroup} = 'Interim' THEN 7
          WHEN ${pl_subgroup} = 'Car' THEN 8
          WHEN ${pl_subgroup} = 'Fuel' THEN 9
          WHEN ${pl_subgroup} = 'Travel' THEN 10
          WHEN ${pl_subgroup} = 'Entertainment' THEN 11
          WHEN ${pl_subgroup} = 'Fairs' THEN 12
          WHEN ${pl_subgroup} = 'Equipment & Tools' THEN 13
          WHEN ${pl_subgroup} = 'Utility Vehicle' THEN 14
          WHEN ${pl_subgroup} = 'Outside Services' THEN 15
          WHEN ${pl_subgroup} = 'Rent' THEN 16
          WHEN ${pl_subgroup} = 'Connectivity' THEN 17
          WHEN ${pl_subgroup} = 'Maintenance' THEN 18
          WHEN ${pl_subgroup} = 'Insurance' THEN 21
          WHEN ${pl_subgroup} = 'Utilities' THEN 22
          WHEN ${pl_subgroup} = 'Other' THEN 23
          WHEN ${pl_subgroup} = 'Advertising & Marketing' THEN 24
          WHEN ${pl_subgroup} = 'Booths & Internal Events' THEN 25
          WHEN ${pl_subgroup} = 'Sponsorship' THEN 26
          WHEN ${pl_subgroup} = 'Internal IT' THEN 27
          WHEN ${pl_subgroup} = 'Transport' THEN 28
          WHEN ${pl_subgroup} = 'Training' THEN 29
          WHEN ${pl_subgroup} = 'Legal Fees' THEN 31
          WHEN ${pl_subgroup} = 'Office Costs' THEN 32
          WHEN ${pl_subgroup} = 'Other Personnel' THEN 33
          WHEN ${pl_subgroup} = 'Other Charges' THEN 34
          WHEN ${pl_subgroup} = 'Other Income' THEN 35
          WHEN ${pl_subgroup} = 'Group Charges' THEN 36
          WHEN ${pl_subgroup} = 'Depreciation & Amortization' THEN 37
          WHEN ${pl_subgroup} = 'Other operating charges' THEN 38
          WHEN ${pl_subgroup} = 'Extraordinary Income' THEN 39
          WHEN ${pl_subgroup} = 'Interests' THEN 40
          WHEN ${pl_subgroup} = 'Income Tax' THEN 44
          WHEN ${pl_subgroup} = 'Capex' THEN 45
          WHEN ${pl_subgroup} = 'Depreciation' THEN 46
          ELSE 99
            END ;;
  }
  measure: count {
    type: count
    drill_fields: [accountname]
  }
}
