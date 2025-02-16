# Define the database connection to be used for this model.
connection: "digi_finance"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: finance_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: finance_default_datagroup


explore: budget_2024 {
}

explore: journal_distribution{
  label: "Finance_Model"
  join : journal_item_transformed {
    sql_on: ${journal_item_transformed.company_account_month} = ${journal_distribution.company_account_month} ;;
    relationship: many_to_one
  }

  join: analytic_account {
    sql_on: ${analytic_account.id} = ${journal_distribution.analytic_account_id} ;;
    relationship: many_to_one
  }

  join: budget_2024 {
    type: left_outer
    sql_on: ${analytic_account.analytic_account} = ${budget_2024.analytical_code} ;;
    relationship: one_to_many
  }

  join: month_mapping {
    sql_on: ${month_mapping.company_account_month} = ${journal_distribution.company_account_month} ;;
    relationship: many_to_one
  }

  join: pl_mapping {
    sql_on: ${pl_mapping.company__account} = ${month_mapping.company__account} ;;
    relationship: many_to_one
  }

  join: budget_transformed {
    type: inner
    sql_on: ${month_mapping.company_account_month} = ${budget_transformed.company_account_month} ;;
    relationship: one_to_many
  }
  join: dates {
    sql_on: ${dates.date_date} = ${journal_distribution.date_date} ;;
    relationship: one_to_many
  }
}
