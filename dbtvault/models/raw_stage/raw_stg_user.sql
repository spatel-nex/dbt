WITH 
roles AS (
    SELECT array_construct("fields.creator.accountId", "fields.creator.displayName", "fields.creator.emailAddress", "fields.creator.active", "fields.creator.timeZone", "fields.creator.accountType") 
            AS creator,
            array_construct("fields.assignee.accountId", "fields.assignee.displayName", "fields.assignee.emailAddress", "fields.assignee.active", "fields.assignee.timeZone", "fields.assignee.accountType") 
            AS assignee,
            array_construct("fields.reporter.accountId", "fields.reporter.displayName", "fields.reporter.emailAddress", "fields.reporter.active", "fields.reporter.timeZone", "fields.reporter.accountType")
            AS reporter
    FROM  {{ source('jira', 'ISSUES') }}
),
distinct_users AS (
    SELECT DISTINCT users FROM roles
    UNPIVOT(users FOR user_sets IN (creator, assignee, reporter))
)

SELECT 
    users[0]::number as user_id,
    users[1]::varchar as user_name,
    users[2]::text as email_address,
    users[3]::boolean as active,
    users[4]::varchar as time_zone,
    users[5]::varchar as account_type
FROM distinct_users
ORDER BY user_id