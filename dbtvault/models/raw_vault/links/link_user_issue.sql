{%- set source_model = ["v_stg_user", "v_stg_issue"] -%}
{%- set src_pk = "LINK_USER_ISSUE_HASH_KEY" -%}
{%- set src_fk = ["USER_HASH_KEY", "ISSUE_HASH_KEY"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}