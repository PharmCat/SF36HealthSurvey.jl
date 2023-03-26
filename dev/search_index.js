var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = SF36HealthSurvey","category":"page"},{"location":"#SF36HealthSurvey","page":"Home","title":"SF36HealthSurvey","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for SF36HealthSurvey.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The Short Form (36) Health Survey is a 36-item, patient-reported survey of patient health. The SF-36 is a measure of health status and an abbreviated variant of it, the SF-6D, is commonly used in health economics as a variable in the quality-adjusted life year calculation to determine the cost-effectiveness of a health treatment. The original SF-36 stemmed from the Medical Outcome Study, MOS, which was conducted by the RAND Corporation. SF36 Version 1 - is a free instrument.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Terms and Conditions for Using the 36-Item Short Form Survey (SF-36):","category":"page"},{"location":"","page":"Home","title":"Home","text":"RAND hereby grants permission to use RAND 36-Item Short Form Health Survey in accordance with the following conditions, which shall be assumed by all to have been agreed to as a consequence of accepting and using this document:","category":"page"},{"location":"","page":"Home","title":"Home","text":"Changes to the Health Survey may be made without the written permission of RAND. However, \nall such changes shall be clearly identified as having been made by the recipient.\nThe user of this Health Survey accepts full responsibility, and agrees to indemnify and hold RAND harmless, \nfor the accuracy of any translations of the Health Survey into another language and for any errors, \nomissions, misinterpretations, or consequences thereof.\nThe user of this Health Survey accepts full responsibility, and agrees to indemnify and hold RAND harmless,\nfor any consequences resulting from the use of the Health Survey.\nThe user of the 36-Item Health Survey will provide a credit line when printing and distributing this document acknowledging \nthat it was developed at RAND as part of the Medical Outcomes Study.\nNo further written permission is needed for use of this Health Survey.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [SF36HealthSurvey]","category":"page"},{"location":"#SF36HealthSurvey.sf12-Tuple{Any}","page":"Home","title":"SF36HealthSurvey.sf12","text":"sf12(v; version = :v1)\n\nCalculate SF12 results for vector of answers v:\n\n1 - GH1 \n\n2 - PF02\n\n3 - PF04\n\n4 - RP2\n\n5 - RP3\n\n6 - RE2\n\n7 - RE3\n\n8 - BP2\n\n9 - MH3\n\n10 - VT2\n\n11 - MH4\n\n12 - SF2\n\nReference:\n\nWare Jr, John E., Mark Kosinski, and Susan D. Keller. \"A 12-Item Short-Form Health Survey: construction of scales and preliminary tests of reliability and validity.\" Medical care 34.3 (1996): 220-233.Validation Literature:\n\nGandek, Barbara, et al. \"Cross-validation of item selection and scoring for the SF-12 Health Survey in nine countries: results from the IQOLA Project.\" Journal of clinical epidemiology51.11 (1998): 1171-1178. Jenkinson, Crispin, et al. \"A shorter form health survey: can the SF-12 replicate results from the SF-36 in longitudinal studies?.\" Journal of Public Health 19.2 (1997): 179-186.Additional Literature:\n\nWare, John E., Susan D. Keller, and Mark Kosinski. SF-12: How to score the SF-12 physical and mental health summary scales. Health Institute, New England Medical Center, 1995.\n\nSee also: https://orthotoolkit.com/sf-12/\n\nhttps://www.researchgate.net/profile/John-Ware-6/publication/291994160HowtoscoreSF-12_items/links/58dfc42f92851c369548e04e/How-to-score-SF-12-items.pdf\n\n\n\n\n\n","category":"method"},{"location":"#SF36HealthSurvey.sf36-Tuple{Any}","page":"Home","title":"SF36HealthSurvey.sf36","text":"sf36(v; version = :v1)\n\nCalculate SF36 results for vector of answers v.\n\nversion keyword:\n\n:v1 - General US population (Ware, John & MA, Kosinski & Keller, S.D.. (1993). SF-36 Physical and Mental Health Summary Scales: a User's Manual. 8. 23-28.)\n:v2 - Correlated scores (Grassi, M. and Nucera, A. (2010), Dimensionality and Summary Measures of the SF-36 v1.6: Comparison of Scale- and Item-Based Approach Across ECRHS II Adults Population. Value in Health, 13: 469-478.)\n\nVector v:\n\n1,33:36 - General Health(GH) - 1, 11a:11d\n\n3:12 - Physical functioning (PF) - 3a:3j\n\n13:16 - Role-Physical Functioning (RP) - 4a:4d\n\n17:19 - RoleEmotional (RE) - 5a:5c\n\n20,32 - Social Functioning (SF) - 6,10\n\n21,22 - Bodily pain (BP) - 7,8\n\n24:26,28,30 - Mental Health (MH) - 9b:9d, 9f, 9h\n\n23,27,29,31 - Vitality (VT) - 9a, 9e, 9g, 9i \n\n\n\n\n\n","category":"method"}]
}