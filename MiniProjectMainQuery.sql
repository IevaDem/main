use MiniProject
go



--Table for ethnicities:

SELECT DISTINCT
     ETHNOS as ID
     ,CASE
     WHEN ETHNOS = 'H' THEN 'Indian (Asian or Asian British)'
                  WHEN ETHNOS = 'A' THEN 'British (White)'
                  when ethnos = 'K' then 'Bangladeshi (Asian or Asian British)'
				  when ethnos = 'N' then 'African (Black or Black british)'
				  when ethnos = 'D' then 'White and Black Caribbean'
				  when ethnos = 'F' then 'White and Asian (Mixed)'
				  when ethnos = 'L' then 'Any other Asian background' 
				  when ethnos = 'B' then 'Irish (White)'
     END AS DESCRIPTION
	 INTO dbo.DimEthnos
FROM APC


--Table for episode types

SELECT DISTINCT
     epitype as ID
     ,CASE
				WHEN epitype = '6' THEN 'Other birth event '
                  WHEN epitype = '1' THEN 'General episode'
                  when epitype = '2' then 'Delivery episode '
				  when epitype = '3' then 'Birth episode'
				  when epitype = '4' then 'Formally detained'
				  when epitype = '5' then 'Other delivery event'
				  WHEN epitype = '0' THEN 'Not known '
     END AS DESCRIPTION
	 INTO dbo.DimEpitype
FROM APC


--Table for gender:


SELECT DISTINCT
     sex as ID
     ,CASE
                  WHEN sex = 1 THEN 'Male'
                  when sex = 2 then 'Female'
				  when sex = 9 then 'Not specified'
				  when sex = 0 then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimSex
FROM APC


--Table for episode status

SELECT DISTINCT
     epistat as ID
     ,CASE
                  WHEN epistat = '1' THEN 'Unfinished'
                  when epistat = '3' then 'Finished'
				  when epistat = '9' then 'Derived unfinished'
     END AS DESCRIPTION
	 INTO dbo.DimEpistat
FROM APC

--Table for beginning of spell

SELECT DISTINCT
     spellbgin as ID
     ,CASE
                  WHEN spellbgin = '0' THEN 'Not the first episode of spell'
                  when spellbgin = '1' then 'First episode of spell that started in a previous year'
				  when spellbgin = '2' then 'First episode of spell that started in current year'
				  when spellbgin is null then 'Not applicable'
     END AS DESCRIPTION
	 INTO dbo.DimSpellbgin
FROM APC


--Table for patient administrative category

SELECT DISTINCT
     admincat as ID
     ,CASE
                  WHEN admincat = '1' THEN 'NHS patient'
                  when admincat = '2' then 'Private patient'
				  when admincat = '3' then 'Amenity patient'
				  when admincat = '4' then 'Category II patient'
				  when admincat = '98' then 'Not applicable'
				  when admincat = '99' then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimAdmincat
FROM APC


--Table for administrative category at the start of episode

SELECT DISTINCT
     admincatst as ID
     ,CASE
                  WHEN admincatst = '1' THEN 'NHS patient'
                  when admincatst = '2' then 'Private patient'
				  when admincatst = '3' then 'Amenity patient'
				  when admincatst = '4' then 'Category II patient'
				  when admincatst = '98' then 'Not applicable'
				  when admincatst = '99' then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimAdmincatst
FROM APC


--Table for patient's category

SELECT DISTINCT
     category as ID
     ,CASE
                  WHEN category = '10' THEN 'NHS patient: not formally detained '
                  when category = '11' then 'NHS patient: formally detained under Part II'
				  when category = '12' then 'NHS patient: formally detained under Part III'
				  when category = '13' then 'NHS patient: formally detained under part X'
				  when category = '20' then 'Private patient: formally detained under Part II'
				  when category = '21' then 'Private patient: formally detained under Part III'
				  when category = '22' then 'Private patient: formally detained under Part III'
				  when category = '23' then 'Private patient: formally detained under part X'
				  when category = '30' then 'Amenity patient: not formally detained '
				  when category = '32' then 'Amenity patient: formally detained under Part II'
				  when category = '33' then 'Amenity patient: formally detained under Part III'
				  when category is null then 'Other maternity event'
     END AS DESCRIPTION
	 INTO dbo.DimCategory
FROM APC


--Table for patient's legal category

select distinct leglcat from apc

SELECT DISTINCT
     leglcat as ID
     ,CASE
                  WHEN leglcat = '01' THEN 'Informal'
                  when leglcat = '02' then 'Formally detained under the Mental Health Act, Section 2'
				  when leglcat = '03' then 'Formally detained under the Mental Health Act, Section 3'
				  when leglcat = '04' then 'Formally detained under the Mental Health Act, Section 4'
				  when leglcat = '05' then 'Formally detained under the Mental Health Act, Section 5(2)'
				  when leglcat = '06' then 'Formally detained under the Mental Health Act, Section 5(4)'
				  when leglcat = '07' then 'Formally detained under the Mental Health Act, Section 35'
				  when leglcat = '08' then 'Formally detained under the Mental Health Act, Section 36'
				  when leglcat = '09' then 'Formally detained under the Mental Health Act, Section 37 with Section 41 restrictions'
				  when leglcat = '10' then 'Formally detained under the Mental Health Act, Section 37 excluding Section 37(4)'
				  when leglcat = '11' then 'Formally detained under the Mental Health Act, Section 37(4)'
				  when leglcat = '12' then 'Formally detained under the Mental Health Act, Section 38'
				  when leglcat = '13' then 'Formally detained under the Mental Health Act, Section 44'
				  when leglcat = '14' then 'Formally detained under the Mental Health Act, Section 46'
				  when leglcat = '15' then 'Formally detained under the Mental Health Act, Section 47 with Section 49 restrictions'
				  when leglcat = '16' then 'Formally detained under the Mental Health Act, Section 47'
				  when leglcat = '17' then 'Formally detained under the Mental Health Act, Section 48 with Section 49 restrictions'
				  when leglcat = '18' then 'Formally detained under the Mental Health Act, Section 48'
				  when leglcat = '19' then 'Formally detained under the Mental Health Act, Section 135'
				  when leglcat = '20' then 'Formally detained under the Mental Health Act, Section 136'
				  when leglcat = '21' then 'Formally detained under the previous legislation (fifth schedule)'
				  when leglcat = '22' then 'Formally detained under Criminal Procedure (Insanity) Act 1964'
				  when leglcat = '23' then 'Formally detained under other Actc'
				  when leglcat = '24' then 'Supervised discharge under the Mental Health (Patients in the Community) Act 1995'
				  when leglcat = '25' then 'Formally detained under the Mental Health Act, Section 45A'
				  when leglcat = '26' then 'Not applicable'
				  when leglcat = '27' then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimLegalcat
FROM APC


--Table for patient's administrative category

SELECT DISTINCT
     admimeth as ID
     ,CASE
                  WHEN admimeth = '11' THEN 'Waiting list'
                  when admimeth = '12' then 'Booked'
				  when admimeth = '13' then 'Planned'
				  when admimeth = '21' then 'Accident and emergency'
				  when admimeth = '22' then 'General Practitioner'
				  when admimeth = '23' then 'Bed bureau'
				  when admimeth = '24' then 'Consultant Clinic'
				  when admimeth = '25' then 'Admission via Mental Health Crisis Resolution Team'
				  when admimeth = '2A' then 'A&E of another provider'
				  when admimeth = '2B' then 'Transfer of an admitted patient from another Hospital Provider in an emergency '
				  when admimeth = '2C' then 'Baby born at home as intended'
				  when admimeth = '2D' then 'Other emergency admission'
				  when admimeth = '28' then 'Other means'
				  when admimeth = '31' then 'Admitted ante-partum'
				  when admimeth = '32' then 'Admitted post-partum'
				  when admimeth = '82' then 'The birth of a baby in this Health Care Provider '
				  when admimeth = '99' then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimAdmimeth
FROM APC

--Table for the source of admission

SELECT DISTINCT
     admisorc as ID
     ,CASE
                  WHEN admisorc = '19' THEN 'Usual place of residence'
                  when admisorc = '29' then 'Temporary place of residence'
				  when admisorc = '48' then 'High security psychiatric hospital'
				  when admisorc = '53' then 'Ward for patients who are mentally ill or have learning disabilities'
				  when admisorc = '54' then 'NHS run Care Home '
				  when admisorc = '66' then 'Local authority foster care'
				  when admisorc = '69' then 'Local authority home or care'
				  when admisorc = '87' then 'Non-NHS run hospital'

     END AS DESCRIPTION
	 INTO dbo.DimAdmisorc
FROM APC


--Table for episode duration

SELECT DISTINCT
     elecdur as ID
     ,CASE
                  WHEN elecdur = '9998' THEN 'Not applicable'
                  when elecdur = '9999' then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimElecdur
FROM APC


--Table the admission class

SELECT DISTINCT
     classpat as ID
     ,CASE
                  WHEN classpat = '1' THEN 'Ordinary admission'
                  when classpat = '2' then 'Day case admission'
				  when classpat = '3' then 'Regular day attender'
				  when classpat = '4' then 'Regular night attender'
				  when classpat = '9' then 'Not known'
     END AS DESCRIPTION
	 INTO dbo.DimClasspat
FROM APC



--Lookup table joins. Below query joins the created tables with the dataset
--it replaces a number with the description from HES data dictionary


UPDATE APC SET ethnos =  DimEthnos.DESCRIPTION FROM APC JOIN DimEthnos ON ethnos = DimEthnos.ID
UPDATE APC SET epitype =  DimEpitype.DESCRIPTION FROM APC JOIN DimEpitype ON epitype = DimEpitype.ID
UPDATE APC SET sex =  DimSex.DESCRIPTION FROM APC JOIN DimSex ON sex = DimSex.ID
UPDATE APC SET epistat =  DimEpistat.DESCRIPTION FROM APC JOIN DimEpistat ON epistat = DimEpistat.ID
UPDATE APC SET spellbgin =  DimSpellbgin.DESCRIPTION FROM APC JOIN DimSpellbgin ON spellbgin = DimSpellbgin.ID
UPDATE APC SET Admincat =  DimAdmincat.DESCRIPTION FROM APC JOIN DimAdmincat ON Admincat = DimAdmincat.ID
UPDATE APC SET Admincatst =  DimAdmincatst.DESCRIPTION FROM APC JOIN DimAdmincatst ON Admincatst = DimAdmincatst.ID
UPDATE APC SET Category =  DimCategory.DESCRIPTION FROM APC JOIN DimCategory ON Category = DimCategory.ID
UPDATE APC SET leglcat =  DimLegalcat.DESCRIPTION FROM APC JOIN DimLegalcat ON leglcat = Dimlegalcat.ID
UPDATE APC SET Admimeth =  DimAdmimeth.DESCRIPTION FROM APC JOIN DimAdmimeth ON Admimeth = DimAdmimeth.ID
UPDATE APC SET Admisorc =  DimAdmisorc.DESCRIPTION FROM APC JOIN DimAdmisorc ON Admisorc = DimAdmisorc.ID
UPDATE APC SET Classpat =  DimClasspat.DESCRIPTION FROM APC JOIN DimClasspat ON Classpat = DimClasspat.ID



--Select query for the final table

select 
  lopatid as Local_Patient_ID
 ,hesid as HES_ID
 ,isnull(newnhsno, 'Unknown') as NHS_Number
 ,newnhsno_check as NHS_Number_Check
 ,diag_01 as Diagnosis
 ,classpat as Patient_Class
 ,sex as Sex
 ,ethnos as Ethnicity
 ,admincat as Admin_Category
 ,admincatst as Admin_Category_Start
 ,category as Category
 ,leglcat as Legal_Category
 ,isnull(nullif(dob, '1800-01-01'), 'Unknown')  as Date_of_Birth
 ,isnull(nullif(mydob, '01/1800'), 'Unknown') as DoB_Month_Year
 ,isnull (bedyear, 'Unknown') as Days_in_Bed
 ,episode as Episode
 ,epistart as Episode_Start
 ,epiend as Episode_End
 ,epidur as Episode_Duration
 ,epistat as Episode_Status
 ,spell as Spell
 ,spellbgin as Spell_Beginning
 ,activage as Age_at_Activity_Start
 ,isnull(elecdate, 'Unknown') as Decision_to_Admit
 ,admistart as Admission_Start
 ,admiage as Age_on_Admission
 ,admimeth as Admission_Method
 ,admisorc as Admission_Source
 ,startage as Age_Start_Episode
 ,isnull(endage, 'Unknown') as Age_End_Episode
 ,epitype as Episode_Type
 ,isnull(nullif(nullif (elecdur, '9998'), '9999'), 'Unknown') as Elective_Wait_Duration
 ,isnull(nullif(nullif (elecdur_calc, '9998'), '9999'), 'Unknown')  as Elec_Wait_Dur_Calc
from APC

