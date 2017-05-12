- dashboard: Work Dashboard
  layout: newspaper
  embed_config:
    background_color: "#f6f8fa"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: Work Items Completed On Time - Total
    label: Work Items Completed On Time - Total
    model: karbon_reporting_dev
    explore: vw_looker_f_work
    type: single_value
    fields:
    - vw_looker_f_work.distinct_work_items
    - vw_looker_f_work.dates_month
    - vw_looker_f_work.is_overdue
    filters:
      vw_looker_f_work.primary_status_name: Completed
    sorts:
    - vw_looker_f_work.dates_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: total_completed
      label: Total Completed
      expression: "${vw_looker_f_work.distinct_work_items} + offset(${vw_looker_f_work.distinct_work_items},1)"
      value_format:
      value_format_name:
    query_timezone: America/Los_Angeles
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
    hidden_fields:
    - vw_looker_f_work.dates_month
    comparison_label: work items completed
    listen:
      Line Chart Date Filter: vw_looker_f_work.dates_month
    row: 12
    col: 0
    width: 8
    height: 4
  - name: Work Items Overdue - Total
    label: Work Items Overdue - Total
    model: karbon_reporting_dev
    explore: vw_looker_f_work
    type: single_value
    fields:
    - vw_looker_f_work.dates_month
    - vw_looker_f_work.distinct_work_items
    - vw_looker_f_work.avg_days_overdue
    fill_fields:
    - vw_looker_f_work.dates_month
    filters:
      vw_looker_f_work.is_overdue: Y
    sorts:
    - vw_looker_f_work.dates_month desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
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
    comparison_label: days overdue on avg
    listen:
      Comparison Date Filter: vw_looker_f_work.dates_date
    row: 0
    col: 16
    width: 8
    height: 4
  - name: Work Items Completed - Total
    label: Work Items Completed - Total
    model: karbon_reporting_dev
    explore: vw_looker_f_work
    type: single_value
    fields:
    - vw_looker_f_work.distinct_work_items
    - vw_looker_f_work.dates_month
    fill_fields:
    - vw_looker_f_work.dates_month
    filters:
      vw_looker_f_work.dates_date: 2 months
      vw_looker_f_work.primary_status_name: Completed
    sorts:
    - vw_looker_f_work.dates_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: previous_month_difference
      label: Previous Month Difference
      expression: coalesce(${vw_looker_f_work.distinct_work_items},0) - offset(${vw_looker_f_work.distinct_work_items},1)
      value_format:
      value_format_name:
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
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
    ordering: none
    show_null_labels: false
    series_types: {}
    single_value_title: Work items completed
    hidden_fields: []
    hide_legend: false
    x_axis_label: Date
    y_axis_labels:
    - Work Items
    series_labels:
      vw_looker_f_work.distinct_work_items: Work Items
    listen:
      Comparison Date Filter: vw_looker_f_work.dates_date
    row: 0
    col: 8
    width: 8
    height: 4
  - name: Work Items Started - Total
    label: Work Items Started - Total
    model: karbon_reporting_dev
    explore: vw_looker_f_work
    type: single_value
    fields:
    - vw_looker_f_work.distinct_work_items
    - vw_looker_f_work.dates_month
    fill_fields:
    - vw_looker_f_work.dates_month
    filters:
      vw_looker_f_work.dates_date: 2 months
      vw_looker_f_work.primary_status_name: "-Completed,-Planned"
    sorts:
    - vw_looker_f_work.dates_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: previous_month_difference
      label: Previous Month Difference
      expression: "${vw_looker_f_work.distinct_work_items} - offset(${vw_looker_f_work.distinct_work_items},1)"
      value_format:
      value_format_name:
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
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
    ordering: none
    show_null_labels: false
    series_types: {}
    single_value_title: Work items started
    hidden_fields:
    hide_legend: false
    x_axis_label: Date
    y_axis_labels:
    - Work Items
    series_labels:
      vw_looker_f_work.distinct_work_items: Work Items
    listen:
      Comparison Date Filter: vw_looker_f_work.dates_date
    row: 0
    col: 0
    width: 8
    height: 4
  - name: Work currently in each open status
    label: Work currently in each open status
    model: karbon_reporting_dev
    explore: vw_looker_f_work
    type: looker_bar
    fields:
    - vw_looker_f_work.combined_status_name
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      vw_looker_f_work.distinct_work_items: "#C9E6B4"
    series_labels:
      vw_looker_f_work.distinct_work_items: "# Open Work Items"
    y_axes:
    - label: Amount of work items
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
      - id: vw_looker_f_work.distinct_work_items
        name: "# Open Work Items"
    listen:
      Line Chart Date Filter: vw_looker_f_work.dates_month
    row: 16
    col: 0
    width: 8
    height: 8
  - name: Work due vs completed in the last month
    label: Work due vs completed in the last month
    model: karbon_reporting_dev
    explore: work_due_and_completed
    type: looker_area
    fields:
    - work_due_and_completed.dates_date
    - work_due_and_completed.status
    - work_due_and_completed.number_work_items
    pivots:
    - work_due_and_completed.status
    fill_fields:
    - work_due_and_completed.dates_date
    filters:
      work_due_and_completed.dates_date: 1 months
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
    label_density: 25
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
      Work Due - Work Running Total: "#C9E6B4"
      Completed - Work Running Total: "#BED4F1"
    listen:
      Line Chart Date Filter: work_due_and_completed.dates_date
    row: 4
    col: 0
    width: 24
    height: 8
  - name: Days to complete work on average - Total
    label: Days to complete work on average - Total
    model: karbon_reporting_dev
    explore: days_to_complete_work
    type: single_value
    fields:
    - days_to_complete_work.avg_days_to_complete
    - days_to_complete_work.completed_date_month
    fill_fields:
    - days_to_complete_work.completed_date_month
    sorts:
    - days_to_complete_work.completed_date_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: prev_month_value
      label: Prev Month value
      expression: coalesce(${days_to_complete_work.avg_days_to_complete},0) - offset(${days_to_complete_work.avg_days_to_complete},1)
      value_format:
      value_format_name:
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
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
    single_value_title: Days to complete work on avg
    listen:
      Comparison Date Filter: days_to_complete_work.completed_date_month
    row: 12
    col: 8
    width: 8
    height: 4
  - name: Time work spent in each status
    label: Time work spent in each status
    model: karbon_reporting_dev
    explore: days_spent_in_open_states
    type: looker_bar
    fields:
    - days_spent_in_open_states.status
    - days_spent_in_open_states.avg_days_difference
    sorts:
    - days_spent_in_open_states.avg_days_difference desc
    limit: 500
    column_limit: 50
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
      days_spent_in_open_states.avg_days_difference: "#C9E6B4"
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
    listen:
      Line Chart Date Filter: days_spent_in_open_states.last_month
    row: 16
    col: 8
    width: 8
    height: 8
  - name: Times due date moved for work
    label: Times due date moved for work
    model: karbon_reporting_dev
    explore: due_dates_moved
    type: looker_bar
    fields:
    - due_dates_moved.due_date_moves
    - due_dates_moved.number_work_items
    sorts:
    - due_dates_moved.due_date_moves
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    hide_legend: false
    series_colors:
      due_dates_moved.number_work_items: "#C9E6B4"
    series_labels: {}
    x_axis_label: Number of times due date moved
    y_axes:
    - label: Work items
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
      - id: due_dates_moved.number_work_items
        name: Number of Work Items
    listen:
      Year: due_dates_moved.year_filter
      Month: due_dates_moved.month_filter
    row: 16
    col: 16
    width: 8
    height: 8
  - name: Avg number of times due date moved
    label: Avg number of times due date moved
    model: karbon_reporting_dev
    explore: due_dates_moved
    type: single_value
    fields:
    - due_dates_moved.tenant_name
    - due_dates_moved.count_times_due_date_moved
    - due_dates_moved.sum_times_due_date_moved
    sorts:
    - due_dates_moved.count_times_due_date_moved desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: average_of_times_due_date_moved
      label: 'Average # Of Times Due Date Moved'
      expression: "${due_dates_moved.sum_times_due_date_moved}/${due_dates_moved.count_times_due_date_moved}"
      value_format:
      value_format_name: decimal_1
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
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
    hidden_fields:
    - due_dates_moved.sum_times_due_date_moved
    - due_dates_moved.count_times_due_date_moved
    - due_dates_moved.tenant_name
    series_types: {}
    single_value_title: Avg number of times due date moved
    listen:
      Year: due_dates_moved.year_filter
      Month: due_dates_moved.month_filter
    row: 12
    col: 16
    width: 8
    height: 4
  filters:
  - name: Comparison Date Filter
    title: Comparison Date Filter
    type: date_filter
    default_value: 2 months
    model:
    explore:
    field:
    listens_to_filters: []
  - name: Line Chart Date Filter
    title: Line Chart Date Filter
    type: date_filter
    default_value: this month
    model:
    explore:
    field:
    listens_to_filters: []
  - name: Year
    title: Year
    type: number_filter
    default_value: '2017'
    model:
    explore:
    field:
    listens_to_filters: []
  - name: Month
    title: Month
    type: number_filter
    default_value: '4'
    model:
    explore:
    field:
    listens_to_filters: []
