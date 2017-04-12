view: due_dates_moved {
   derived_table: {
     sql: SELECT
              tenant_name,
              tenant_permakey,
              source_work_item_permakey,
              count(distinct work_due_date) AS due_date_moves
          FROM Reporting.vw_looker_F_Work
          GROUP BY  tenant_name,
                    tenant_permakey,
                    source_work_item_permakey
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

  dimension: due_date_moves {
    type: string
    label: "Due Date Moves"
    sql: ${TABLE}.due_date_moves ;;
  }

  measure: number_work_items {
    type: count_distinct
    label: "Number of Work Items"
    sql: ${TABLE}.source_work_item_permakey ;;
  }

  measure:  average_times_due_date_moved {
    label: "Average Number Of Times Due Date Moved"
    type: average
    value_format: "0.##"
    sql: ${due_date_moves} ;;
  }

  measure:  sum_times_due_date_moved {
    label: "Number Of Times Due Date Moved"
    type: sum
    value_format: "0.##"
    sql: ${due_date_moves} ;;
  }

  measure:  count_times_due_date_moved {
    label: "Count Number Of Times Due Date Moved"
    type: count
    value_format: "0.##"
    #sql: ${due_date_moves} ;;
  }



 }
