SELECT
    "id" as issue_id,
    "key" as issue_key,
    "fields.issuetype.name" as issue_type,
    "fields.project.name" as project,
    "fields.parent.id" as parent_id,
    "fields.parent.key" as parent_key,
    "fields.status.name" as status,
    "fields.duedate" as due_date,
    "fields.timeoriginalestimate" as time_original_estimate,
    "fields.priority.name" as priority,
    "fields.created" as created,
    "fields.updated" as updated,
    "fields.labels" as labels,
    "fields.assignee.accountId" as assignee,
    "fields.creator.accountId" as creator,
    "fields.reporter.accountId" as reporter
FROM {{ source('jira', 'ISSUES') }}
ORDER BY issue_id