{%- set source_model = "v_stg_user" -%}
{%- set src_pk = "USER_HASH_KEY" -%}
{%- set src_hashdiff = "USER_HASHDIFF" -%}
{%- set src_payload = ["ACCOUNT_TYPE", "USER_NAME", "EMAIL_ADDRESS",
                       "ACTIVE", "TIME_ZONE"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}