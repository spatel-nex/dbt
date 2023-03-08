{%- set source_model = "v_stg_issue" -%}
{%- set src_pk = "ISSUE_HASH_KEY" -%}
{%- set src_hashdiff = "ISSUE_HASHDIFF" -%}
{%- set src_payload = ["ISSUE_ID", "PROJECT_ID", "SUMMARY", "DESCRIPTION", "PRIORITY", "CREATED", "UPDATED", "STATUS", "PROGRESS", "ISSUE_TYPE", "LABELS", "VOTES",
                       "DUE_DATE", "TIME_ORIGINAL_ESTIMATE", "TIME_REMAINING_ESTIMATE", "TIME_SPENT"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}