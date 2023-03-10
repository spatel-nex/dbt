SELECT
    "id" as issue_id,
    user_id,
    split_part(relation_type, '.', 2) as relation_type
FROM {{ source('jira', 'ISSUES') }}
UNPIVOT(user_id FOR relation_type IN ("fields.assignee.accountId", "fields.creator.accountId", "fields.reporter.accountId"))
