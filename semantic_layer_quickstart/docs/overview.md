# Semantic + Metric Layer Overview

## 1. Concept
- **Gold schema** holds fact and dimension tables with comments for discoverability.
- **Semantic views** join the fact to each dimension, exposing a business-friendly dataset.
- **Metric views** (YAML syntax) sit on top of semantic views and declare measures/dimensions for Databricks Metrics UI.

## 2. Scripts
| Script | Description | Key Objects |
|--------|-------------|-------------|
| `sql/01_schemas.sql` | Create gold and semantic schemas (idempotent). | Schemas only |
| `sql/02_tables.sql` | Create a sample fact table and minimal dimensions. | `fact_invoice_line_quickstart`, `dim_supplier_quickstart`, `dim_date_quickstart` |
| `sql/03_semantic_views.sql` | Build semantic views for supplier and date perspectives. | `v_invoice_supplier_quickstart`, `v_invoice_calendar_quickstart` |
| `sql/04_metric_views.sql` | Define metric views in YAML for use in Metrics UI. | `mv_invoice_supplier_quickstart`, `mv_invoice_calendar_quickstart` |

## 3. Deployment Flow
```
[01_schemas] -> [02_tables] -> [03_semantic_views] -> [04_metric_views]
```

## 4. Using the Metric Views
1. Deploy the bundle (see README instructions).
2. In Databricks, open **Metrics** > select your catalog/schema to find `mv_invoice_*` views.
3. Build charts by dragging measures (spend, quantity) and dimensions (supplier name, calendar month).
4. Because this quickstart skips QA, validate metrics manually if required.

## 5. Next Steps
- Swap the sample data in `sql/02_tables.sql` with your own staging tables.
- Add relationships/metadata registries if you plan to integrate with Genie.
- Layer in validation scripts once you are ready for production.
