# BGSE Dashboard Project: Analytics on the US Nonprofit sector

### Overview

The objectives of our project are:

- Give insight on the US Nonprofit sector in 2013 with relevant data and graphs
- Provide a revenue estimation for small, medium and large non-profits using the web

The ultimate goal is to provide information and estimate of total revenue that can be used by a user intersted in the sector or someone who is in charge of a NPO and is willing to hopefully increase its revenues.

### Structure

The core of the analysis is contained in these two files:

- `NPO_schema.sql`
- `analysis.R`

### Implementation

To develop the LASSO regression, we first have identified 80 relevant variables in terms of total revenue. Then we have carried out a LASSO regression using the `glmnet` package with the objective to narrow down the number of variables with a significant marginal contribution to revenue. 


### Required packages

The `R` analysis relies on the following packages. 

- `glmnet`
- `dplyr`
- `RMySQL`

