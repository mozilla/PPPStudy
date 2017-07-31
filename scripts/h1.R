# Model specifications for selecting Firefox as a faster browser
fit1_faster = glm(faster_browser_num ~ content_treat , data=df)
fit2_faster = glm(faster_browser_num ~ content_treat + primarybrowser_num, data=df)
fit3_faster = glm(faster_browser_num ~ content_treat * source_treat + primarybrowser_num, data=df)
fit4_faster = glm(faster_browser_num ~ content_treat * source_treat * proficiency + primarybrowser_num, data=df)

predlabs = c('Performance treatment', 'UI treatment', 'Primarily prefers Firefox', 'Tech blog treatment', 'Performance * Tech blog', 'UI * Tech blog')
deplabs = c('Model 1', 'Model 2', 'Full model')
sjt.glm(fit1_faster, fit2_faster, fit3_faster, 
        exp.coef=F, 
        string.est = 'Likelihood',
        string.p = 'p-value',
        string.dv = 'Endorsing Firefox as faster',
        group.pred=F,
        show.aic = T, show.chi2 = T, show.ci = F,
        pred.labels=predlabs, depvar.labels=deplabs,
        file='~/Mozilla/PPPStudy/results/table1.html')


td <- tidy(fit4_faster, conf.int = TRUE)
ggplot(td, aes(estimate, reorder(term, estimate))) +
geom_point() +
geom_errorbarh(aes(xmin = conf.low, xmax = conf.high), height=0.25) +
geom_vline(xintercept=0)


sjp.glm(fit4_faster)

#sjt.glm(fit4_faster)

# mtcars %>% group_by(am) %>% do(tidy(lm(mpg ~ wt, .)))
## Source: local data frame [4 x 6]
## Groups: am
## 
##   am        term  estimate std.error statistic      p.value
## 1  0 (Intercept) 31.416055 2.9467213 10.661360 6.007748e-09
## 2  0          wt -3.785908 0.7665567 -4.938848 1.245595e-04
## 3  1 (Intercept) 46.294478 3.1198212 14.838824 1.276849e-08
## 4  1          wt -9.084268 1.2565727 -7.229401 1.687904e-05

## SCRATCH ##

# fit_smoother = glm(smoother_browser_num ~ content_treat * primarybrowser_num + source_treat, data=df)
# sjp.glm(fit_smoother)
# 

 # sjt.glm(fitOR1, fitOR2,
 #         depvar.labels = c("Fertility", "Infant Mortality"),
 #         pred.labels = c("Education", "Examination", "Catholic"),
 #         ci.hyphen = " to ")
 # 
 # 
 # # 
 # 
 # set_theme("forest",
 #           axis.title.size = .85, 
 #           axis.textsize = .85, 
 #           legend.size = .8, 
 #           geom.label.size = 3.5)
 # 
 # tidy(glm(smoothpage_num ~ content_treat, data=df, family=binomial(link="logit")))
 # tidy(glm(faster_browser_num ~ content_treat, data=df, family=binomial(link="logit")))
 # 
 # smoother_browser_m = glm(smoother_browser_num ~ content_treat, data=df, family=binomial(link="logit"))
 # tidy(smoother_browser_m)
 # glance(smoother_browser_m)
 # sjp.glm(smoother_browser_m)
 # #sjp.glm(smoother_browser_m, type="eff")
 # 
 # faster_browser_m = glm(faster_browser_num ~ content_treat, data=df, family=binomial(link="logit"))
 # sjp.glm(faster_browser_m,
 #         #        axisLabels.y=lab,
 #         transformTicks=TRUE,
 #         gridBreaksAt=0.2,
 #         errorBarWidth=0,
 #         errorBarSize=1)
 # 
 # tidy(glm(faster_browser_num ~ content_treat * primarybrowser_num + source_treat, data=df))
 # 
 # phi(df$faster_browser_num, df$smoother_browser_num)
 # 
 # 