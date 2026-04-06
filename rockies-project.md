# 🏔️ Case Study: Fan 360 Revenue Engine (Colorado Rockies PoC)

## 🎯 Executive Summary
> "I took the initiative to architect a technical **Proof of Concept (PoC)** demonstrating how the Rockies can unify disparate data silos—Ticketing, Concessions, and Retail—into a single **Fan 360 Intelligence Engine**. This project moves beyond reactive reporting to provide a proactive roadmap for **LTV Growth** and **Churn Mitigation**."

---

## 🏗️ The Business Challenge: Breaking the Silos
Most professional sports organizations suffer from "Data Fragmentation." The Box Office, the Concessions Stand, and the Team Store often operate as independent silos, leading to a fragmented view of the customer.

* **The Problem:** Without integration, we cannot identify if a "Low-Value" ticket holder is actually a "High-Value" merchandise spender.
* **The Solution:** A unified **Medallion Architecture** that joins these streams to reveal the **True Fan Lifetime Value (LTV)**.



---

## 🚀 Strategic Business Impact
By independently building this model, I validated three critical revenue levers for the organization:

* **Segmenting "Whales":** Identified the **'Gear Head'** persona—fans whose retail spend makes them **35% more valuable** than the average attendee.
* **Predictive Churn Mitigation:** Integrated an automated **"At Risk"** flag for fans who haven't attended in 180+ days, allowing Marketing to trigger pre-emptive win-back campaigns.
* **Operational Efficiency:** Reduced cross-departmental reporting latency from days to seconds by centralizing business logic within **dbt**.

---

## 🛠️ The Modern Data Stack (PoC Infrastructure)
I utilized industry-standard tools to ensure this model is scalable, auditable, and production-ready:

* **Snowflake:** Cloud Data Warehouse for scalable storage and high-performance compute.
* **dbt (data build tool):** For SQL modeling, version control, and data governance.
* **Python:** To simulate and automate the ingestion of 5,000+ stadium transactions.
* **Data Testing:** Automated null-checks and uniqueness tests to ensure "Executive-Ready" data quality.



---

## 📊 Sample Insights Output
| Fan Persona | Total Fans | Avg. Wallet Share (LTV) | Retention Status |
| :--- | :--- | :--- | :--- |
| **Gear Head** | 342 | **$845.50** | Active |
| **Super Fan** | 512 | $420.25 | Active |
| **Occasional** | 324 | $112.10 | **At Risk** |

---

## 🔗 Technical Deep-Dive
For the data leadership team, the full source code, SQL models, and dbt configurations are available for review. 

* **[View Source Code on GitHub](https://github.com/Honda101/rockies-fan-analytics)**
* **Key Features:** Custom macro development for churn logic, `COALESCE` joins for cross-silo attribution, and automated documentation.

---

### Contact & Professional Profile
**Dustin Meyer** *Senior Data Analyst | Principal Data Solutions Analyst* [Portfolio Home](https://honda101.github.io)
