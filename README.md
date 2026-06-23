# IPL Franchise Investment Intelligence Dashboard

## Project Overview

This project evaluates IPL franchises as investable assets using a Moneyball-inspired analytical framework.

Rather than analyzing teams solely through wins and championships, this study combines franchise valuation, auction spending, win rates, and capital efficiency metrics to determine which IPL franchises generate the strongest long-term value.

The project applies principles commonly used in investment analysis and corporate valuation to the IPL ecosystem, treating franchises as business assets rather than sports teams.

---

## Business Problem

Traditional sports analysis focuses on performance metrics such as wins, playoff appearances, and championships.

However, investors evaluate assets differently.

This project explores the following question:

> If IPL franchises were investable assets, which teams would generate the strongest risk-adjusted returns?

The analysis examines whether spending translates into wins, whether wins translate into valuation growth, and which franchises create the most value from their investments.

---
## Project Architecture 

Raw IPL Data
      ↓
SQL Analysis
      ↓
Metric Engineering
      ↓
Final Dataset
      ↓
Tableau Dashboards
      ↓
Investment Recommendations

## Research Questions

### Dashboard 1 — Executive Investment Summary

**Research Question:**

Which IPL franchises represent the strongest investment opportunities?

Key areas explored:

- Investment attractiveness
- Risk-adjusted returns
- Capital efficiency
- Franchise recommendations (BUY / HOLD / AVOID)

---

### Dashboard 2 — Franchise Valuation Evolution

**Research Question:**

How have IPL franchise valuations evolved over time?

Key areas explored:

- Historical franchise valuation growth
- Commercial value creation
- Market leaders
- Long-term valuation trends

---

### Dashboard 3 — Value Creation Drivers

**Research Question:**

What factors drive franchise value creation in the IPL ecosystem?

Key areas explored:

- Winning performance
- Capital efficiency
- Brand strength
- Return on investment

---

## Data Sources

The project combines multiple IPL-related datasets including:

- Franchise auction spending
- Historical match results
- Win-loss records
- Franchise valuation data
- Team performance metrics

The final analytical dataset was engineered through SQL transformations and business metric calculations.

---

## Tech Stack

### Data Processing

- SQL
- Excel

### Data Visualization

- Tableau Public

### Version Control

- Git
- GitHub

---

## Metrics Developed

The following custom business metrics were created for the analysis:

### Win Rate

Percentage of matches won by each franchise.

### Cost Per Win

Measures how much a franchise spends for every victory achieved.

```
Cost Per Win = Total Spend / Total Wins
```

### Value Creation Efficiency

Measures brand value generated for every ₹1 Cr spent.

```
Value Creation Efficiency = Brand Value / Total Spend
```

### Moneyball Score

Composite metric used to evaluate investment attractiveness based on efficiency and performance.

### Investment Recommendation

Franchises classified as:

- BUY
- HOLD
- AVOID

based on their overall business and performance profile.

---

## Dashboard Portfolio

### Dashboard 1 — Executive Investment Summary

Purpose:

Evaluate franchises as investable assets and identify the strongest investment opportunities.

Interactive Dashboard:
 ![Executive Investment Summary](assets/Executive%20Investment%20Summary.png)

[[Dashboard 1 Link Here](https://public.tableau.com/views/IPLFranchiseInvestmentIntelligenceDashboard/ExecutiveInvestmentSummary?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]

---

### Dashboard 2 — Franchise Valuation Evolution

Purpose:

Analyze how IPL franchise valuations evolved over time and identify long-term value creators.

Interactive Dashboard: 
![Franchise Valuation Evolution](assets/IPL%20Franchise%20Valuation%20Evolution.png)

🔗 Tableau Public:
PASTE_LINK


[[Dashboard 2 Link Here](https://public.tableau.com/views/IPLFranchiseInvestmentIntelligenceDashboard/IPLFranchiseValuationEvolution?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]

---

### Dashboard 3 — Value Creation Drivers

Purpose:

Identify the key factors responsible for franchise value creation.

Interactive Dashboard:
![Value Creation Drivers](assets/IPL%20Franchise%20Value%20Creation%20Drivers.png)

🔗 Tableau Public:
PASTE_LINK

[[Dashboard 3 Link Here](https://public.tableau.com/views/IPLFranchiseValueCreationDashboard/IPLFranchiseValueCreationDrivers?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)]

---

## Key Findings

### Mumbai Indians

- Strongest overall investment profile
- Highest value creation efficiency
- Excellent balance between spending and performance

### Gujarat Titans

- Highest historical win rate
- Exceptional performance despite limited operating history
- Fastest competitive success story

### Royal Challengers Bengaluru

- Highest franchise valuation
- Demonstrates the impact of brand strength and fan engagement
- Commercial leader of the league

### Punjab Kings

- Lowest capital efficiency
- Weakest value creation profile
- Example of inefficient capital deployment

---

## Repository Structure

```text
ipl-franchise-investment-intelligence

├── README.md

├── data
│   ├── auction_master.csv
│   ├── brand_value_data.csv
│   └── final_dataset.csv

├── sql
│   └── ipl_investment_analysis.sql

├── tableau
│   └── IPL_Franchise_Investment_Intelligence.twbx

├── dashboards
│   ├── Executive Investment Summary.pdf
│   ├── IPL Franchise Valuation Evolution.pdf
│   └── IPL Franchise Value Creation Drivers.pdf

└── assets
    ├── Executive Investment Summary.png
    ├── IPL Franchise Valuation Evolution.png
    └── IPL Franchise Value Creation Drivers.png
```

---

## SQL Analysis

SQL was used to:

- Calculate win rates
- Calculate cost per win
- Create franchise rankings
- Build efficiency metrics
- Generate the final analytical dataset

The complete workflow is available in:

```
sql/ipl_investment_analysis.sql
```

---

## Skills Demonstrated

### Technical Skills

- SQL
- Tableau
- Data Cleaning
- Data Transformation
- Business Intelligence
- Dashboard Design

### Analytical Skills

- KPI Development
- Investment Analysis
- Capital Efficiency Analysis
- Sports Analytics
- Data Storytelling

---

## Project Outcome

This project demonstrates how business intelligence and investment frameworks can be applied to sports franchises.

By combining performance data, spending patterns, and valuation metrics, the analysis identifies the franchises that generate the strongest long-term value and highlights the factors that drive commercial success in the IPL ecosystem.

---