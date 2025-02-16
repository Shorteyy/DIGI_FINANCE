# The name of this view in Looker is "Mapping"
view: mapping {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `digi_finance.mapping` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Accountname" in Explore.

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
  }

  dimension: string_field_10 {
    type: string
    sql: ${TABLE}.string_field_10 ;;
  }

  dimension: string_field_11 {
    type: string
    sql: ${TABLE}.string_field_11 ;;
  }

  dimension: string_field_12 {
    type: string
    sql: ${TABLE}.string_field_12 ;;
  }

  dimension: string_field_13 {
    type: string
    sql: ${TABLE}.string_field_13 ;;
  }

  dimension: string_field_8 {
    type: string
    sql: ${TABLE}.string_field_8 ;;
  }

  dimension: string_field_9 {
    type: string
    sql: ${TABLE}.string_field_9 ;;
  }
  measure: count {
    type: count
    drill_fields: [accountname]
  }
}
