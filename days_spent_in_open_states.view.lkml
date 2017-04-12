view: days_spent_in_open_states {
  sql_table_name: Reporting.vw_looker_Days_Spent_in_Status ;;
  label: "Days each Work Item spent in each open state"

  dimension: tenant_name {
    type: string
    label: "Tenant Name"
    sql: ${TABLE}.tenant_name ;;
  }

  dimension: tenant_permakey {
    type: string
    label: "Tenant PermaKey"
    hidden: yes
    sql: ${TABLE}.tenant_permakey ;;
  }

  dimension: source_work_item_permakey {
    type: string
    label: "Work Item PermaKey"
    hidden: yes
    sql: ${TABLE}.source_work_item_permakey ;;
  }

  dimension: status {
    type: string
    label: "Status"
    sql: ${TABLE}.status ;;
  }

  dimension_group: last {
    type: time
    label: "Date"
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last ;;
  }

  measure: days_difference {
    type: sum
    label: "Total Days in Status"
    sql: ${TABLE}.days_difference ;;
  }

  measure: avg_days_difference {
    type: average
    label: "Average Days in Status"
    sql: ${TABLE}.days_difference ;;
  }

}
