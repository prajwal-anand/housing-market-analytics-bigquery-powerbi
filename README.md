# 🏠 Housing Market Analytics Platform  
### BigQuery Data Warehouse + Power BI Executive Dashboard

---

## 📌 Overview

This project implements an end-to-end housing market analytics platform using **Google BigQuery** and **Power BI**.

It transforms raw transactional housing data into a structured data warehouse and delivers executive-level insights on:

- Regional market performance  
- Property pricing dynamics  
- Sales growth trends  
- Macroeconomic impact (inflation, interest rates, bond yields)  

This project demonstrates a **Data Engineering + BI Hybrid (Analytics Engineering) approach**.

---

## 🎯 Business Objective

Enable real estate investors, analysts, and financial institutions to monitor housing market performance through structured KPIs and time-intelligence metrics.

Key questions answered:

- Which regions are driving sales growth?
- How are property prices changing YoY?
- What is the current market momentum (YTD & LTM)?
- How do macroeconomic indicators influence housing performance?
- Which property types show stronger negotiation gaps?

---

## 🏗 Architecture

### Layered Warehouse Design

```
CSV Upload
↓
housing_raw (Raw Layer)
↓
housing_transformed (Business Logic Layer)
↓
region_yearly_summary (Analytical View Layer)
↓
Power BI Executive Dashboard
```

### 🥉 Raw Layer — `housing_raw`
- Direct CSV ingestion
- Immutable source data
- No transformations applied

### 🥈 Transformation Layer — `housing_transformed`
- Business rule application
- Cleaned reporting dataset
- Separation of ingestion and analytics logic

### 🥇 Analytical View — `region_yearly_summary`
Pre-aggregated metrics by region and year:
- Units sold
- Total sales
- Average sale price
- Average price per sqm

---

## 🛠 Tech Stack

- **Google BigQuery**
  - Layered warehouse design
  - SQL transformations
  - Analytical view creation
- **Power BI**
  - DAX time intelligence
  - Date dimension modeling
  - Executive dashboard design
- **SQL Concepts**
  - Aggregations
  - Views
  - Structured transformations
  - Rebuildable warehouse scripting

---

## 📊 Core KPIs Implemented (DAX)

- Total YTD Sales  
- Last 12 Months Sales  
- YoY Sales Growth  
- Median Sales Price Change  
- Units Sold (Latest Year & Quarter)  
- Sales by Region  
- Offer to SQM Ratio  
- Average Price per SQM  

All time-based calculations leverage a proper Date Dimension table.

---

## 📈 Insights Delivered

### Market Performance
- 13B+ Last 12 Months sales tracking
- Year-to-date performance monitoring
- Quarterly demand trends

### Regional Analysis
- Sales distribution by region
- Median price growth by territory
- High-performing investment zones

### Property Type Analysis
- Offer vs Purchase gap evaluation
- SQM price comparison
- Sales type growth trends

### Macroeconomic Impact
- Inflation rate correlation
- Interest rate influence
- Mortgage bond yield relationship

---

## 📂 Repository Structure
```
/sql
01_housing_warehouse_setup.sql

/powerbi
Housing_Market_Analytics.pbix

README.md
```

---

## 🚀 How to Rebuild

1. Upload CSV into `housing_raw`
2. Run `01_housing_warehouse_setup.sql`
3. Connect Power BI to `housing_transformed`
4. Refresh model

---

## 🔮 Future Improvements

- Table partitioning by date
- Clustering by region
- Incremental data pipeline simulation
- Automated ingestion using Cloud Functions
- Star schema normalization
- KPI threshold alerts

---

## 👤 Author

**Prajwal Anand**  
Aspiring Analytics Engineer | SQL | BigQuery | Power BI | Data Warehousing
