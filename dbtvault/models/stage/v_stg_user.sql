{%- set yaml_metadata -%}

source_model: 'raw_stg_user'
derived_columns:
  RECORD_SOURCE: '!JIRA'
hashed_columns:
  USER_HASH_KEY: 'USER_ID'
  USER_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'USER_NAME'
      - 'EMAIL_ADDRESS'
      - 'ACTIVE'
      - 'TIME_ZONE'
      - 'ACCOUNT_TYPE'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

WITH staging AS (
{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}
)

SELECT *,
       TO_DATE('{{ var('load_date') }}') AS EFFECTIVE_FROM,
       TO_DATE('{{ var('load_date') }}') AS LOAD_DATE
FROM staging