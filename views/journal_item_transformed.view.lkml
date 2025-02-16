view: journal_item_transformed {
  sql_table_name: `looker-internal-training.digi_finance.journal_item_transformed` ;;

  dimension: id {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}._ID_ ;;
  }

  dimension: company_account_month {
    type: string
    sql: concat(${company__account},${date_date}) ;;
    description: "A unique identifier combining raw date & company_account"
  }

  dimension: account {
    type: string
    sql: ${TABLE}.Account ;;
  }
  dimension: account_description {
    type: string
    sql: ${TABLE}.`Account Description` ;;
  }
  dimension: account_number {
    type: number
    sql: ${TABLE}.`Account Number` ;;
  }
  dimension: analytic_department {
    type: string
    sql: ${TABLE}.`Analytic Department` ;;
  }
  dimension: analytic_distribution {
    type: string
    sql: ${TABLE}.`Analytic Distribution` ;;
  }
  dimension: analytic_facilities {
    type: string
    sql: ${TABLE}.`Analytic Facilities` ;;
  }
  dimension: analytic_id {
    type: string
    sql: ${TABLE}.`Analytic ID` ;;
  }
  dimension: analytic_plan_department {
    type: string
    sql: ${TABLE}.`Analytic Plan Department` ;;
  }
  dimension: analytic_projects {
    type: string
    sql: ${TABLE}.`Analytic Projects` ;;
  }
  dimension: balance {
    type: number
    sql: ${TABLE}.Balance ;;
  }
  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }
  dimension: company__account {
    type: string
    sql: ${TABLE}.`Company - Account` ;;
  }
  dimension: credit {
    type: number
    sql: ${TABLE}.Credit ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Date ;;
  }
  dimension: debit {
    type: number
    sql: ${TABLE}.Debit ;;
  }
  dimension: journal {
    type: string
    sql: ${TABLE}.Journal ;;
  }
  dimension: journal_entry_and_bill_tags {
    type: string
    sql: ${TABLE}.`Journal Entry and Bill tags` ;;
  }
  dimension: label {
    type: string
    sql: ${TABLE}.Label ;;
  }
  dimension: matching_ {
    type: string
    sql: ${TABLE}.`Matching #` ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}.Number ;;
  }
  dimension: partner {
    type: string
    sql: ${TABLE}.Partner ;;
  }
  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }
  dimension: product_and_product_category {
    type: string
    sql: ${TABLE}.`Product and Product Category` ;;
  }
  dimension: product_and_type {
    type: string
    sql: ${TABLE}.`Product and Type` ;;
  }
  dimension: reference {
    type: string
    sql: ${TABLE}.Reference ;;
  }

  measure: sum_credit {
    type: sum
    sql: ${credit} ;;
  }

  measure: sum_debit {
    type: sum
    sql: ${debit} ;;
  }

  measure: sum_balance {
    type: sum
    sql: ${balance} ;;
  }

  measure: sum_number {
    type: sum
    sql: ${number} ;;
  }

  measure: count {
    type: count
  }
}
