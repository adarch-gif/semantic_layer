-- Metric views using YAML syntax for Metrics UI.

CREATE OR REPLACE VIEW `${catalog}`.`${schema_sem}`.mv_invoice_supplier_quickstart
WITH METRICS
LANGUAGE YAML
AS $$
version: 1.1
comment: "Supplier-level spend metrics for the quickstart semantic layer."
source: ${catalog}.${schema_sem}.v_invoice_supplier_quickstart
timestamp: invoice_date
dimensions:
  - name: Supplier Name
    expr: supplier_name
  - name: Supplier Segment
    expr: supplier_segment
measures:
  - name: Total Merchandise Amount
    expr: SUM(merchandise_amount)
  - name: Total Invoice Amount
    expr: SUM(total_invoice_amount)
  - name: Total Quantity
    expr: SUM(quantity)
  - name: Total Freight Cost
    expr: SUM(freight_cost)
  - name: Total Tax Cost
    expr: SUM(tax_cost)
  - name: Invoice Line Count
    expr: COUNT(1)
$$;

CREATE OR REPLACE VIEW `${catalog}`.`${schema_sem}`.mv_invoice_calendar_quickstart
WITH METRICS
LANGUAGE YAML
AS $$
version: 1.1
comment: "Calendar trend metrics for the quickstart semantic layer."
source: ${catalog}.${schema_sem}.v_invoice_calendar_quickstart
timestamp: invoice_date
dimensions:
  - name: Calendar Year
    expr: calendar_year
  - name: Calendar Month
    expr: calendar_month
  - name: Calendar Month Name
    expr: calendar_month_name
measures:
  - name: Total Merchandise Amount
    expr: SUM(merchandise_amount)
  - name: Total Invoice Amount
    expr: SUM(total_invoice_amount)
  - name: Total Quantity
    expr: SUM(quantity)
  - name: Total Freight Cost
    expr: SUM(freight_cost)
  - name: Total Tax Cost
    expr: SUM(tax_cost)
$$;
