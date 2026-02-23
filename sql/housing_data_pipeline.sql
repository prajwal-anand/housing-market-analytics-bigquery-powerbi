/* ============================================================
   Project: Housing Analytics (GCP + BigQuery + Power BI)
   Author: Prajwal Anand
   Description:
   This script creates a layered warehouse architecture:

   1. Raw Layer              → housing_raw
   2. Transformation Layer   → housing_transformed
   3. Analytical View Layer  → region_yearly_summary

   ============================================================ */


/* ============================================================
  SECTION 1 — RAW DATA LAYER
  Purpose: Store original source data (CSV upload) 
          without transformation.
  Notes:
  - Data is manually uploaded into housing_raw.
  - This table should remain immutable.
  - No business logic is applied at this stage.
   ============================================================ */

  SELECT *
  FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_raw`;

/* ============================================================
   SECTION 2 — TRANSFORMATION LAYER
   Purpose: Create working dataset for business logic updates
   ============================================================ */

  CREATE OR REPLACE TABLE 
  `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_transformed` AS
  SELECT *
  FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_raw`;

  SELECT *
  FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_transformed`;

  /* ------------------------------------------------------------
   Apply Business Rule:
   Standardize sqm_price = 100 for properties with 3 rooms
   ------------------------------------------------------------ */
  
  UPDATE `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_transformed`
  SET sqm_price = 100
  WHERE no_rooms = 3;

  SELECT *
  FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_transformed`;

/* ============================================================
   SECTION 3 — BUSINESS AGGREGATION CHECK
   Purpose: Validate transformation logic
   ============================================================ */
  
  SELECT
      sales_type,
      ROUND(AVG(purchase_price),2) AS `Average Purchase Price` 
      FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_transformed`
  GROUP BY sales_type;

/* ============================================================
   SECTION 4 — ANALYTICAL VIEW LAYER
   Purpose: Create pre-aggregated reporting layer for BI tools
   ============================================================ */

CREATE OR REPLACE VIEW `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.region_yearly_summary` AS
(
  SELECT region AS `Region`,
  EXTRACT(YEAR FROM date) AS `Year`,
  COUNT(DISTINCT house_id) AS `Units Sold`,
  ROUND(SUM(purchase_price),2) AS `Total Sales`,
  ROUND(AVG(purchase_price),2) AS `Average Sale Price`,
  ROUND(AVG(sqm_price),2) AS `Average Price Per SQM`
  FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.housing_transformed`
  GROUP BY region, EXTRACT(YEAR FROM date)
  ORDER BY region, EXTRACT(YEAR FROM date)
);

SELECT *
FROM `project-572353cd-40b4-4551-806.HousingAnalyticsDataset.region_yearly_summary`