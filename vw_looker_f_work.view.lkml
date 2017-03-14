view: vw_looker_f_work {
  sql_table_name: Reporting.vw_looker_F_Work ;;
  label: "Work"

  dimension: assigned_user {
    type: string
    label: "Assigned User"
    sql: ${TABLE}.assigned_user ;;
  }

  dimension: client_name {
    type: string
    label: "Client Name"
    sql: ${TABLE}.client_name ;;
  }

  dimension: client_type {
    type: string
    label: "Client Type"
    description: "Is the client an Organization or a Contact?"
    sql: ${TABLE}.client_type ;;
  }

  dimension_group: dates {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.dates ;;
  }

  dimension: is_open {
    type: string
    sql: ${TABLE}.is_open ;;
  }

  dimension: is_overdue {
    type: string
    sql: ${TABLE}.is_overdue ;;
  }

  dimension: month {
    type: number
    hidden: yes
    sql: ${TABLE}.month ;;
  }

  dimension: primary_status_name {
    type: string
    label: "Primary Status"
    sql: ${TABLE}.primary_status_name ;;
  }

  dimension: quarter {
    type: number
    hidden: yes
    sql: ${TABLE}.quarter ;;
  }

  dimension: secondary_status_name {
    type: string
    label: "Secondary Status"
    sql: ${TABLE}.secondary_status_name ;;
  }

  dimension: source_work_item_permakey {
    type: string
    hidden: yes
    label: "work_item_permakey"
    sql: ${TABLE}.source_work_item_permakey ;;
  }

  dimension: tenant_name {
    type: string
    label: "Tenant Name"
    sql: ${TABLE}.tenant_name ;;
  }

  dimension: tenant_permakey {
    type: string
    hidden: yes
    sql: ${TABLE}.tenant_permakey ;;
  }

  dimension_group: work_due {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.work_due_date ;;
  }

  dimension: work_item_title {
    type: string
    label: "Work Title"
    sql: ${TABLE}.work_item_title ;;
  }

  dimension: year {
    type: number
    hidden: yes
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [tenant_name, client_name, primary_status_name, secondary_status_name, assigned_user, work_item_title, dates.date, work_due.date]
  }
}
