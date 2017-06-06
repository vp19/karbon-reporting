view: work_summary {
  sql_table_name: Reporting.vw_looker_Summary_F_Work ;;
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

  dimension_group: start {
    type: time
    timeframes: [date, month]
    sql: ${TABLE}.start_date  ;;
  }

  dimension: completed_date {
    type: date
    sql: ${TABLE}.completed_date ;;
  }

  dimension: days_to_complete {
    type: number
    sql: CASE WHEN DATEDIFF ( day , ${TABLE}.start_date , ${TABLE}.completed_date ) IS NULL THEN 1 ELSE DATEDIFF ( day , ${TABLE}.start_date , ${TABLE}.completed_date ) END  ;;
  }


  dimension: pk {
    hidden: yes
    type: string
    primary_key: yes
    sql: concat(${work_raw},${tenant_permakey},${source_work_item_permakey});;
  }

  dimension_group: work {
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
    description: "The Month the Work Item occured"
    sql: ${TABLE}.date_month ;;
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

  dimension: secondary_status_name {
    type: string
    label: "Secondary Status"
    sql: ${TABLE}.secondary_status_name ;;
  }


  dimension: combined_status_name {
    type: string
    label: "Status"
    description: "A combination of Primary and Secondary Status"
    sql: CASE WHEN ${secondary_status_name} IS NOT NULL THEN ${secondary_status_name} ELSE ${primary_status_name} END ;;
  }


  dimension: source_work_item_permakey {
    type: string
    hidden: yes
    #primary_key: yes
    label: "work_item_permakey"
    #url: "https://stage.karbonhq.com/{{tenant_permakey}}#/work/4BSPYCtfgGJn"
    sql: ${TABLE}.source_work_item_permakey ;;
  }

  dimension: work_item_permakey {
    type: string
    hidden: yes
    #primary_key: yes
    label: "Work Item Permakey Link"
    link: {
      label: "Work Item"
      url: "https://stage.karbonhq.com/{{ vw_looker_summary_f_work.tenant_permakey.value }}#/work/{{ value }}"
    }
    sql: ${source_work_item_permakey} ;;
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
    #primary_key: yes
    link: {
      label: "Work Item"
      url: "https://stage.karbonhq.com/{{ work_summary.tenant_permakey._value }}#/work/{{ work_summary.source_work_item_permakey._value }}"
      icon_url: "https://karbonhq.com/themes/karbon/img/icons/favicons/favicon-16x16.png"
    }
    sql: ${TABLE}.work_item_title ;;
  }

  dimension: year {
    type: number
    hidden: yes
    sql: ${TABLE}.year ;;
  }



  dimension: startdate_equal_datemonth {
    type: yesno
    label: "Work Started"
#     sql: ${start_month} = ${work_date} ;;
    sql: ${start_month} = ${work_month} ;;
  }



  measure: count {
    type: count
    drill_fields: [work_item_title, client_name, combined_status_name, assigned_user,  dates.date, work_due.date]
  }

  measure: distinct_work_items {
    type: count_distinct
    sql: ${source_work_item_permakey} ;;
    drill_fields: [work_item_title, client_name, combined_status_name,  assigned_user, dates.month, work_due.month, start_date, source_work_item_permakey]
  }

  measure: completed_work_items {
    type: count_distinct
    label: "Completed Work Items"
    sql: ${source_work_item_permakey} ;;
    drill_fields: [work_item_title, client_name, combined_status_name,  assigned_user, dates.month, work_due.month, completed_date, source_work_item_permakey]
    filters: {
      field: primary_status_name
      value: "Completed"
    }
  }

  measure: started_work_items {
    type: count_distinct
    label: "Started Work Items"
    sql: ${source_work_item_permakey} ;;
    drill_fields: [work_item_title, client_name, combined_status_name,  assigned_user, dates.month, work_due.month, start_date, source_work_item_permakey]
    #filters: {
    #  field: primary_status_name
    #  value: "-Planned,-Completed"
    #}
  }

  measure: overdue_work_items {
    type: count_distinct
    label: "Overdue Work Items"
    sql: ${source_work_item_permakey} ;;
    drill_fields: [work_item_title, client_name, combined_status_name,  assigned_user, dates.month, work_due.month, start_date, source_work_item_permakey]
    filters: {
      field: is_overdue
      value: "Y"
    }
  }

  measure: avg_days_overdue {
    label: "Average Days Overdue"
    type: average
    filters: {
      field: is_overdue
      value: "Y"
    }
    #sql: DATEDIFF(day, ${work_due_date}, ${work_date});;
    sql: ${TABLE}.total_days_overdue  ;;
    value_format_name: decimal_0
    drill_fields: [work_item_title, client_name, combined_status_name,  assigned_user, dates.month, work_due.month, start_date, source_work_item_permakey]
  }

  #measure: distinct_due_dates {
  #  label: "Number of Days Due Date Moved"
  #  type: count_distinct
  #  sql: ${TABLE}.work_due_date ;;
  #  #drill_fields: [tenant_name, client_name,work_item_title]
  #}

  measure: avg_days_to_complete {
    label: "Average Days To Complete"
    type: average
    sql: ${days_to_complete} ;;
    #drill_fields: [work_item_title, client_name, combined_status_name,  assigned_user, dates.month, work_due.month, start_date, source_work_item_permakey]
  }

}
