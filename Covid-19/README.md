
## Table of Contents
- [1. Summary](#1)
- [2. Ask](#2)
- [3. Prepare](#3)
  - [3.1 Dataset used](#3.1)
  - [3.2 Accessibility and privacy of data](#3.2)
  - [3.3 Information about dataset](#3.3)
  - [3.4 Data organization and verification](#3.4)
  - [3.5 Data credibility and intergrity](#3.5)
- [4. Process](#4)
- [5. Analyse](#5)
- [6. Share](#6)
- [7. Act](#7)

<a name="1"></a>
# 1.Summary 📚
Covid-19 is an infectious disease caused by the SAR-CoV-2 virus. Most people infected with this virus will experience mild to moderate respiratory illness, but some may become severely ill and require medical care. And anyone, at any age, can get sick, become seriously ill, and die.The disease first broke out at the end of 2019, and then spread rapidly to many countries around the world in 2020, gradually turning into a global pandemic.

The focus of this case is to organize the raw data set and analyze the development trend of the new coronavirus and the later vaccine response measures in the whole world.

<a name="2"></a>
# 2. Ask 🤔
Identify trends in covid-19

<a name="3"></a>
# 3. Prepare 🌱

<a name="3.1"></a>
## 3.1 Dataset Used 
The dataset used for this case study is Covid-19 deaths dataset. This dataset is from Our World in Data (OWID), which is a scientific online publication that focus on large global problems such as poverty, disease, hunger, climate change, was, existential rishs, and inequality.

<a name="3.2"></a>
## 3.2 Accessibility and privacy of data
We can determine from the source website of the data, OWID, that this is an open source dataset. Under copyright law, we can copy, modify, distribute and perform works, even for commercial purposes, without asking permission. Provided the owner waives all his or her worldwide rights to the work to the extent permitted by law, thereby placing the work in the field of publication.

<a name="3.3"></a>
## 3.3 Information about dataset
This dataset records data about the Covid-19 from February 4, 2020 to the present. This dataset was provided to OWID by experts in the field Edouard Mathieu, Hannah Ritchie, Lucas Rodés-Guirao, Cameron Appel, Daniel Gavrilov, Charlie Giattino, Joe Hasell, Bobbie Macdonald, Saloni Dattani, Diana Beltekian, Esteban Ortiz-Ospina, and Max Roser organization and it is updated daily.

<a name="3.4"></a>
## 3.4 Data organization and verification
The dataset for this case study is a CSV file. The data is considered long since each row is one time point per country or area, hence, each country or are will have data in multiple rows. Then, the dataset has been separeated in to two files, Deaths and Vaccine, for the convenience of exploring their individual trends.

| Table Name | Type | Description | Columns Example |
| --- | --- | --- | --- |
| CovidDeaths | xlsx | Data of deaths due to Covid-19 globally | Location, Date, Population, Cases, Deaths |
| CovidVaccinations | xlsx | Data of vaccinations of Covid-19 globally | Location, Date, Population, Vaccinations |
| CovidData | xlsx | Combination of above two |  |

<a name="3.5"></a>
## 3.5 Data credibility and intergrity
The reliability and completeness of this database are relatively high, except for some countries or regions where data is missing or updated at different times than others (data for most countries is updated daily). This can be. It may cause the analysis results or the process of virus spread to have slightly deviated from the real results, but overall this is a very complete dataset.


