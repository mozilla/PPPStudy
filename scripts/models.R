# Model specifications for selecting Firefox as a faster browser
fit1 = glm(faster_browser_num ~ primarybrowser, data=df)
fit2 = glm(faster_browser_num ~ source_treat, data=df)
fit3 = glm(faster_browser_num ~ content_treat, data=df)
fit4 = glm(faster_browser_num ~ primarybrowser + source_treat + content_treat, data=df)
fit5 = glm(faster_browser_num ~ content_treat * primarybrowser, data=df)

predlabs = c('Prefers Chrome', 'Prefers other', 'Tech-focused press', 'Performance focus', 'UI focus')
deplabs = c('Browser preference', 'Source treatment', 'Content treatment', 'Full model')
sjt.glm(fit1, fit2, fit3, fit4,
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
sjt.glm(fit5,
        exp.coef=F, 
        string.est = 'Likelihood',
        string.p = 'p-value',
        string.dv = 'Endorsing Firefox as faster',
        group.pred=F,
        show.aic = T, show.chi2 = T, show.ci = F,

        pred.labels=predlabs, 
        depvar.labels=deplabs,
        file='~/Mozilla/PPPStudy/results/table3b.html')