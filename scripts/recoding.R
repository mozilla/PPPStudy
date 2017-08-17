# Relabel variables and performs recoding on necessary variables

# Functions
recode_browser = function(df) {
  tmp = recode(df$primarybrowser, 
         "Chrome"="Chrome",
         "Firefox"="Firefox",
         .default="Other")
  df$primarybrowser = tmp
  
  tmp = recode(df$primarybrowser, 
               "Firefox"=1,
               .default=0)
  df$primarybrowser_num = tmp
  
  return(df)
}

recode_opinion = function(df) {
  tmp = recode(df$opinion,
         'Strongly agree'=1,
         'Strongly disagree'=-1,
         'Agree'=1,
         'Disgree'=-1,
         'Neither disagree nor agree'=0,
         .default=0)
  df$opinion = tmp
  return(df)
}

recode_install = function(df){
  tmp = recode(df$installed,
               'Yes'=1,
               'No'=-1,
               'Not sure'=0,
               .default=0)
  df$installed = tmp
  return(df)
}               
               
recode_workday = function(df){
  tmp = recode(df$workday,
               "Between 5-8 hours a day"=0.66,
               "I don't usually browse the web every day"=0,
               "Less than 4 hours a day"=0.33,
               "More than 8 hours a day"=1,
               "Not sure"=0,
               .default=0) 
  df$workday = tmp
  return(df)
}

recode_weekend = function(df){
  tmp = recode(df$weekend,
               "Between 5-8 hours a day"=0.66,
               "I don't usually browse the web every day"=0,
               "Less than 4 hours a day"=0.33,
               "More than 8 hours a day"=1,
               "Not sure"=0,
               .default=0)
  df$weekend = tmp
  return(df)
}

recode_quickertab = function(df){
  tmp = recode(df$quickertab,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$quickertab_num = tmp
  return(df)
}

recode_smoothtab = function(df){
  tmp = recode(df$smoothtab,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$smoothtab_num = tmp
  return(df)
}
recode_innotab = function(df){
  tmp = recode(df$innotab,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$innotab_num = tmp
  return(df)
}
recode_quickerpage = function(df){
  tmp = recode(df$quickerpage,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$quickerpage_num = tmp
  return(df)
}
recode_smoothpage = function(df){
  tmp = recode(df$smoothpage,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$smoothpage_num = tmp
  return(df)
}
recode_innopage = function(df){
  tmp = recode(df$innopage,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$innopage_num = tmp
  return(df)
}

recode_faster_browser = function(df){
  tmp = recode(df$faster_browser,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$faster_browser_num = tmp
  return(df)
}
recode_smoother_browser = function(df){
  tmp = recode(df$smoother_browser,
               'Mozilla Firefox' = 1,
               'Google Chrome' = 0,
               'Neither' = 0,
               .default=0)
  df$smoother_browser_num = tmp
  return(df)
}

recode_firefox_speed = function(df){
  tmp = recode(df$firefox_speed,
               'Extremely fast' = 3,
               'Fast' = 2,
               'Somewhat fast' = 1,
               'Neither slow nor fast' = 0,
               'Somewhat slow' = 1,
               'Slow' = 2,
               'Extremely slow' = 3,
               .default=0)
  df$firefox_speed = tmp
  return(df)
}
recode_firefox_smooth = function(df){
  tmp = recode(df$firefox_smooth,
               'Extremely smooth' = 3,
               'Smooth' = 2,
               'Somewhat smooth' = 1,
               'Neither smooth nor uneven' = 0,
               'Somewhat uneven' = 1,
               'Uneven' = 2,
               'Extremely uneven' = 3,
               .default=0)
  df$firefox_smooth = tmp
  return(df)
}

recode_chrome_speed = function(df){
  tmp = recode(df$chrome_speed,
               'Extremely fast' = 3,
               'Fast' = 2,
               'Somewhat fast' = 1,
               'Neither slow nor fast' = 0,
               'Somewhat slow' = 1,
               'Slow' = 2,
               'Extremely slow' = 3,
               .default=0)
  df$chrome_speed = tmp
  return(df)
}

recode_chrome_smooth = function(df){
  tmp = recode(df$chrome_smooth,
               'Extremely smooth' = 3,
               'Smooth' = 2,
               'Somewhat smooth' = 1,
               'Neither smooth nor uneven' = 0,
               'Somewhat uneven' = 1,
               'Uneven' = 2,
               'Extremely uneven' = 3,
               .default=0)
  df$chrome_smooth = tmp
  return(df)
}

recode_trustworthy = function(df) {
  tmp = recode(df$article_trustworthy,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_trustworthy = tmp
  return(df)
}

recode_current = function(df) {
  tmp = recode(df$article_current,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_current = tmp
  return(df)
}

recode_unbiased = function(df) {
  tmp = recode(df$article_unbiased,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_unbiased = tmp
  return(df)
}

recode_honest = function(df) {
  tmp = recode(df$article_honest,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_honest = tmp
  return(df)
}

recode_uptodate = function(df) {
  tmp = recode(df$article_uptodate,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_uptodate = tmp
  return(df)
}

recode_balanced = function(df) {
  tmp = recode(df$article_balanced,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_balanced = tmp
  return(df)
}

recode_accurate = function(df) {
  tmp = recode(df$article_accurate,
               'Strongly agree'=3,
               'Strong disagree'=-3,
               'Agree'=2,
               'Disagree'=-2,
               'Moderately agree'=1,
               'Moderately disagree'=-1,
               'Neither disagree or agree'=0,
               .default=0)
  df$article_accurate = tmp
  return(df)
}

# Main
df = df %>% 
  recode_browser %>% 
  recode_opinion %>%
  recode_install %>% 
  recode_workday %>%
  recode_weekend %>%
  recode_quickertab %>%
  recode_smoothtab %>%
  recode_innotab %>%
  recode_quickerpage %>%
  recode_smoothpage %>%
  recode_innopage %>%
  recode_faster_browser %>%
  recode_smoother_browser %>%
  recode_firefox_speed %>%
  recode_firefox_smooth %>%
  recode_chrome_speed %>%
  recode_chrome_smooth %>%
  recode_trustworthy %>%
  recode_current %>%
  recode_unbiased %>%
  recode_honest %>%
  recode_uptodate %>%
  recode_balanced %>%
  recode_accurate

rm(list=ls()[str_detect(ls(), 'recode')])