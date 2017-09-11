# recode_chrome_faster = function(df){
#   tmp = recode(df$faster_browser,
#                'Mozilla Firefox' = 0,
#                'Google Chrome' = 1,
#                'Neither' = 0,
#                .default=0)
#   df$chrome_faster = tmp
#   return(df)
# }
# 
# recode_neither_faster = function(df){
#   tmp = recode(df$faster_browser,
#                'Mozilla Firefox' = 0,
#                'Google Chrome' = 0,
#                'Neither' = 1,
#                .default=0)
#   df$faster_browser_num = tmp
#   return(df)
# }
# 
# 
# #tidy(prop.test(table(chrome$content_treat, chrome$faster_browser_num),1))
# #tidy(with(SDC, t.test(faster_browser[primarybrowser == 'Chrome'], faster_browser[primarybrowser != 'Chrome'])))
# 
SDC = df[df$content_treat == 'SDC',]
SDC = recode_chrome_faster(SDC)
SDC = recode_neither_faster(SDC)
# 
# #prop.test(sum(SDC$faster_browser_num, na.rm=T), nrow(SDC))
# #prop.test(sum(SDC$chrome_faster, na.rm=T), nrow(SDC))
# #prop.test(sum(SDC$neither_faster, na.rm=T), nrow(SDC))
# 
# prop.test(prop.table(table(SDC$faster_browser)),2)
# sdc_table = table(SDC$primarybrowser, SDC$faster_browser)
# prop.table(sdc_table, 2)
# prop.table(sdc_table[1:2, 1:2],1)
# prop.table(sdc_table[1:2, -1],1)
# prop.table(sdc_table[1:2, -2],1)
# prop.table(sdc_table[-1, -1],1)
# prop.table(sdc_table[-2, -1],1)
# prop.table(sdc_table[-1, -2],1)
# prop.table(sdc_table[-2, -2],1)
# 
# #X statistics
# tidy(prop.test(sdc_table[1:2, 1:2], 1)) # fx and chrome users think their preferred browsers are faster
# tidy(prop.test(sdc_table[1:2, -1], 1)) # fx users will say fx is faster, others are indifferent between the two
# tidy(prop.test(sdc_table[1:2, -2], 1)) # fx users will say fx is faster, others are indifferent between the two
# tidy(prop.test(sdc_table[-1, -1], 1)) # chrome and other users are similar in their judgment in the control
# tidy(prop.test(sdc_table[-2, -1], 1)) # chrome users will say chrome is faster, others will say neither
# tidy(prop.test(sdc_table[-1, -2], 1)) # fx users will say fx is faster, others will say neither
# tidy(prop.test(sdc_table[-2, -2], 1)) # chrome and other users think their preferred browsers 
# 
PPR = df[df$content_treat == 'PPR',]
# ppr_table = table(PPR$primarybrowser, PPR$faster_browser)
# 
# sjt.frq(PPR$faster_browser)
# prop.table(ppr_table, 2)
# prop.table(ppr_table[1:2, 1:2],1)
# prop.table(ppr_table[1:2, -1],1)
# prop.table(ppr_table[1:2, -2],1)
# prop.table(ppr_table[-1, -1],1)
# prop.table(ppr_table[-2, -1],1)
# prop.table(ppr_table[-1, -2],1)
# prop.table(ppr_table[-2, -2],1)
# 
# tidy(prop.test(ppr_table[1:2, 1:2], 1))
# tidy(prop.test(ppr_table[1:2, -1], 1))
# tidy(prop.test(ppr_table[1:2, -2], 1))
# tidy(prop.test(ppr_table[-1, -1], 1))
# tidy(prop.test(ppr_table[-2, -1], 1))
# tidy(prop.test(ppr_table[-1, -2], 1))
# tidy(prop.test(ppr_table[-2, -2], 1))
# 
PUIR = df[df$content_treat == 'PUIR',]
# puir_table = table(PUIR$primarybrowser, PUIR$faster_browser)
# puir_result = tidy(prop.test(table(PUIR$faster_browser, PUIR$primarybrowser), 2))
# 
# prop.table(puir_table, 2)
# prop.table(puir_table[1:2, 1:2],1)
# prop.table(puir_table[1:2, -1],1)
# prop.table(puir_table[1:2, -2],1)
# prop.table(puir_table[-1, -1],1)
# prop.table(puir_table[-2, -1],1)
# prop.table(puir_table[-1, -2],1)
# prop.table(puir_table[-2, -2],1)
# 
# tidy(prop.test(puir_table[1:2, 1:2], 1))
# tidy(prop.test(puir_table[1:2, -1], 1))
# tidy(prop.test(puir_table[1:2, -2], 1))
# tidy(prop.test(puir_table[-1, -1], 1))
# tidy(prop.test(puir_table[-2, -1], 1))
# tidy(prop.test(puir_table[-1, -2], 1))
# tidy(prop.test(puir_table[-2, -2], 1))
# 
# firefox = df[df$primarybrowser == 'Firefox',]
# firefox_content = table(firefox$content_treat, firefox$faster_browser)
# firefox_ppr_tidy = tidy(prop.test(firefox_content[1:2,1:2], 1))
# firefox_puir_tidy = tidy(prop.test(firefox_content[-2,1:2]))
# 
# chrome = df[df$primarybrowser == 'Chrome',]
# chrome_content = table(chrome$content_treat, chrome$faster_browser)
# chrome_ppr_tidy = tidy(prop.test(chrome_content[1:2,1:2], 1))
# chrome_puir_tidy = tidy(prop.test(chrome_content[-2,1:2]))
# 
# other = df[df$primarybrowser == 'Other',]
# other_content = table(other$content_treat, other$faster_browser)
# other_ppr_tidy = tidy(prop.test(other_content[1:2,1:2]))
# other_puir_tidy = tidy(prop.test(other_content[-2,1:2]))
# 
# rbind(firefox_ppr_tidy, firefox_puir_tidy, chrome_ppr_tidy, chrome_puir_tidy, other_ppr_tidy, other_puir_tidy)


sjt.frq(as.data.frame(cbind(df$primarybrowser, df$content_treat, df$source_treat)),
        value.labels=list(c('Firefox', 'Chrome', 'Other'), c('Control', 'Performance' ,'UI'), c('USA Today', 'The Verge')),
        title=c('Overall browser preferences' ,'Content treatment assignment', 'Source treatment assignment'),
        show.summary=F,
        file='~/Mozilla/PPPStudy/results/table1a.html')

sjt.frq(as.data.frame(cbind(SDC$faster_browser)),
        value.labels=list(c('Chrome', 'Firefox', 'Neither')),
        title=c('Control content: Browser endorsement'),
        show.summary=F,
        file='~/Mozilla/PPPStudy/results/table1b.html')

sjt.xtab(SDC$primarybrowser, SDC$faster_browser, var.labels=c('Preferred browser', 'Endorsed as faster'),
         show.obs = F,
         show.row.prc=T,
         show.summary=T,
         statistics='phi',
         prc.sign="%",
         file='~/Mozilla/PPPStudy/results/table2a.html')

sjt.xtab(PPR$primarybrowser, PPR$faster_browser, var.labels=c('Preferred browser', 'Endorsed as faster'),
         show.obs = F,
         show.row.prc=T,
         show.summary=T,
         statistics='phi',
         prc.sign="%",
         file='~/Mozilla/PPPStudy/results/table2b.html')

sjt.xtab(PUIR$primarybrowser, PUIR$faster_browser, var.labels=c('Preferred browser', 'Endorsed as faster'),
         show.obs = F,
         show.row.prc=T,
         show.summary=T,
         statistics='phi',
         prc.sign="%",
         file='~/Mozilla/PPPStudy/results/table2c.html')