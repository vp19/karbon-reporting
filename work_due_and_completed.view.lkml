view: work_due_and_completed {
  label: "Work Due and Completed"

  derived_table: {
    sql: SELECT
              tenant_name,
              tenant_permakey,
              dates,
              'Completed' AS status ,
              COUNT(DISTINCT source_work_item_permakey) AS number_work_items
          FROM Reporting.vw_looker_F_Work
          WHERE primary_status_name ='Completed'
          GROUP BY tenant_name,
                tenant_permakey,
                dates
            UNION ALL
          SELECT
               tenant_name,
               tenant_permakey,
               work_due_date AS dates,
               'Work Due' AS STATUS,
               COUNT(DISTINCT source_work_item_permakey) AS number_work_items
          FROM Reporting.vw_looker_F_Work
          GROUP BY tenant_name,
                tenant_permakey,
                work_due_date
       ;;
  }

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

  dimension: status {
    type: string
    label: "Status"
    sql: ${TABLE}.status ;;
  }

  dimension_group: dates {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.dates ;;
  }

  measure: number_work_items {
    type: sum
    label: "Number of Work Items"
    sql: ${TABLE}.number_work_items ;;
  }

}
