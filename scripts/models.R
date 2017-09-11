# Model specifications for selecting Firefox as a faster browser
fit1_faster = glm(faster_browser_num ~ primarybrowser, data=df)
fit2_faster = glm(faster_browser_num ~ source_treat, data=df)
fit3_faster = glm(faster_browser_num ~ content_treat, data=df)
fit4_faster = glm(faster_browser_num ~ primarybrowser + source_treat + content_treat, data=df)

fit1 = glm(faster_browser_num ~ content_treat * primarybrowser, data=df)

predlabs = c('Prefers Chrome', 'Prefers other', 'Tech-focused press', 'Performance focus', 'UI focus')
deplabs = c('Browser preference', 'Source treatment', 'Content treatment', 'Full model')
sjt.glm(fit1_faster, fit2_faster, fit3_faster, fit4_faster,
        exp.coef=F, 
        string.est = 'Likelihood',
        string.p = 'p-value',
        string.dv = 'Endorsing Firefox as faster',
        group.pred=F,
        show.aic=T, show.chi2=T, show.ci=F,
        pred.labels=predlabs, 
        depvar.labels=deplabs,
        file='~/Mozilla/PPPStudy/results/table3a.html')


deplabs = c('Endorsed Firefox as Faster')
predlabs = c('Performance content', 'UI content', 'Prefers Chrome', 'Prefers alternate browser', 
            'Performance * Prefers Chrome', 'UI * Prefers Chrome', 'Performance * alternate browser', 'UI * alternate browser')
sjt.glm(fit1,
        exp.coef=F, 
        string.est = 'Likelihood',
        string.p = 'p-value',
        string.dv = 'Endorsing Firefox as faster',
        group.pred=F,
        show.aic = T, show.chi2 = T, show.ci = F,

        pred.labels=predlabs, 
        depvar.labels=deplabs,
        file='~/Mozilla/PPPStudy/results/table3b.html')


td <- tidy(fit4_faster, conf.int = TRUE)
ggplot(td, aes(estimate, reorder(term, estimate))) +
geom_point() +
geom_errorbarh(aes(xmin = conf.low, xmax = conf.high), height=0.25) +
geom_vline(xintercept=0)
