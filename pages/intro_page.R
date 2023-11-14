####################### Intro Page #######################

output$intro_page_ui <-  renderUI({

  div(
	     fluidRow(
             h2("Waiting Times"),
	           p("This dashboard presents statistics on how long patients waited for a first  outpatient appointment with an Allied Health Professional (AHP) to be seen about 
            their Musculoskeletal (MSK) conditions."), 
             p(strong("Musculoskeletal conditions")),
             p("Musculoskeletal conditions include a diversity of complaints and diseases localised in joints, bones, cartilage, ligaments, tendons, tendon sheaths, bursa and muscles. The attendance episodes covered by this publication also include patients seen pre or post orthopaedic surgery and those with peripheral nerve lesions (e.g. carpal tunnel, sciatica) or complications of fracture/dislocation/trauma."),
             p(strong("AHP MSK access target")),
             p("The Scottish Government set a target that, from 1 April 2016, at least 90% of patients will receive a first outpatient appointment with an Allied Health Professional (AHP) for Musculoskeletal (MSK) conditions within 4 weeks of referral. The target refers to 90% rather than 100% in recognition that for some patients it may not be clinically appropriate for treatment to begin within the target's time. This appointment may be by telephone, video or face-to-face. The inclusion criterion for the target is adults (age 16 and over) where MSK is the primary reason for referral. The target should be met no matter which profession is leading the patient's treatment and the professions included are Physiotherapy, Chiropody/Podiatry, Occupational Therapy and Orthotics."),
             p("The waiting time used for this target is an adjusted waiting time, which adjusts for patient unavailability or non-attendance, based on the",
               tags$a("NHSScotland Waiting Times Guidance",href="https://www.sehd.scot.nhs.uk/mels/CEL2012_33.pdf",
                      target = "new")),
             p("In line with this guidance, adjustments/clock resets for patient unavailability/non-attendance are only made up to first 4 weeks of the patient's wait.")
            
     
	      ) #fluidrow
   ) # div
}) # renderUI
