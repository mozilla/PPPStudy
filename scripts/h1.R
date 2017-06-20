set_theme("forest",
          axis.title.size = .85, 
          axis.textsize = .85, 
          legend.size = .8, 
          geom.label.size = 3.5)

tidy(glm(smoothpage_num ~ content_treat, data=df, family=binomial(link="logit")))
tidy(glm(faster_browser_num ~ content_treat, data=df, family=binomial(link="logit")))


smoother_browser_m = glm(smoother_browser_num ~ content_treat, data=df, family=binomial(link="logit"))
tidy(smoother_browser_m)
glance(smoother_browser_m)
sjp.glm(smoother_browser_m)
sjp.glm(smoother_browser_m, type="eff")



faster_browser_m = glm(faster_browser_num ~ content_treat, data=df, family=binomial(link="logit"))
sjp.glm(faster_browser_m,
#        axisLabels.y=lab,
        transformTicks=TRUE,
        gridBreaksAt=0.2,
        errorBarWidth=0,
        errorBarSize=1)


sjp.glm(glm(faster_browser_num ~ content_treat + primarybrowser_num + source_treat, data=df))
sjp.glm(faster_browser_m, type="eff")
