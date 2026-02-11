 Power BI Dashboard – Revenue Risk & Recovery Simulation

This folder contains the Power BI implementation of the Retail Revenue Risk framework.

Objective:

To quantify revenue exposure from at-risk customers and products, and simulate the financial impact of churn and recovery interventions.

This is not a demand forecast.  
It is a revenue stress-testing and mitigation model.


Dashboard Pages

 Revenue Risk Overview
- Total Revenue
- Revenue At Risk
- % Revenue At Risk
- ABC revenue concentration analysis
- Exposure by product class

Customer Risk Analysis
- At-risk customer count
- Revenue exposure by segment
- Average inactivity period
- Revenue trend for at-risk customers

 Product Revenue Risk
- Products at risk
- A-class product exposure
- Top 10 revenue-at-risk products
- ABC-based risk distribution

Forecast & Recovery Simulation
Scenario-based stress testing using defined assumptions:
- 25% churn assumption (downside scenario)
- 40% recovery assumption (intervention scenario)
- Recovery capped at baseline revenue
- Historical data through Feb 2021

---

 Modeling Logic

- ABC classification based on revenue contribution
- Customer risk derived from RFM segmentation
- Revenue exposure linked across customer and product layers

---

Files

- `RetailPulse.pbix` → Power BI dashboard file
- `dashboard_screenshots/` → Visual previews for repository documentation

---

 Notes

- This model uses historical transactional data.
- Scenario outputs represent stress-test simulations, not predictive forecasting.
- Assumptions can be modified to evaluate sensitivity.
