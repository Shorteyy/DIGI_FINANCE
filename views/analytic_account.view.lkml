view: analytic_account {
sql_table_name: `digi_finance.analytic_account` ;;

  dimension: analytic_account {
    type: string
    sql: ${TABLE}.`Analytic Account` ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.Plan ;;
  }
  measure: count {
    type: count
  }
}
