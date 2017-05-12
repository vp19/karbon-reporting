connection: "khq-reporting-stage"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: vw_looker_f_work {
  description: "Looker Model for Work"
  #view_label: "Work Looker Model"
  view_label: " "
  access_filter: {
    field: vw_looker_f_work.tenant_permakey
    user_attribute: tenant_permakey
  }
}

explore: work_due_and_completed {
  description: "Looker Model for Work due and completed"
  view_label: "Work Looker Model for Work due and completed"
  access_filter: {
    field: work_due_and_completed.tenant_permakey
    user_attribute: tenant_permakey
  }
}

explore: days_to_complete_work {
  access_filter: {
    field: days_to_complete_work.tenant_permakey
    user_attribute: tenant_permakey
  }
}

explore:  days_spent_in_open_states {
  access_filter: {
    field: days_spent_in_open_states.tenant_permakey
    user_attribute: tenant_permakey
  }
}

explore:  due_dates_moved {
  access_filter: {
    field: due_dates_moved.tenant_permakey
    user_attribute: tenant_permakey
  }
}