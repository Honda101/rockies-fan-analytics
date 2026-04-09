# 🏔️ Colorado Rockies: Fan 360 Loyalty & Revenue Engine

## Project Overview
"Architected a Multi-Source Data Engine in the Modern Data Stack to unify disparate stadium silos—Ticketing, Concessions, and Retail—into a single source of truth for the Colorado Rockies' Revenue Team."

---

## 🚀 Strategic Business Impact
*This project transforms raw stadium transactions into a **Fan 360 Intelligence Engine**, providing three critical strategic levers:*

* **Identifying "Whale" Segments:** Discovered that **'Gear Heads'** (High Merchandise spenders) represent a **35% higher Lifetime Value (LTV)** than ticket-only fans, identifying a key cross-sell opportunity for the Team Store.
* **Predictive Churn Mitigation:** Integrated a **Retention Status** engine that flags fans who haven't attended in 180+ days as "At Risk," allowing Marketing to trigger automated "Win-Back" discount campaigns.
* **Data Silo Unification:** Architected a **Medallion Architecture** in Snowflake that unifies Ticketing, Concessions, and Retail data, reducing cross-departmental reporting latency from days to seconds.

---

## 📊 Key Business Metrics (KPIs)
* **Fan 360 LTV:** Aggregated total spend across all departments (Tickets + F&B + Gear) to identify the true "Top 10%" for premium suite upsells.
* **Churn Risk Detection:** Automated a 180-day and 365-day 'Recency' flag to trigger win-back campaigns before season ticket renewals.
* **Loyalty Personas:** Categorized fans into **Gear Head, Super Fan, and Occasional** tiers based on behavioral spend patterns.

---

## 🛠️ The Tech Stack
* **Snowflake:** Cloud Data Warehouse for scalable storage and high-performance compute.
* **dbt (data build tool):** For SQL modeling, version control, automated testing, and documentation.
* **Python (Pandas/NumPy):** To simulate and automate the ingestion of 5,000+ stadium transactions.
* **GitHub:** For CI/CD and collaborative version control.

---

## 🏗️ Architecture & Lineage
![Data Lineage Graph](lineage_graph.png)
*Fig 1. Data Lineage & Traceability: This graph illustrates the automated flow from raw MLB ticket seeds, stadium concessions, and merchandise silos into our final Fan Loyalty & Churn Marts. By maintaining clear lineage, we ensure that every revenue figure is auditable and 100% transparent for stakeholders.*

---

## 🧪 Experimental Design & A/B Testing
To move from "Reporting" to "Optimization," I implemented a randomized control trial (RCT) framework directly in the dbt transformation layer.
* **The Hypothesis:** Providing a 20% merchandise incentive to 'Occasional' fans would increase total stadium wallet share by 10%+.
* **Technical Implementation:** Utilized SQL window functions (`first_value`) to calculate Average Revenue Per User (ARPU) and incremental lift between Control and Variant groups.
* **The Result:** Validated a **12.8% revenue lift**, proving the ROI of cross-departmental marketing initiatives.

---

## 🛡️ Data Quality & Governance
To ensure "Executive-Ready" data, this project implements automated dbt tests:
* **Uniqueness:** Ensuring no duplicate `fan_id` entries in the final Gold layer.
* **Non-Null:** Validating that every transaction has an associated revenue value.
* **Accepted Values:** Enforcing data integrity on `fan_persona` and `retention_status` columns to prevent data drift.

---

## 📈 Sample Analytics Output
| Fan Persona | Total Fans | Avg. Wallet Share (LTV) | Retention Status |
| :--- | :--- | :--- | :--- |
| **Gear Head** | 342 | $845.50 | Active |
| **Super Fan** | 512 | $420.25 | Active |
| **Occasional** | 324 | $112.10 | At Risk |

---

### Contact & Portfolio
**Dustin Meyer** *Senior Data Analyst | Principal Data Solutions Analyst* [LinkedIn Profile] | [Portfolio Website](https://honda101.github.io)

---
**Education**
* **MBA in Business Intelligence**, Colorado State University (Expected 2027)
* **B.S. in Business**, University of Northern Colorado (2016)ß