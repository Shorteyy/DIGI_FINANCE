view: journal_distribution {
  sql_table_name: `looker-internal-training.digi_finance.journal_distribution` ;;

  dimension: company_account_month {
    type: string
    sql: concat(${company__account},${date_raw}) ;;
    description: "A unique identifier combining raw date & company_account"
    primary_key: yes
  }

  dimension: account {
    type: string
    sql: ${TABLE}.Account ;;
  }
  dimension: account_number {
    type: number
    sql: ${TABLE}.`Account Number` ;;
  }
  dimension: analytic_account_id {
    type: number
    sql: ${TABLE}.`Analytic Account ID` ;;
  }
  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
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
  dimension: distribution {
    type: number
    sql: ${TABLE}.Distribution ;;
  }
  dimension: entry_id {
    type: number
    sql: ${TABLE}.`Entry ID` ;;
  }
  dimension: excess_distribution_flag {
    type: yesno
    sql: ${TABLE}.`Excess Distribution Flag` ;;
  }
  dimension: journal_item_id {
    type: string
    sql: ${TABLE}.`Journal Item ID` ;;
  }
  dimension: total_distribution {
    type: number
    sql: ${TABLE}.`Total Distribution` ;;
  }

  measure: distribution_sum {
    type: sum
    sql: ${distribution} ;;
  }

  measure: count {
    type: count
  }
}
