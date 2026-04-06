## Project Overview: Fan Loyalty & Retention Engine
"Developed a Modern Data Stack solution to identify high-value fans and predict churn for the Colorado Rockies' Revenue Team."

## Key Business Metrics (KPIs)
Fan LTV (Lifetime Value): Aggregated total ticket spend to identify the "Top 10%" of advocates for premium upsells.

Churn Risk Detection: Automated a 180-day and 365-day 'Recency' flag to trigger win-back campaigns before season ticket renewals.

Loyalty Segmentation: Categorized fans into Super Fan, Frequent, and Occasional tiers to enable personalized marketing.

## The Tech Stack
Snowflake: Cloud Data Warehouse for scalable storage.

dbt (data build tool): For SQL modeling, automated testing, and documentation.

Python: To simulate the MLB Stats API ingestion.

![Data Lineage Graph](lineage_graph.png)
Fig 1. Data Lineage & Traceability: This graph illustrates the automated flow from raw MLB ticket seeds to our final Fan LTV and Churn Marts. By maintaining clear lineage, we ensure that every revenue figure is auditable and 100% transparent for stakeholders like 601 Analytics.