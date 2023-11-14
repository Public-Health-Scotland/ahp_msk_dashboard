####################### Notes Page #######################

output$notes_page_ui <-  renderUI({
  
  div(
    fluidRow(
     # h2("Waiting Times"),
      p("As part of the quality assurance process for this publication, Boards are asked to provide information on any data quality and completeness issues that may affect interpretation of the statistics. "), 
      p("Below are specific data quality issues and data availability by professions for each NHS Board. "), 
      h2("NHS Ayrshire & Arran"),
      p("In the December 2022 release, 85 historical waiting list records were removed from the data. These are records that have been removed in local waiting lists and reports but there is no facility in TrakCare to amend the records and exclude them for the national data submission and subsequent publication. All 85 records were incorrectly showing as having long waits. A manual exclusion has been agreed with PHS to remove these records until system developments allow retrospective record adjustments to properly correct the submission data."), 
      p("No further data quality issues were highlighted."),
      h2("NHS Borders"),
      p("NHS Borders are investigating data quality issues affecting their submissions to the national data warehouse. The full impact of this is not yet known, therefore most data have been excluded until investigations are concluded and the data is corrected. Data for Physiotherapy and Chiropody/Podiatry from April to June 2023 are included in this release."), 
      p("NHS Borders do not provide a MSK Occupational Therapy Service. "),
      h2("NHS Dumfries & Galloway"),
      p("NHS Dumfries & Galloway have advised that following the rollout of ACRT (Advanced Clinical Referral Triage) across AHP-MSK services, there may be a data quality issue with how this is recorded. This is being investigated by the health intelligence team and amended data will be included in future publications if necessary."), 
      p("No further data quality issues were highlighted. "),
      h2("NHS Fife"),
      p("NHS Fife identified two issues with records in their Tiara system which affected submissions to the national warehouse. The first issue resulted in some patients being counted as still waiting in the warehouse when in fact they had been seen. The second issue was that some new referrals were incorrectly recorded as a review appointment. Both these issues have been resolved for data from January 2019."),
      p("No further data quality issues were highlighted. "),
      h2("NHS Forth Valley"),
      p("NHS Forth Valley have advised that during the COVID-19 pandemic, patients in the prison setting were seen virtually and this data was included in MSK Physiotherapy data. From January 2023, these patients are now being seen in person but the data cannot be recorded on TrakCare and submitted to the national waiting times warehouse for one of the prisons."), 
      p("PHS will work with NHS Forth Valley to improve reporting on this data in future publications."), 
      p("A small number of Podiatry self-referrals were recorded in recent quarters because of an administrative error. For the quarter July to September 2015, it should be noted that it was a developmental phase of data collection for the Podiatry and Orthotics services."), 
      p("Occupational Therapy data are not included within this release."), 
      p("No further data quality issues were highlighted."),
      h2("NHS Grampian"),
      p("The NHS Grampian Physiotherapy service includes spinal services within these data that may not be included by other NHS Boards. Occupational Therapy data are not included within this release."), 
      p("No data quality issues were highlighted. "),
      h2("NHS Greater Glasgow & Clyde"),
      p("Several data quality issues have been identified with data for NHS Greater Glasgow & Clyde:"), 
      p("• Patients waiting data for physiotherapy and orthotics have been excluded for all time points while NHS Greater Glasgow & Clyde investigate why some records have not been closed off in their warehouse submissions."), 
      p("• All data for Chiropody/Podiatry have been excluded for all time points as there are differences between locally held and national warehouse data. "),
      p("• There is no Occupational Therapy data from January 2021 onwards as there is an issue locally where patients have not been identified as waiting for an AHP MSK appointment. "),
      h2("NHS Highland"),
      p("Occupational Therapy data are not included within this release. No further data quality issues were highlighted."),
      h2("NHS Lanarkshire"),
      p("NHS Lanarkshire confirm that they are not aware of any data quality issues."),
      h2("NHS Lothian"),
      p("NHS Lothian are investigating a change in TrakCare that may be affecting the low
        numbers in the Orthotics data since October 2022 and a data quality issue with older
        data. All Orthotics data has been removed until the investigations have been completed
        and the data are corrected."),
      p("Occupational therapy data are not included in this release as NHS Lothian are unable
        to differentiate MSK patient records from non-MSK Occupational Therapy records."),
      p("No further data quality issues were highlighted."),
      h2("NHS Orkney"),
      p("The MSK Occupational Therapy service is provided by both NHS Orkney and Orkney 
        Health and Social Care Partnership. Occupational Therapy data are unavailable for this 
        release."),
      p("NHS Orkney confirm that they are not aware of any data quality issues."),
      h2("NHS Shetland"),
      p("NHS Shetland have advised that the delivery model for Orthotics has changed. This 
        means that patients may now move between MSK Podiatry and Orthotics to best 
        manage waiting times and capacity where appropriate for the individual. There may be 
        some patients where unavailability has not been recorded and is not reflected in the 
        waiting times. Work is continuing to see how this can be recorded appropriately in 
        future publications."), 
      p("NHS Shetland do not provide a MSK Occupational Therapy Service."),
      p("No further data quality issues were highlighted"),
      h2("NHS Tayside"),
      p("Instead of reporting from the national warehouse following technical issues with the 
        transition to a new patient administration system, this release includes previously 
        published local figures for quarters ending June 2017, June 2018, September 2018, 
        December 2018, March 2019, June 2019 and September 2019. Previously published 
        local data was unavailable from NHS Tayside for quarters ending September 2017, 
        December 2017 and March 2018, therefore NHS Tayside data is excluded from these 
        quarters."),
      p("NHS Tayside have advised that there may be data quality issues with some data for 
        patients who have been waiting longer. This is being investigated and if necessary, 
        data will be amended in future publications."), 
      p("No further data quality issues were highlighted"),
      h2("NHS Western Isles"),
      p("NHS Western Isles were unable to provide Occupational Therapy data for this release 
        as their patient management system Morse does not currently support reporting of 
        waiting times."),
      p("No further data quality issues were highlighted.")
      
      
    ) #fluidrow
  ) # div
}) # renderUI
