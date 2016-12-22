# BGSE Dashboard Project: Analytics on the US Nonprofit Sector in 2013

### Overview

The objectives of our project are to:

- Give insight into the ways in which the US nonprofit sector functions using descriptive and analytic views 
- Provide a revenue estimatior for small, medium and large non-profits using the dashboard based on a statistical model

### Structure

The core of the analysis is contained in these two files:

- `NPO_schema.sql`
- `analysis.R`

### Implementation

To develop the LASSO regression, we first have identified 80 relevant variables with respect to total revenue. Then we carried out a LASSO regression using the `glmnet` package with the objective to select variables with a significant marginal contribution to revenue. 

### Required packages

The `R` analysis relies on the following packages. 

- `glmnet`
- `dplyr`
- `RMySQL`

### Templates Used
- Website: https://github.com/puikinsh/gentelella
- Presentation: https://github.com/impress/impress.js

### Languages Used
- R
- SQL
- HTML/CSS
- Javascript
- Python
