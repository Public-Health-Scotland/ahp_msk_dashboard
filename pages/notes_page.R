####################### Notes Page #######################

output$notes_page_ui <-  renderUI({
  
  div(
    fluidRow(
     # h2("Waiting Times"),
      p("As part of the quality assurance process for this publication, Boards are asked to provide information on any data quality and completeness issues that may affect interpretation of the statistics. "), 
      p("Below are specific data quality issues and data availability by professions for each NHS Board. "), 
      p(strong("NHS Ayrshire & Arran")),
      p("In the December 2022 release, 85 historical waiting list records were removed from the data. These are records that have been removed in local waiting lists and reports but there is no facility in TrakCare to amend the records and exclude them for the national data submission and subsequent publication. All 85 records were incorrectly showing as having long waits. A manual exclusion has been agreed with PHS to remove these records until system developments allow retrospective record adjustments to properly correct the submission data. No further data quality issues were highlighted.")
    #  p(strong("AHP MSK access target")),
    #  p("The Scottish Government set a target that, from 1 April 2016, at least 90% of patients will receive a first outpatient appointment with an Allied Health Professional (AHP) for Musculoskeletal (MSK) conditions within 4 weeks of referral. The target refers to 90% rather than 100% in recognition that for some patients it may not be clinically appropriate for treatment to begin within the target's time. This appointment may be by telephone, video or face-to-face. The inclusion criterion for the target is adults (age 16 and over) where MSK is the primary reason for referral. The target should be met no matter which profession is leading the patient's treatment and the professions included are Physiotherapy, Chiropody/Podiatry, Occupational Therapy and Orthotics."),
    #  p("The waiting time used for this target is an adjusted waiting time, which adjusts for patient unavailability or non-attendance, based on the NHSScotland Waiting Times Guidance. In line with this guidance, adjustments/clock resets for patient unavailability/non-attendance are only made up to first 4 weeks of the patient's wait.")
      
      
    ) #fluidrow
  ) # div
}) # renderUI
