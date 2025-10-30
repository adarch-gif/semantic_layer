-- Semantic views expose curated tables with business-friendly columns.

USE CATALOG ${catalog};

CREATE OR REPLACE VIEW ${schema_sem}.v_invoice_supplier_quickstart AS
SELECT
  f.invoice_id,
  f.invoice_line_id,
  f.invoice_date,
  s.supplier_id,
  s.supplier_name,
  s.supplier_segment,
  f.quantity,
  f.unit_price,
  (f.quantity * f.unit_price) AS merchandise_amount,
  f.freight_cost,
  f.tax_cost,
  (f.quantity * f.unit_price + f.freight_cost + f.tax_cost) AS total_invoice_amount
FROM ${schema_gold}.fact_invoice_line_quickstart f
JOIN ${schema_gold}.dim_supplier_quickstart s
  ON f.supplier_id = s.supplier_id;

CREATE OR REPLACE VIEW ${schema_sem}.v_invoice_calendar_quickstart AS
SELECT
  f.invoice_id,
  f.invoice_line_id,
  f.invoice_date,
  d.calendar_year,
  d.calendar_month,
  d.calendar_month_name,
  f.quantity,
  (f.quantity * f.unit_price) AS merchandise_amount,
  f.freight_cost,
  f.tax_cost,
  (f.quantity * f.unit_price + f.freight_cost + f.tax_cost) AS total_invoice_amount
FROM ${schema_gold}.fact_invoice_line_quickstart f
JOIN ${schema_gold}.dim_date_quickstart d
  ON f.invoice_date = d.date_key;
