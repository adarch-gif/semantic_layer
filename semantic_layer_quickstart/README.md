# Semantic Layer Quickstart

This quickstart shows how to stand up a minimal semantic layer on Databricks, including the metric layer that feeds Databricks Metrics UI. It keeps only the essentials so new stakeholders can deploy and experiment without wading through QA/validation steps.

## Repository Layout

| Path | Purpose |
|------|---------|
| docs/overview.md | One-page guide that explains the model and deployment steps. |
| sql/ | SQL scripts that build schemas, tables, semantic views, and metric views. |
| infra/databricks.yml | Databricks Asset Bundle that executes the SQL scripts in order. |

## Quickstart

1. Clone this folder into a Databricks Repo or local workspace.
2. Review `docs/overview.md` for concepts and the deployment order.
3. Deploy using the Databricks CLI from the `infra/` folder:
   ```bash
   databricks bundle deploy \
     --var catalog=<your_catalog> \
     --var schema_gold=invoice_gold_quickstart \
     --var schema_sem=invoice_semantic_quickstart \
     --var warehouse_name="<your warehouse>"
   databricks bundle run semantic_layer_quickstart
   ```
4. Open Databricks Metrics UI and explore the metric views under `catalog.schema_sem`.

## Customisation

- Extend `sql/02_tables.sql` with your own dimensions/facts.
- Add new semantic views or metric views by copying the patterns in `sql/03_semantic_views.sql` and `sql/04_metric_views.sql`.
- Because this quickstart omits validation, run your own QA if you intend to productionise it.
