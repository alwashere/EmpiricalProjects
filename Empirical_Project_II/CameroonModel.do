/* 
Empirical Prj II
Factors that influence smoking prevalence 

*/

/* Define paths for data and output */
global data "Data"
global output "Output"

/*  Log actions */
log using "$output/CameroonModel.log", replace

/* Load the data */
use "$data/cameroonSmokingSurvery.dta", clear
describe

/* Declare the data as survey data */
svyset PSU [pweight = FinalWgt], strata(Stratum)


/*
    Empirical Question: Does exposure to smoking impact the probability
        of youth smoking?

    Factors that influence prevalence of youth smoking in Cameroon:
    + Age
    + Sex
    + Availability of spending money
    + Exposure to smokers
        + Home
        + Indoor events outside home
        + Outdoor events
*/

/* Logit Model */
logit smoker i.ageCategory i.female i.hasMoney i.easyToQuit ///
     i.smokingHome i.smokingIndoors i.smokingOutdoors

/* Probit Model */
probit smoker i.ageCategory i.female i.hasMoney i.easyToQuit ///
     i.smokingHome i.smokingIndoors i.smokingOutdoors

/* Marginal effects */
margins i.ageCategory i.female i.hasMoney i.easyToQuit ///
     i.smokingHome i.smokingIndoors i.smokingOutdoors, atmeans

margins i.ageCategory, atmeans
marginsplot


/* Close Log and clear the dataset */
log close
clear

/*------------------------------------------------------------
|         E n d     o f    f i l e                           |
-------------------------------------------------------------*/