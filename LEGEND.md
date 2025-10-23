# Project Legend

**Project name:** telecom_churn_project
**Purpose:** Build reproducible dbt models to transform telecom customer data into a star schema for churn analysis.

## Conventions
- File and column naming: snake_case.
- Models: staging models live in models/staging and are materialized as views.
- Marts: analytical models live in models/marts and are materialized as tables.
- Seeds: small, authoritative CSVs live in seeds/.
- Sources: raw data loaded into the `raw` schema in the target DuckDB file and declared under sources in models/schema.yml.

## Materialization rules
- staging: view
- intermediate: table
- analytics/marts: table

## Operational notes
- Large raw CSVs must not be committed to Git; load into DuckDB or a data warehouse and declare as sources.
- Use dbt build for local CI: `dbt build --profiles-dir ~/.dbt`
- Use dbt docs for lineage and documentation: `dbt docs generate` then `dbt docs serve`

## Contacts and ownership
- Owner: Sayed
- Repo: <your repo URL>

