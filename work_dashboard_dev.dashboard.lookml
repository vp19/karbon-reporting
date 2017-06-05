- dashboard: Work Dashboard
  layout: newspaper
  embed_config:
    background_color: "#f6f8fa"
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: Avg amount of time work spent in each status
    label: Avg amount of time work spent in each status
    model: karbon_reporting_dev
    explore: days_spent_in_open_states
    type: looker_bar
    fields:
    - days_spent_in_open_states.combined_sort_order
    - days_spent_in_open_states.status
    - days_spent_in_open_states.avg_days_difference
    sorts:
    - days_spent_in_open_states.combined_sort_order
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 13
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
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
      days_spent_in_open_states.avg_days_difference: "#AAD48B"
    x_axis_label: Status
    y_axes:
    - label: Days in status
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: days_spent_in_open_states.avg_days_difference
        name: Days In Status
    series_labels:
      days_spent_in_open_states.avg_days_difference: Days In Status
    hidden_fields:
    - days_spent_in_open_states.combined_sort_order
    listen:
      Line Chart Date Filter: days_spent_in_open_states.last_month
    note_state: collapsed
    note_display: hover
    note_text: Find out where the bottle necks are in the workflow.
    row: 19
    col: 0
    width: 24
    height: 11
  - name: Work Items Completed On Time
    label: Work Items Completed On Time
    model: karbon_reporting_dev
    explore: work_summary
    type: single_value
    fields:
    - work_summary.is_overdue
    - work_summary.distinct_work_items
    filters:
      work_summary.primary_status_name: Completed
    sorts:
    - work_summary.distinct_work_items desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: total_completed
      label: Total Completed
      expression: "${work_summary.distinct_work_items} + offset(${work_summary.distinct_work_items},1)"
      value_format:
      value_format_name:
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Work items completed on time
    comparison_label: work items completed
    listen:
      Line Chart Date Filter: work_summary.work_month
    note_state: collapsed
    note_display: hover
    note_text: The percentage of work items that were completed on time (not overdue)
      in the time period. If workflow is running smoothly this should be very close
      to 100%.
    row: 14
    col: 0
    width: 12
    height: 5
  - name: Work Items Overdue
    label: Work Items Overdue
    model: karbon_reporting_dev
    explore: work_summary
    type: single_value
    fields:
    - work_summary.work_month
    - work_summary.overdue_work_items
    - work_summary.avg_days_overdue
    fill_fields:
    - work_summary.work_month
    sorts:
    - work_summary.work_month desc
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Work items overdue
    comparison_label: days overdue on average
    listen: {}
    note_state: collapsed
    note_display: hover
    note_text: The number of work items that were overdue during the time period.
    row: 0
    col: 16
    width: 8
    height: 4
  - name: Work Items Completed
    label: Work Items Completed
    model: karbon_reporting_dev
    explore: work_summary
    type: single_value
    fields:
    - work_summary.work_month
    - work_summary.completed_work_items
    fill_fields:
    - work_summary.work_month
    sorts:
    - work_summary.work_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: previous_months_difference
      label: Previous Months Difference
      expression: coalesce(${work_summary.completed_work_items},0) - offset(${work_summary.completed_work_items},1)
      value_format:
      value_format_name:
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Work items completed
    comparison_label: from previous period
    listen: {}
    note_state: collapsed
    note_display: hover
    note_text: Work items that were completed during the time period.
    row: 0
    col: 8
    width: 8
    height: 4
  - name: When work was completed
    label: When work was completed
    model: karbon_reporting_dev
    explore: work_due_and_completed
    type: looker_area
    fields:
    - work_due_and_completed.dates_date
    - work_due_and_completed.number_work_items
    - work_due_and_completed.status
    pivots:
    - work_due_and_completed.status
    fill_fields:
    - work_due_and_completed.dates_date
    sorts:
    - work_due_and_completed.dates_date
    - work_due_and_completed.status 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: work_running_total
      label: Work Running Total
      expression: running_total(${work_due_and_completed.number_work_items})
      value_format:
      value_format_name:
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 24
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    - work_due_and_completed.number_work_items
    y_axis_labels:
    - Date
    series_colors:
      Completed - work_running_total: "#4CAE04"
      Work Due - work_running_total: "#CCCCCC"
    colors:
    - "#62bad4"
    - "#4CAE04"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    series_labels:
      Completed - work_running_total: Work completed
      Work Due - work_running_total: Work due
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: Completed
        name: Work completed
      - id: Work Due
        name: Work due
    x_axis_label: Date
    listen:
      Line Chart Date Filter: work_due_and_completed.dates_month
    note_state: collapsed
    note_display: hover
    note_text: See when work items were completed during the time period. Compare
      that with when they were due. If workflow is running smoothly the two should
      be close together.
    row: 4
    col: 0
    width: 24
    height: 10
  - name: Work Items Started
    label: Work Items Started
    model: karbon_reporting_dev
    explore: work_summary
    type: single_value
    fields:
    - work_summary.start_month
    - work_summary.started_work_items
    fill_fields:
    - work_summary.start_month
    filters:
      work_summary.startdate_equal_datemonth: 'Yes'
    sorts:
    - work_summary.start_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: previous_months_difference
      label: Previous Months Difference
      expression: "${work_summary.started_work_items} - offset(${work_summary.started_work_items},1)"
      value_format:
      value_format_name:
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Work Items Started
    comparison_label: from previous period
    listen: {}
    note_state: collapsed
    note_display: hover
    note_text: Work items that transitioned from a Planned status to an In Progress
      status.
    row: 0
    col: 0
    width: 8
    height: 4
  - name: Days to complete work on average
    label: Days to complete work on average
    model: karbon_reporting_dev
    explore: work_summary
    type: single_value
    fields:
    - work_summary.work_month
    - work_summary.avg_days_to_complete
    fill_fields:
    - work_summary.work_month
    filters:
      work_summary.primary_status_name: Completed
    sorts:
    - work_summary.work_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: previous_month_difference
      label: Previous Month Difference
      expression: coalesce(${work_summary.avg_days_to_complete},0) - offset(${work_summary.avg_days_to_complete},1)
      value_format:
      value_format_name:
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: ''
    single_value_title: Days to complete work on avg
    comparison_label: from previous period
    listen:
      Comparison Date Filter: work_summary.work_month
    note_state: collapsed
    note_display: hover
    note_text: How long it takes to complete work (Start date to completion date)
      on average.
    row: 14
    col: 12
    width: 12
    height: 5
  filters:
  - name: Line Chart Date Filter
    title: Line Chart Date Filter
    type: date_filter
    default_value: this month
    model:
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
  - name: Comparison Date Filter
    title: Comparison Date Filter
    type: date_filter
    default_value: 2 months
    model:
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
