view: due_dates_moved {
   derived_table: {
     sql: SELECT
                w.tenant_name AS tenant_name,
                w.tenant_permakey AS tenant_permakey,
                w.source_work_item_permakey AS source_work_item_permakey,
                COUNT(DISTINCT w.work_due_date) -1  AS due_date_moves
          FROM Reporting.vw_looker_F_Work w
          JOIN
          (
                SELECT DISTINCT  tenant_permakey, source_work_item_permakey
                FROM Reporting.vw_looker_F_Work
                WHERE {% condition year_filter %} Reporting.vw_looker_F_Work.year {% endcondition %}
                AND  {% condition month_filter %} Reporting.vw_looker_F_Work.month {% endcondition %}
          ) a
          ON a.tenant_permakey = w.tenant_permakey
          AND a.source_work_item_permakey = w.source_work_item_permakey
          WHERE w.work_due_date IS NOT NULL
          GROUP BY  w.tenant_name,
                    w.tenant_permakey,
                     w.source_work_item_permakey
          HAVING count(distinct w.work_due_date) > 1
       ;;
   }

   #       WHERE {% condition date_filter %} table.date {% endcondition %}

  filter:  year_filter {
    label: "Year"
    type:  number
    default_value: "2017"
  }

  filter:  month_filter {
    label: "Month"
    type:  number
    default_value: "4"
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
