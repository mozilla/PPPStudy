names(df)[1] = 'id'

#TECH PROFICIENCY QUESTIONS
#[25] "When my friends or family are seeking advice about technology, they always get my opinion."
names(df)[25] = 'opinion'
#[26] "In the past two years, have you installed software (web browsers, productivity tools, etc.) on a friend or family member's computer?"
names(df)[26] = 'installed'
#[27] "In an average day (Monday-Friday), how much time do you spend browsing the web using a desktop or laptop computer?"
names(df)[27] = 'workday'
#[28] "In an average weekend day (Saturday-Sunday), how much time do you spend browsing the web using a desktop or laptop computer?"
names(df)[28] = 'weekend'
#[29] "What browser do you primarily use to browse the web on your laptop or computer at home?"
names(df)[29] = 'primarybrowser'
#[30] "In an average week, how many days do you get news online?"
names(df)[30] = 'news'

#TREATMENT CHECKS
#[31] "Which is opening a facility for testing self-driving cars?"
names(df)[31] = 'cars_article'
#[32] "Which browser was discussed in the article?"
names(df)[32] = 'browser_article'
# [33] "Trustworthy:This article was:"                                                                                                                                            
# [34] "Current:This article was:"                                                                                                                                                
# [35] "Unbiased:This article was:"                                                                                                                                               
# [36] "Honest:This article was:"                                                                                                                                                 
# [37] "Up-to-date:This article was:"                                                                                                                                             
# [38] "Balanced:This article was:"                                                                                                                                               
# [39] "Accurate:This article was:"  

# DEPENDENT VARIABLES

# [41] "The wait for the tab to load was:"                                                                                                                                        
names(df)[41] = 'chrome_tabloadwait'
# [42] "The opening of the new tab was:"                                                                                                                                          
names(df)[42] = 'chrome_tabopensmooth'
# [43] "The opening of the new tab was:_1"                                                                                                                                        
names(df)[43] = 'chrome_tabopeninnovative'
# [45] "The wait for the tab to load was:_1"                                                                                                                                      
names(df)[45] = 'firefox_tabwait'
# [46] "The opening of the new tab was:_2"                                                                                                                                        
names(df)[46] = 'firefox_tabopensmooth'
# [47] "The opening of the new tab was:_3"                                                                                                                                        
names(df)[47] = 'firefox_tabopeninnovative'
# [48] "Which browser opened the tab more quickly?"                                                                                                                               
names(df)[48] = 'quickertab'
# [49] "Which browser was the smoothest when opening the new tab?"                                                                                                                
names(df)[49] = 'smoothtab'
# [50] "Which browser had a more innovative tab opening?"                                                                                                                         
names(df)[50] = 'innotab'
# [52] "The wait for the page to load was:"                                                                                                                                       
names(df)[52] = 'chrome_pageloadwait'
# [53] "The opening of the new page was:"                                                                                                                                         
names(df)[53] = 'chrome_pageopensmooth'
# [54] "The opening of the new page was:_1"                                                                                                                                       
names(df)[54] = 'chrome_pageopeninnovative'
# [56] "The wait for the page to load was:_1"                                                                                                                                     
names(df)[56] = 'firefox_pageloadwait'
# [57] "The opening of the new page was:_2"                                                                                                                                       
names(df)[57] = 'firefox_pageopensmooth'
# [58] "The opening of the new page was:_3"
names(df)[58] = 'firefox_pageopeninnovative'
# [59] "Which browser opened the new page faster?"                                                                                                                                
names(df)[59] = 'quickerpage'
# [60] "Which browser had a more innovative page load?"                                                                                                                           
names(df)[60] = 'innopage'
# [61] "Which browser had a smoother page load?"                                                                                                                                  
names(df)[61] = 'smoothpage'
# [62] "Overall, Mozilla Firefox was:"                                                                                                                                            
names(df)[62] = 'firefox_speed'
# [63] "Overall, Mozilla Firefox was:_1"                                                                                                                                          
names(df)[63] = 'firefox_smooth'
# [64] "Overall, Google Chrome was:"                                                                                                                                              
names(df)[64] = 'chrome_smooth'
# [65] "Overall, Google Chrome was:_1"                                                                                                                                            
names(df)[65] = 'chrome_speed'
# [66] "Overall, which browser was faster?"                                                                                                                                       
names(df)[66] = 'faster_browser'
# [67] "Overall, which browser was smoother?"
names(df)[67] = 'smoother_browser'

#DEMOGRAPHICS
#[18] "Country"                                                                                                                                                                  
#[19] "City"                                                                                                                                                                     
#[20] "State/Region"
#[21] "Postal" 
# [68] "What is your age?"               
names(df)[68] = 'age'
# [69] "What is your gender?"                                                                                                                                                     
names(df)[69] = 'gender'
# [70] "Other - Write In:What is your gender?"                                                                                                                                    
# [71] "What is your ethnicity?"                                                                                                                                                  
names(df)[71] = 'ethnicity'
# [72] "Other - Write In:What is your ethnicity?"                                                                                                                                 
# [73] "What is the highest level of education you have finished?"                                                                                                                
names(df)[73] = 'education'
# [74] "What is your annual household income?" 
names(df)[74] = 'hhincome'