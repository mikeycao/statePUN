![Dataset](https://img.shields.io/badge/-datasets-success?)
![Version](https://img.shields.io/badge/version-1.0.0-blue)

<img width="180" align="right" alt="statePUN_logo" src="https://github.com/user-attachments/assets/85c68b77-3925-4481-a18b-0a5e15cd7dde" />

# statePUN: State-level panel covariates for estimating mass punishment and sociodemographic disparity, 2000–2018

This repository is for making several compiled and standardized sociodemographic indicators  available for public use as state-level panel datasets. Panel observations cover all 50 U.S states and the country as a whole, updated for the last two decades (2000 to 2018). 

The main indicators track state-level socieconomic deprivation and population heterogeneity, and were originally compiled to support research estimating the conditional effects of mass punishment rates (e.g., incarceration/probation/parole) by accounting for commonly omitted confounders,[^1] but they have broad application for population-based studies of social problems and sociodemographic change more generally. The indicators can also act as key predicators or outcome variables ipso facto.  

On their own, the panel datasets are intended as public tools for summarizing the demographic trajectories of individual states, how these state trajectories compare nationally and with each other across socioeconomic domains, and where disparities exist at what points in time.  

Since the individual state-level indicators are highly correlated with each other, introducing them separately into models may introduce unwelcome problems of multicollinearity. Individual indicators are therefore leveraged as two combined scales: a poverty index (α = 0.73) and a population heterogeneity index (α = 0.88).

All panel datasets are **balanced** and arranged in the **wide format** for understanding the dimensionality of the data, unless otherwise noted.[^2] 

[^1]: For example, endogeneity can occur between incarceration rates and popular dependent variables, like household wealth or mortality, when a confounder such as educational attainment is omitted from estimates. 
[^2]: A few select panel datasets are arranged in the long format, in anticipation of ad hoc data processing/manipulation users may perform.

## Repository Structure

The repository contains two main folders: 

+ `code/`: contains `R scripts` accompanying the data
   - `index_reliability_coefficient_analysis.R`: code for reproducing reliability coefficients for the two indices 
   - `linear spline interpolation of urbanicity.R`: code for reproducing the interpolation of [urbanicity](data/individual%20data%20files/%28B%29%20population%20heterogeneity%20index%20data/PRE_spline_interpolation_urban.csv)
+ `data/`: harmonized sociodemographic panel data for all 50 U.S. states, 2000-2018
   - `combined data files/`: 
      - `combined_poverty_index.csv`: composite poverty index after individual indicators were combined and standardized, arranged in the long format
      - `combined_population_heterogeneity_index_with_urbanicity.csv`: composite population heterogeneity index after individual indicators were combined and standardized, arranged in the long format 
   - `individual data files/`: indicator panel datasets arranged for individual analysis
      - `(A) poverty index data/`: 
         - `(1) low_educational_attainment.csv`: low educational attainment (% of state population)
         - `(2) Black_population.csv`: Black population (% of state population) 
         - `(3) population_poverty.csv`: below federal poverty threshold (% of state population)
         - `(4) TANF.csv`: Temporary Assistance for Needy Families (TANF) caseloads (per 1000 state residents) 
         - `(5) Gini_coefficients.csv`: Gini coefficients 
      - `(B) population heterogeneity index data/`
         - `(1) foreign_born_population.csv`: foreign-born population (% of state population)
         - `(2) Hispanic_population.csv`: Hispanic population (% of state population) 
         - `(3) urbanicity_interpolated.csv`: residing in urban areas (% of state population), post-interpolation, arranged in the long format 
         - `PRE_spline_interpolation_urban_wide`: pre-interpolated urbanicity
      - `additional indicators/`: supplementary folder containing additional (non-index) indicators covering state crime rates
         - `(1) homicide_rates.csv`: homicide rates (per 100,000 state residents)
         - `(2) violent_crime_rates.csv`: violent crime rates (per 100,000 state residents)
         - `(3) property_crime_rates.csv`: property crime rates (per 100,000 state residents) 

## (A) Composition and Data Sources of the Poverty Index 

The poverty index consists of (1) low educational attainment, operationalized by the population of those at least 25 years old that did not complete high school (decimal %), (2) the Black population (decimal %), (3) state residents (as individuals) that are 138% at or below the federal poverty threshold (decimal %), (4) Temporary Assistance for Needy Families (TANF) caseloads (per 1000 state residents), and (5) GINI coefficients. 

**A1.** For indicator 1, the following sources were used: U.S. Department of Commerce, Census Bureau: Census Briefs, Educational Attainment; and American Community Survey (ACS) 1-Year data accessed through the Integrated Public Use Microdata Series (IPUMS).

**A2.** For indicator 2, the following sources were used: Statistical Abstracts of the U.S. 

_Notes_: For select years, percentages had to be manually calculated by dividing the total count of the Black resident population over the total state resident population for that year --- data was taken from Statistical Abstracts of the U.S. Estimates are for residents identified as non-Hispanic Black. For 2001, racial demographic data from Statistical Abstracts could not be found, and data was instead pulledfrom the Current Population Survey (CPS).

**A3.** For indicator 3, the following sources were used: U.S. Census and single-year ACS data accessed via IPUMS. 

_Notes_: The federal poverty threshold was drawn at and below 138%, which is the point individuals may still qualify for Medicaid. 

**A4.** For indicator 4, the following sources were used: U.S. Department of Health and Human Services; Office of Family Assistance TANF caseload data; single-year U.S. Census/ACS data accessed via IPUMS.

_Notes_: Caseload data was drawn from calendar year averages of the total number of recipients of TANF. Rates were calculated by taking recipient totals and dividing them over total resident population numbers from Census estimates.

**A5.** For indicator 5, the following sources were used: State Health Access Data Assistance Center (SHADAC) accessing data through the ACS for single-years 2006 to 2018; 2000 to 2005 single-year data was copied from Hisnanick and Rogers (2007) of the U.S. Census Bureau analyzing ACS data (see: https://www.census.gov/content/dam/Census/library/working-papers/2007/demo/ACS-inequality-report-2000-2005_v2.pdf).

_Notes_: 0 means perfect income equality; 1 means perfect income inequality; GINIs from 2000 to 2005 were rounded to two decimal places.

## (B) Composition and Data Sources of the Population Heterogeneity Index 

The population heterogeneity index consists of (1) the foreign-born population (decimal %), (2) the Hispanic population (decimal %), and an interpolated indicator of residents living in urban areas (decimal %). 

**B1.** For indicator 1, the following sources were used: U.S. Census and single-year ACS accessed via IPUMS.

_Notes_: Foreign-born status was treated as those born as U.S. citizens (including those born in Puerto Rico, U.S. Virgin Islands, and Guam), using the birthplace (bpl) variable in the Census/ACS codebook. Also accounted for are individuals foreign-born, but to parents with U.S. citizenship (and thus are considered native). Naturalized citizens are treated as foreign-born for the purpose of analysis. 

**B2.** For indicator 2, the following sources were used: U.S. Census and single-year ACS accessed via IPUMS.

_Notes_: A variable recording Hispanic origin (hispan) from the U.S. Census/ACS codebook was used. The variable simultaneously covers descents from Mexico and other Latin countries.

**B3.** For indicator 3, official government data on urban populations is affected by issues of missingness and definitional variation in how the U.S. Census Bureau quantifies urbanicity across census years and 1-year estimates. In an attempt to overcome these two problems, a linear spline interpolation of the Decennial Census of Population and Housing (available through the Iowa State University Community Indicators Program) that recorded the urban population percentages from 1900 to 2010 was implemented. The interpolation was decidedly based from the 2000 to 2010 data points because those years best shared a stable definition of what the Census Bureau defined as “urban”. A linear spline interpolation was chosen given the steady-state demographic growth observed in urbanicity percentages dating back to the 1900s as opposed to abrupt changes; the large gaps in the missing data; and the broadness of the panel across which data needed to be interpolated.

## Combined Index Data 

Two `.csv` files are included that provide a standardization (z-score transformation) of all individual indicators combined to create the poverty index and population heterogeneity index, as well as the compiled index value for each specific year and state. The `.csv` files are organized into a long-format to ease with data manipulation using statistical software. 

_Notes_: For the poverty index, z1 refers to low educational attainment; z2 refers to the Black population share; z3 refers to individual poverty threshold rates; z4 refers to TANF cases; z5 refers to GINI coefficients. For the population heterogeneity index, z1 refers to the foreign born population; z2 refers to the Hispanic population; z3 refers to urbanicity.

## Additional Indicators

### State Crime Rates

Additional indicators involving state (per 100,000) rates for homicide, all violent crime, and all property crime offenses are also included in the repository, given their potential high collinearity with state imprisonment rates. Data for all states and panel years was scraped and compiled using the Crime Data Explorer (CDE) tool administered by the [FBI Uniform Crime Reporting Program (UCR)](https://www.fbi.gov/how-we-can-help-you/more-fbi-services-and-information/ucr). 

_Notes_: The CDE was [revamped](https://www.fbi.gov/news/press-releases/fbi-releases-monthly-crime-and-law-enforcement-data) in August 2025, after data was gathered, so the panel datasets reflect an older version of UCR reporting methodology. 

## Code 

Analysis involving the poverty index and population heterogeneity index was undertaken using `R`. Mainly, `R` code is provided to analyze the reliability coefficients using Cronbach's alpha, and additional code that was used to implement the linear spline interpolation of urbanicity. 

## Citing statePUN 

Suggested citation:

Cao, Michael. 2026. _statePUN: State-level panel covariates for estimating mass punishment and sociodemographic disparity, 2000–2018_ (Version 1.0.0) [Data set], https://github.com/mikeycao/statePUN.

```bibtex
@dataset{cao2026statepun,
  title     = {statePUN: State-level panel covariates for estimating mass punishment and sociodemographic disparity, 2000--2018},
  author    = {Cao, Michael},
  year      = {2026},
  version   = {1.0.0}
  url       = {https://github.com/mikeycao/statePUN}
}
```
## License

`statePUN` is made available under a Creative Commons CC0 1.0 license, meaning it is dedicated to the public domain and may be freely used, shared, and modified without legal attribution. For details see [LICENSE](LICENSE.md).
