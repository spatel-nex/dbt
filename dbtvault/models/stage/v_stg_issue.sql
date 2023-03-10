{%- set yaml_metadata -%}

source_model: 'raw_stg_issue'
derived_columns:
  RECORD_SOURCE: '!JIRA'
hashed_columns:
  ISSUE_HASH_KEY: 'ISSUE_ID'
  PARENT_HASH_KEY: 'PARENT_ID'
  PARENT_ISSUE_HASH_KEY:
    - 'ISSUE_ID'
    - 'PARENT_ID'
  ISSUE_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'PROJECT'
      - 'PRIORITY'
      - 'CREATED'
      - 'STATUS'
      - 'ISSUE_TYPE'
      - 'LABELS'
      - 'DUE_DATE'
      - 'TIME_ORIGINAL_ESTIMATE'
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