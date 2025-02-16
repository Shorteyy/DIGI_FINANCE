view: budget_transformed {
  sql_table_name: `looker-internal-training.digi_finance.budget_transformed` ;;

  dimension: company_account_month {
    type: string
    sql: concat(${company__account},${date_raw}) ;;
    description: "A unique identifier combining raw date & company_account"
    primary_key: yes
  }

  dimension: accountnr {
    type: number
    sql: ${TABLE}.Accountnr ;;
  }
  dimension: analytical_code {
    type: string
    sql: ${TABLE}.`Analytical Code` ;;
  }
  dimension: analytical_id {
    type: number
    sql: ${TABLE}.`Analytical ID` ;;
  }
  dimension: company__account {
    type: string
    sql: ${TABLE}.`Company - Account` ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: month_name {
    type: string
    sql: ${TABLE}.`Month Name` ;;
  }
  dimension: pl_group {
    type: string
    sql: ${TABLE}.`PL group` ;;
  }
  dimension: pl_subgroup {
    type: string
    sql: ${TABLE}.`PL Subgroup` ;;
  }
  dimension: value {
    type: number
    sql: ${TABLE}.Value ;;
  }

  measure: budget_value {
    type: sum
    sql: ${value} ;;
  }
  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
