view: budget_2024 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `digi_finance.budget_2024` ;;


  dimension: accountnr {
    type: number
    sql: ${TABLE}.Accountnr ;;
  }

  dimension: company_account_month {
    type: string
    sql: concat(${company__account},${date_raw}) ;;
    description: "A unique identifier combining raw date & company_account"
    primary_key: yes
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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension_group: date_lastmonth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: DATE_ADD(${TABLE}.Date, INTERVAL -1 MONTH) ;;
  }

  # dimension_group: date_ytd {
  #   type: time
  #   timeframes: [raw, date, week, month, quarter, year]
  #   convert_tz: no
  #   datatype: date
  #   sql: DATE_ADD(${date_date}, INTERVAL -1 YEAR) ;;
  # }

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

  measure: value_sum {
    type: sum
    sql: ${value} ;;
    drill_fields: [accountnr, analytical_code, company__account, date_date]
    html:
    {% if value_sum._value > 999 %}
    <p style="color: black; background-color: lightgreen;">{{ value }}</p>
    {% else %}
    <p style="color: white; background-color: red;">{{ value }}</p>
    {% endif %}
    ;;
  }



  measure: count {
    type: count
    drill_fields: [month_name]
  }

}
