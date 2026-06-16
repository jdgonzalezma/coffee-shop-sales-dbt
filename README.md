Markdown
# Coffee Shop Retail Analytics Pipeline ☕📊

A production-grade **Analytics Engineering** pipeline built with the Modern Data Stack (**dbt + DuckDB**) to clean, model, and validate transactional retail data. This project implements a modular dimensional modeling architecture (Star Schema) to optimize business intelligence operations and revenue tracking.

---

## Architecture & Data Lineage (DAG)

The project separates concerns by implementing a strict multi-layered architecture within DuckDB, ensuring data transformations are modular, idempotent, and highly performant:

1. **Source Layer (`Source`)**: Raw transactional records ingested dynamically from flat CSV files.
2. **Staging Layer (`Staging`)**: Data cleansing, renaming using corporate naming conventions, and explicit type casting using dbt Views (`stg_coffee_sales`).
3. **Marts Layer (`Marts`)**: Persistent physical tables optimized for BI consumption, following a Star Schema approach:
   * `dim_products`: Dimension table containing product attributes and master data.
   * `fct_sales`: High-performance Fact table aggregating revenue metrics, transaction items, and operational KPIs.

raw_coffee_data.raw_transactions  ──>  stg_coffee_sales  ──┬──> dim_products
└──> fct_sales


---

## Tech Stack & Features

* **Transformation Engine**: `dbt-core (v1.11+)` for modular SQL compilation and engineering workflows.
* **Storage & Compute**: `DuckDB (v1.10+)` acting as an ultra-fast, in-process analytical database engine.
* **Data Quality Assurance (QA)**: Automated execution of data constraints to prevent pipeline degradation.
* **Documentation**: Automated interactive lineage graph generation via dbt documentation server.

---

## Data Quality & Automated Testing

To guarantee semantic reliability and prevent corrupted data from reaching business dashboards, automated data tests are configured into the core pipeline schemas:

* **Primary Key Validation**: `unique` and `not_null` constraints applied to `transaction_id` across staging and fact tables to guarantee granularity.
* **Operational Rules**: `not_null` constraints enforced on critical metrics such as `quantity_sold` to ensure downstream financial calculations remain accurate.

All tests are integrated into the deployment cycle and can be evaluated instantly:
bash
dbt test
🚀 How to Run Locally
1. Prerequisites & Environment Setup
Clone this repository and navigate to the workspace root:

Bash
cd coffee_shop_sales
Activate your Python virtual environment and ensure dependencies are installed:

Bash
source venv/bin/activate
pip install dbt-core dbt-duckdb
2. Execute the Pipeline
Navigate to the dbt project folder and trigger the transformation models:

Bash
cd dbt_coffee_project
dbt run
3. Run Quality Assertions
Validate that all data constraints pass successfully:

Bash
dbt test
4. Open Interactive Documentation
Generate and host the local documentation server to view the full column-level lineage and entity descriptions:

Bash
dbt docs generate
dbt docs serve
Developed as part of a professional data engineering portfolio showcasing optimization, clean code, and database modeling proficiency.
