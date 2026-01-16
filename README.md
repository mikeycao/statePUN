# Overview

This repository is for making several compiled state-level sociodemographic indicators publicly available for use in panel (or cross-sectional) analyses covering changes in U.S. states over the last two decades (2000 to 2018). 
The indicators are well-suited for panel studies of social inequality across state populations, and were originally compiled as covariates to adjust for ommitted variable bias, but they can also act as key predicators and outcome variables ipso facto. 

Since the individual state-level indicators are highly correlated with each other, introducing them separately into models may introduce unwelcome problems of multicollinearity. The individual-indicators are therefore leveraged as two combined scales: a Poverty Index and a Population Heterogeneity Index.

## A. Composition of the Poverty Index 

The Poverty Index consists of (1) low educational attainment, operationalized by the population of those at least 25 years old with less than a high school education (decimal %), (2) the Black resident population (decimal %), (3) state residents (as individuals) that are 138% at or below the federal poverty threshold (decimal %), (4) TANF caseloads (per 1000 state residents), and (5) GINI coefficients. All data extend between the years 2002 to 2018 for total national estimates and for all 50 U.S. states, although in our raw data files, we include data for 2000 and 2001 as well. 

A1. For measure 1, we used the following sources: U.S. Department of Commerce, Census Bureau: Census Briefs, Educational Attainment; and American Community Survey (ACS) 1-Year data accessed through the Integrated Public Use Microdata Series (IPUMS).

A2. For measure 2, we used the following sources: Statistical Abstracts of the U.S. 

_Notes_: For select years, we had to manually calculate percentages by dividing the total count of the Black resident population over the total state resident population for that year --- data was taken from Statistical Abstracts of the U.S. Estimates are for residents identified as non-Hispanic Black. For 2001, we could not find racial demographic data from Statistical Abstracts and instead pulled the data from the Current Population Survey (CPS).

A3. For measure 3, we used the following sources: U.S. Census and single-year ACS data accessed via IPUMS. 

_Notes_: The federal poverty threshold was drawn at and below 138%, which is the point individuals may still qualify for Medicaid. 

A4. For measure 4, we used the following sources: U.S. Department of Health and Human Services; Office of Family Assistance TANF caseload data; single-year U.S. Census/ACS data accessed via IPUMS.

_Notes_: Caseload data was drawn from calendar year averages of the total number of recipients of TANF. Rates were calculated by taking recipient totals and dividing them over total resident population numbers from Census estimates.

A5. For measure 5, we used the following sources: State Health Access Data Assistance Center (SHADAC) accessing data through the ACS for single-years 2006 to 2018; 2000 to 2005 single-year data was copied from Hisnanick and Rogers (2007) of the U.S. Census Bureau analyzing ACS data (see: https://www.census.gov/content/dam/Census/library/working-papers/2007/demo/ACS-inequality-report-2000-2005_v2.pdf).

_Notes_: 0 means perfect income equality; 1 means perfect income inequality; GINIs from 2000 to 2005 were rounded to two decimal places.
