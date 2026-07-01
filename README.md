# nvidia-gpu-market-analysis-sql
SQL Data Analysis project exploring NVIDIA GPU pricing, product evolution, and business growth during the AI expansion (2018–2025).

## 📖 Project Overview

This project analyzes the impact of Artificial Intelligence (AI) expansion on NVIDIA's GPU product evolution, pricing strategy, and business growth between 2018 and 2025. Using real NVIDIA GPU specifications and yearly market data, a relational PostgreSQL database was designed to explore trends in GPU releases, launch prices, VRAM capacity, CUDA cores, architecture evolution, market share, and revenue growth. The project demonstrates practical SQL skills by applying joins, aggregate functions, subqueries, common table expressions (CTEs), window functions, and business analysis queries to extract meaningful insights from real-world data.


## 🎯 Business Problem

The rapid growth of Artificial Intelligence has significantly increased the demand for high-performance GPUs. NVIDIA has become the market leader in AI hardware, but how has this AI expansion influenced the company's GPU releases, pricing strategy, hardware evolution, market share, and revenue growth?

This project aims to answer these questions through SQL-based data analysis using real NVIDIA GPU data from 2018 to 2025.

## 🎯 Project Objectives

- Analyze NVIDIA GPU release trends from 2018 to 2025.
- Examine changes in GPU launch prices over time.
- Analyze VRAM capacity growth across GPU generations.
- Study CUDA core evolution and GPU computing power.
- Track memory technology evolution (GDDR5 → GDDR6 → GDDR6X → GDDR7).
- Compare NVIDIA GPU architectures from Turing to Blackwell.
- Analyze NVIDIA market share growth.
- Analyze NVIDIA revenue and Data Center revenue growth.
- Compare GPU specifications before and after the AI boom.
- Perform business analysis using advanced SQL queries.

  ## 📂 Dataset

This project uses three relational tables.

### gpu_info
Contains detailed specifications of NVIDIA consumer GPUs.

Columns:
- GPU ID
- Model Name
- Release Date
- Release Year
- Launch Price (USD)
- VRAM (GB)
- Memory Type
- Architecture
- CUDA Cores
- RT Cores
- Tensor Cores
- Base Clock (MHz)
- Boost Clock (MHz)
- TDP (W)
Records: **39**

### market_summary
Contains yearly NVIDIA business performance.

Columns:
- Year
- Total NVIDIA GPUs Released
- NVIDIA Market Share (%)
- NVIDIA Revenue (Billion USD)
- Data Center Revenue (Billion USD)
Records: **8**

### industry_events
Contains major AI industry events.

Columns:
- Year
- Event
- Related To
Records: **8**

## 🗄 Database Design

Database Name
nvidia_gpu_market_analysis

Tables
- gpu_info
- market_summary
- industry_events

Relationships
market_summary (Parent)
gpu_info (Child)
industry_events (Child)

## 💻 SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- CASE Expressions
- INNER JOIN
- LEFT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Views
- Primary Key
- Foreign Key


- ## 📊 Business Analysis

1. GPU Release Trend
2. Average Launch Price
3. Highest-Priced GPUs
4. VRAM Evolution
5. CUDA Core Evolution
6. Memory Type Evolution
7. Architecture Evolution
8. Data Center Revenue Growth
9. Revenue Growth
10. Market Share Growth
11. Price vs VRAM
12. Price vs CUDA Cores
13. Power Efficiency
14. AI Boom Comparison
15. Top 10 GPUs
16. Best GPU of Each Year
17. Revenue vs GPU Releases
18. AI Events Impact

## 📈 Key Insights

- NVIDIA introduced 39 consumer GPUs between 2018 and 2025.
- Average GPU launch prices increased significantly after the AI boom.
- VRAM capacity increased from 4 GB to 32 GB across GPU generations.
- CUDA core counts increased substantially, reflecting major improvements in GPU computing performance.
- GPU memory technology evolved from GDDR5 to GDDR7.
- NVIDIA Data Center revenue experienced rapid growth during the AI expansion.
- NVIDIA's market share increased alongside the growing adoption of AI technologies.
- The Blackwell architecture represents NVIDIA's latest advancement in AI-focused GPU design.

  ## 🛠 Technologies Used

- PostgreSQL
- SQL
- Microsoft Excel
- Git
- GitHub

  ## 🚀 Future Improvements

- Develop an interactive Power BI dashboard.
- Perform Exploratory Data Analysis (EDA) using Python.
- Include benchmark performance metrics.
- Add GPU sales and shipment data when publicly available.

  ## 👨‍💻 Author

Al Imran

B.Tech Computer Science & Engineering ~ Student

Aspiring Data Scientist | SQL | Excel | Power BI | Python
