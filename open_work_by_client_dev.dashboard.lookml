- dashboard: Open work by client
  layout: newspaper
  elements:
  - name: Open work by client
    label: Open work by client
    model: karbon_reporting_dev
    explore: vw_looker_f_work
    type: looker_bar
    fields:
    - vw_looker_f_work.client_name
    - vw_looker_f_work.distinct_work_items
    filters:
      vw_looker_f_work.primary_status_name: "-Completed,-Planned"
    sorts:
    - vw_looker_f_work.distinct_work_items desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: true
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      vw_looker_f_work.count: "#4CAE05"
      vw_looker_f_work.distinct_work_items: "#AAD48B"
    y_axis_labels:
    - "# Completed"
    series_labels:
      vw_looker_f_work.count: "# Completed"
      vw_looker_f_work.distinct_work_items: Work Items
    y_axis_value_format: "#"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    listen:
      Month: vw_looker_f_work.work_month
    row:
    col:
    width:
    height:
  filters:
  - name: Month
    title: Month
    type: date_filter
    default_value: this month
    model:
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
