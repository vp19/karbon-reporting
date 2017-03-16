connection: "khq-reporting-stage"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: vw_looker_f_work {
  description: "Looker Model for Work"
  view_label: "Work Looker Model"
}

explore: work_due_and_completed {
  description: "Looker Model for Work due and completed"
  view_label: "Work Looker Model for Work due and completed"
}
