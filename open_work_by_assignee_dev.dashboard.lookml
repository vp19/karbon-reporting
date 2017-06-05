- dashboard: Open work by assignee
  layout: newspaper
  elements:
  - name: Open work by assignee
    label: Open work by assignee
    model: karbon_reporting_dev
    explore: work_summary
    type: looker_bar
    fields:
    - work_summary.assigned_user
    - work_summary.distinct_work_items
    filters:
      work_summary.primary_status_name: In Progress,Waiting
    sorts:
    - work_summary.distinct_work_items desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: true
    y_axis_combined: true
    show_y_axis_labels: true
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
      work_summary.distinct_work_items: " #AAD48B"
    series_labels:
      work_summary.distinct_work_items: Work Items
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: work_summary.distinct_work_items
        name: Work Items
    listen:
      Month: work_summary.work_month
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
