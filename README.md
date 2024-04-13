#  Results for the Data Analyst Challenge 2022 - Nimble Gravity

## Introduction:

This repository aims to showcase the information obtained as a result of completing the Data Analyst Challenge 2022 developed by Mauro Lopez of Nimble Gravity as part of their hiring process.

[Link to the challenge](https://writer.zohopublic.com/writer/published/hpp809176f475e2a74a04a6822920b6e3da32).

## Objectives:

The challenge aims to present information on:

1. How was the evolution of women in government during time?

2. How was the evolution of the ratio "production employees / supervisory employees" during time?

These objectives must be achieved by analyzing the information published by the U.S. Bureau of Labour Statistics in their Current Employment Statistics - CES (National) series.

## Results:

1. How was the evolution of women in government during time?

![women_in_government_graph](https://github.com/urbsebastiancastro/Data-Analyst-Challenge-2022/assets/147194288/f805cbdd-e8d8-4137-8c4f-dfe878a1a3e1)

The above graph shows the growth of female employees in the governmental sector. The data has been collected monthly since 1964 until the last publication date in February 2024. For visibility purposes, the graph represents the data cut-off at the end of January each year.
It can be observed that from the start of data collection until the present date, there has been organic and steady growth, equivalent to an average annual rate of 2.24%. However, there are four significant periods of decline. The first occurs from March 1981 to July 1982 with a decline of 3.85%. The second period occurred from June 2005 to June 2006, where there was a decrease of 2.91% in female government employment. The third decline is observed from May 2010 to June 2013, the longest period of recorded decline with a 4.91% loss of employment in that period. Finally, the period with the greatest decrease in a short amount of time was recorded from February 2020 to May of the same year, with a loss in employment of 7.07%. Likewise, we can observe two significant periods of constant growth. The first one begins from the start of data collection in January 1964 to February 1981 with a growth of 122.52% in the entry of women into the governmental sector. The second long growth period was experienced from May 1983 to May 2005 with a growth of 58.01% in that period.

2. How was the evolution of the ratio "production employees / supervisory employees" during time?

![production_supervisory_ratio_graph](https://github.com/urbsebastiancastro/Data-Analyst-Challenge-2022/assets/147194288/18bf7ffd-99ca-47c1-9ac0-3f68168f277d)

The above graph shows the relationship between the number of nonsupervisory employees or production employees and the number of employees in supervisory positions (how many nonsupervisory employees exist for every supervisory employee). The data has been collected monthly since 1939 until the last publication date in February 2024. For visibility purposes, the graph represents the data cut-off at the end of January each year.
The graph is divided into two periods of variability in the employee ratio. The first occurred from the start of data collection in January 1939, with a ratio of 6.02, reaching a maximum of 8.73 in July 1943 and falling to the historical minimum of 3.6 in December 1963, spanning 25 years. The second period began in January 1964 with a ratio between nonsupervisory and supervisory employees of 4.7, decreasing to 4.1 by February 1983. Subsequently, the relationship between employees remains relatively stable until May 2004, when it begins to rise until reaching 4.67 in March 2008, where it remains stable again until March 2020, where a small decrease to a ratio of 4.37 in January 2021 occurs, remaining constant until the date of the last data collection in 4.7 in February 2024.

## Methodology:

As explained, the data was extracted from the historical information provided by the U.S. Bureau of Labour Statistics in their Current Employment Statistics - CES (National) series (link).
To achieve the first objective, the table "ce.data.90a.Government.Employment" within the proposed dataset at the challenge's link in .csv format was imported into the database using the tools of the DBeaver program. Subsequently, the table was ordered within the database itself (to use Python as little as possible, as indicated by the challenge). Once the data was sorted, a view named "women_in_government" was created, which filters the data from the table "ce.data.90a.Government.Employment" to those of the series_id CES9000000010, which corresponds to the CE series (CURRENT EMPLOYMENT STATISTICS), S for Seasonal adjusted, 90 which corresponds to the supersector code for government, and 10 which corresponds to Women employees.

The view for women_in_government can be viewed at: [women_in_government](http://localhost:3000/women_in_government).

To achieve the second objective, the table containing the entire series "ce.data.0.AllCESSeries" was imported since the dataset does not contain tables containing only the information on the number of Production or nonsupervisory employees or Supervisory employees necessary to make the comparison and obtain the ratio. The table "ce.data.0.AllCESSeries" was imported and ordered in the same way as the table for the first objective. Subsequently, the data on the number of Production or nonsupervisory employees was extracted by filtering the data from the table "ce.data.0.AllCESSeries" containing the codes of all supersectors and finally the industry_code 06 corresponding to the data of Production or nonsupervisory employees. To obtain the number of supervisory employees, a subtraction was made between the number of Production or nonsupervisory employees and the total number of employees in each supersector using the industry_code 01 corresponding to the total employees of each supersector. Finally, to obtain the result of the second objective, a function was created that returns a table that calculates the ratio between Production or nonsupervisory employees and supervisory employees. 

The table containing the ratio can be viewed at: [get_employee_ratio](http://localhost:3000/rpc/get_employee_ratio).

## Final Comments:

Finally, attached to the repository are .sql files containing the methodology to replicate the results, a stored procedure that formats the imported .csv files, the view that allows visualization of the first objective, and the function that allows obtaining the second objective. 

I hope that the explanations and information provided are understandable and to your liking. I remain attentive and open to any comments to improve the quality of the information provided.

By Sebastian Castro.
