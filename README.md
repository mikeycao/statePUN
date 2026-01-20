![Dataset](https://img.shields.io/badge/-datasets-success?)
![Version](https://img.shields.io/badge/version-1.0.0-blue)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)

<img width="180" align="right" alt="statePUN_logo" src="https://github.com/user-attachments/assets/85c68b77-3925-4481-a18b-0a5e15cd7dde" />

# statePUN: State-level panel covariates for estimating mass punishment and sociodemographic disparity, 2000–2018

This repository is for making several compiled and standardized state-level sociodemographic indicators publicly available for use as panel datasets. Panel observations cover all 50 U.S states and the country as a whole, updated for the last two decades (2000 to 2018). 

The indicators track state-level socieconomic deprivation and population heterogeneity, and were originally compiled to support research estimating the conditional effects of mass punishment rates (e.g., incarceration/probation/parole) by accounting for commonly omitted confounders,[^1] but they have broad application for population-based studies of social problems and sociodemographic change more generally. The indicators can also act as key predicators or outcome variables ipso facto.  

On their own, the panel datasets are intended as public tools for summarizing the demographic trajectories of individual states, how these state trajectories compare nationally and with each other across socioeconomic domains, and where disparities exist at what points in time.  

Since the individual state-level indicators are highly correlated with each other, introducing them separately into models may introduce unwelcome problems of multicollinearity. The individual-indicators are therefore leveraged as two combined scales: a poverty index (α = 0.73) and a population heterogeneity index (α = 0.88).

All panel datasets are **balanced** and arranged in the **wide format** for understanding the dimensionality of the data, unless otherwise noted. 

[^1]: For example, endogeneity can occur between incarceration rates and popular dependent variables, like household wealth or mortality, when a confounder such as educational attainment is omitted from estimates. 

## Repository Structure

The repository contains two main folders: 

+ `code/`
   - `index reliability coefficient analysis.R`
   - `linear spline interpolation of urbanicity.R`
+ `data/`
   - `combined + transformed data files/`
      - `(A) combined_poverty_index.csv`      (LONG)
      - `(B) combined_population_heterogeneity_index_with_urbanicity.csv`   (LONG) 
   - `individual data files/`
      - `(A) poverty index data/`
         - `(1) low_educ_attainment.csv`
         - `(2) Black_population.csv`
         - `(3) population_poverty.csv`
         - `(4) TANF.csv`
         - `(5) GINI_coefficients.csv`
      - `(B) population heterogeneity index data/`
         - `(1) foreign_born_population.csv`
         - `(2) Hispanic_population.csv`
         - `(3) urbanicity_interpolated.csv`
         - `PRE_spline_interpolation_urban_wide` 

### A. Composition of the Poverty Index 

The poverty index consists of (1) low educational attainment, operationalized by the population of those at least 25 years old with less than a high school education (decimal %), (2) the Black resident population (decimal %), (3) state residents (as individuals) that are 138% at or below the federal poverty threshold (decimal %), (4) TANF caseloads (per 1000 state residents), and (5) GINI coefficients. All data extend between the years 2000 to 2018 for total national estimates and for all 50 U.S. states.

**A1.** For indicator 1, the following sources were used: U.S. Department of Commerce, Census Bureau: Census Briefs, Educational Attainment; and American Community Survey (ACS) 1-Year data accessed through the Integrated Public Use Microdata Series (IPUMS).

**A2.** For indicator 2, the following sources were used: Statistical Abstracts of the U.S. 

_Notes_: For select years, percentages had to be manually calculated by dividing the total count of the Black resident population over the total state resident population for that year --- data was taken from Statistical Abstracts of the U.S. Estimates are for residents identified as non-Hispanic Black. For 2001, racial demographic data from Statistical Abstracts could not be found, and data was instead pulledfrom the Current Population Survey (CPS).

**A3.** For indicator 3, the following sources were used: U.S. Census and single-year ACS data accessed via IPUMS. 

_Notes_: The federal poverty threshold was drawn at and below 138%, which is the point individuals may still qualify for Medicaid. 

**A4.** For indicator 4, the following sources were used: U.S. Department of Health and Human Services; Office of Family Assistance TANF caseload data; single-year U.S. Census/ACS data accessed via IPUMS.

_Notes_: Caseload data was drawn from calendar year averages of the total number of recipients of TANF. Rates were calculated by taking recipient totals and dividing them over total resident population numbers from Census estimates.

**A5.** For indicator 5, the following sources were used: State Health Access Data Assistance Center (SHADAC) accessing data through the ACS for single-years 2006 to 2018; 2000 to 2005 single-year data was copied from Hisnanick and Rogers (2007) of the U.S. Census Bureau analyzing ACS data (see: https://www.census.gov/content/dam/Census/library/working-papers/2007/demo/ACS-inequality-report-2000-2005_v2.pdf).

_Notes_: 0 means perfect income equality; 1 means perfect income inequality; GINIs from 2000 to 2005 were rounded to two decimal places.

## B. Composition of Population Heterogeneity Index 

The population heterogeneity index consists of (1) the foreign-born resident population (decimal %), (2) the Hispanic resident population (decimal %), and an interpolated indicator of resident populations living in urban areas (decimal %). 

**B1.** For indicator 1, the following sources were used: U.S. Census and single-year ACS accessed via IPUMS.

_Notes_: Foreign-born status was treated as those born as U.S. citizens (including those born in Puerto Rico, U.S. Virgin Islands, and Guam), using the birthplace (bpl) variable in the Census/ACS codebook. We also accounted for individuals foreign-born, but to parents with U.S. citizenship (and thus are considered native). Naturalized citizens are treated as foreign-born for the purpose of analysis. 

**B2.** For indicator 2, the following sources were used: U.S. Census and single-year ACS accessed via IPUMS.

_Notes_: A variable recording Hispanic origin (hispan) from the U.S. Census/ACS codebook was used. The variable simultaneously covers descents from Mexico and other Latin countries.

**B3.** For indicator 3, official government data on urban populations is affected by issues of missingness and definitional variation in how the U.S. Census Bureau quantifies urbanicity across census years and 1-year estimates. In an attempt to overcome these two problems, a linear spline interpolation of the Decennial Census of Population and Housing (available through the Iowa State University Community Indicators Program) that recorded the urban population percentages from 1900 to 2010 was implemented. The interpolation was decidedly based from the 2000 to 2010 data points because those years best shared a stable definition of what the Census Bureau defined as “urban”. A linear spline interpolation was chosen given the steady-state demographic growth observed in urbanicity percentages dating back to the 1900s as opposed to abrupt changes; the large gaps in the missing data; and the broadness of the panel across which data needed to be interpolated.

## C. Combined Index Data 

Two `.csv` files are included that provide a standardization (z-score transformation) of all individual indicators used to compile the poverty index and population heterogeneity index, as well as the compiled index value for each specific year and state. The `.csv` files are organized into a long-format to ease with data manipulation using statistical software. 

_Notes_: For the poverty index, z1 refers to low educational attainment; z2 refers to the Black population share; z3 refers to individual poverty threshold rates; z4 refers to TANF cases; z5 refers to GINI coefficients. For the population heterogeneity index, z1 refers to the foreign born population; z2 refers to the Hispanic population; z3 refers to urbanicity.

## D. Code 

Analysis involving the poverty index and population heterogeneity index was undertaken using `R`. Mainly, `R` code is provided to analyze the reliability coefficients using Cronbach's alpha, and additional code that was used to implement the linear spline interpolation of urbanicity. 

