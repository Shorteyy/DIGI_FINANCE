# The name of this view in Looker is "Month Mapping"
view: month_mapping {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `digi_finance.month_mapping` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Company Account" in Explore.

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

  dimension: company_account_month {
    type: string
    sql: concat(${company__account},${date_raw}) ;;
    description: "A unique identifier combining raw date & company_account"
    primary_key: yes
  }

  measure: count {
    type: count
  }
}
