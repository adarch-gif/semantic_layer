-- Create gold and semantic schemas for the quickstart.

CREATE SCHEMA IF NOT EXISTS ${catalog}.${schema_gold}
  COMMENT "Quickstart gold schema for invoice tables.";

CREATE SCHEMA IF NOT EXISTS ${catalog}.${schema_sem}
  COMMENT "Quickstart semantic schema for invoice views and metric views.";
