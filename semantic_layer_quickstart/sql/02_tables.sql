-- Create minimal fact and dimension tables with sample data.

USE CATALOG ${catalog};

CREATE OR REPLACE TABLE ${schema_gold}.dim_supplier_quickstart (
  supplier_id STRING COMMENT "Supplier natural key.",
  supplier_name STRING COMMENT "Display name.",
  supplier_segment STRING COMMENT "Supplier grouping for analysis."
);

INSERT OVERWRITE ${schema_gold}.dim_supplier_quickstart VALUES
  ("SUP-001", "Fresh Farms", "Produce"),
  ("SUP-002", "Ocean Catch", "Seafood");

CREATE OR REPLACE TABLE ${schema_gold}.dim_date_quickstart (
  date_key DATE COMMENT "Calendar date.",
  calendar_year INT COMMENT "Year number.",
  calendar_month INT COMMENT "Month number.",
  calendar_month_name STRING COMMENT "Month label."
);

INSERT OVERWRITE ${schema_gold}.dim_date_quickstart VALUES
  (DATE('2024-01-05'), 2024, 1, 'January'),
  (DATE('2024-01-06'), 2024, 1, 'January');

CREATE OR REPLACE TABLE ${schema_gold}.fact_invoice_line_quickstart (
  invoice_id STRING COMMENT "Invoice identifier.",
  invoice_line_id STRING COMMENT "Line identifier.",
  invoice_date DATE COMMENT "Invoice date.",
  supplier_id STRING COMMENT "Supplier key.",
  quantity DOUBLE COMMENT "Units purchased.",
  unit_price DOUBLE COMMENT "Unit price.",
  freight_cost DOUBLE COMMENT "Freight amount.",
  tax_cost DOUBLE COMMENT "Tax amount."
);

INSERT OVERWRITE ${schema_gold}.fact_invoice_line_quickstart VALUES
  ("INV-1001", "INV-1001-1", DATE('2024-01-05'), "SUP-001", 10, 4.50, 3.00, 1.00),
  ("INV-1002", "INV-1002-1", DATE('2024-01-06'), "SUP-002", 6, 7.25, 2.50, 0.75);
