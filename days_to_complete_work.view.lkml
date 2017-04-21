view: days_to_complete_work{
  label: "Days To Complete Work"

  derived_table: {
    sql: SELECT completed.tenant_name AS tenant_name,
              completed.tenant_permakey AS tenant_permakey,
              completed.dates AS completed_date,
              completed.status AS status,
              completed.source_work_item_permakey as work_item_permakey,
              completed.work_item_title as work_item_title,
              completed.client_name ,
              completed.secondary_status_name,
              completed.assigned_user,
              started.dates AS started_date,
              CASE WHEN DATEDIFF ( day , started.dates , completed.dates ) IS NULL THEN 1 ELSE DATEDIFF ( day , started.dates , completed.dates ) END days_to_complete
        FROM
        (
            SELECT
                tenant_name,
                tenant_permakey,
                dates,
                'Completed' AS status ,
                source_work_item_permakey,
                work_item_title,
                client_name,
                secondary_status_name,
                assigned_user
            FROM Reporting.vw_looker_F_Work
            WHERE primary_status_name ='Completed'
        ) completed
        LEFT JOIN
        (
            SELECT tenant_name,
                tenant_permakey,
                dates,
                status ,
                source_work_item_permakey,
                work_item_title,
                client_name,
                secondary_status_name,
                assigned_user
            FROM (
                  SELECT
                      tenant_name,
                      tenant_permakey,
                      dates,
                      primary_status_name AS status ,
                      source_work_item_permakey,
                      work_item_title,
                      client_name,
                      secondary_status_name,
                      assigned_user,
                      ROW_NUMBER() OVER (PARTITION BY tenant_permakey, source_work_item_permakey ORDER BY dates ) AS rn
                  FROM Reporting.vw_looker_F_Work  AS vw_looker_f_work
                  WHERE (vw_looker_f_work.primary_status_name NOT IN ( 'Completed', 'Planned') )
                 ) a
            WHERE rn = 1
        ) started
        ON completed.tenant_permakey = started.tenant_permakey
        AND completed.source_work_item_permakey = started.source_work_item_permakey
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

  dimension: work_item_title {
    type: string
    label: "Work Item Title"
    sql: ${TABLE}.work_item_title ;;
  }

  dimension: status {
    type: string
    label: "Status"
    sql: ${TABLE}.status ;;
  }

  dimension: work_item_permakey {
    type: string
    label: "Work Item PermaKey"
    hidden: yes
    sql: ${TABLE}.work_item_permakey ;;
  }

  dimension: client_name {
    type: string
    label: "Client Name"
    sql: ${TABLE}.client_name ;;
  }

  dimension: secondary_status_name {
    type: string
    label: "Secondary Status Name"
    sql: ${TABLE}.secondary_status ;;
  }

  dimension: assigned_user {
    type: string
    label: "Assigned User"
    sql: ${TABLE}.assigned_user ;;
  }

  dimension_group: completed_date {
    type: time
    label: "Date Completed"
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.completed_date ;;
  }

  measure: avg_days_to_complete {
    type: average
    label: "Average Days to Complete"
    sql: ${TABLE}.days_to_complete ;;
    #drill_fields: [tenant_name, client_name, work_item_title, status, secondary_status_name, assigned_user]
  }

}
