Directory structure on AWS:

~\NPO_USA\info
~\NPO_USA\raw_data
~\NPO_USA\dataset\990
                 \pf
                 \ez
~\NPO_USA\dump_files

~\NPO_USA\info
informative files

~\NPO_USA\raw_data
for storing the downloaded raw dataset

~\NPO_USA\dataset\990, ..\ez, ..\pf
csv files after cleansing, ready for the selection from forms

~\NPO_USA\dump_files
files ready to be dumped onto th database


STEPS:

1. csv_download.R
Downloading all csv files from NCCS web server to study them.

2. select_data_all_forms.R
Select relevant columns from each form type (990, ez, pf) and divide the whole data in four dataframes, one with common basic information from all organisations and three 
more with especific data fron each different form type.
Also create a zip-city-state dictionary. 

3. NPO_scheme.sql
Create the schema on the database.
Create the five tables needed.
Dump the data from the previous step.
Create keys, foreign keys and indexes.
Pay attention to warnings on the result to proceed with the data cleaning.