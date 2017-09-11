plot_df = prop.table(table(df$faster_browser, df$content_treat), 1)
plot_df = melt(plot_df)

cols <- c("Mozilla Firefox" = "#FF9500", "Google Chrome" = "#3C3C3C", "Neither" = "#3C3C3C")

ggplot(data=plot_df[plot_df$Var2 %in% "SDC",], aes(
  x=Var1, y=value, fill=Var1)) + geom_col() + 
  scale_y_continuous(labels=percent_format(), limits=c(0,0.5)) +
  scale_fill_manual(values=cols, guide=F) +
  theme_fivethirtyeight()
ggsave(filename='~/Mozilla/PPPStudy/results/fig1_control.png', plot=last_plot())

ggplot(data=plot_df[plot_df$Var2 %in% "PPR",], aes(
  x=Var1, y=value, fill=Var1)) + geom_col() + 
  scale_y_continuous(labels=percent_format(), limits=c(0,0.5)) +
  scale_fill_manual(values=cols, guide=F) +
  theme_fivethirtyeight()
ggsave(filename='~/Mozilla/PPPStudy/results/fig1_perf.png', plot=last_plot())

ggplot(data=plot_df[plot_df$Var2 %in% "PUIR",], aes(
  x=Var1, y=value, fill=Var1)) + geom_col() + 
  scale_y_continuous(labels=percent_format(), limits=c(0,0.5)) +
  scale_fill_manual(values=cols, guide=F) +
  theme_fivethirtyeight()
ggsave(filename='~/Mozilla/PPPStudy/results/fig1_ui.png', plot=last_plot())


# Split by condition and preferred browser

control_df = df[df$content_treat %in% "SDC",]
perf_df = df[df$content_treat %in% "PPR",]
ui_df = df[df$content_treat %in% "PUIR",]

labs = c('Chrome' = "Prefers Chrome", 'Firefox' = 'Prefers Firefox', 'Other' = 'Prefers other')

plot_df = prop.table(table(control_df$faster_browser, control_df$primarybrowser), 2)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var1,  y=value,  fill=Var1)) + geom_col() +
  facet_wrap(~Var2, ncol=1, labeller=labeller(Var2=labs)) +
  scale_y_continuous(labels=percent_format(), limits=c(0,0.6)) +
  scale_fill_manual(values=cols, guide=F) +
  coord_flip() +
  theme_fivethirtyeight()
ggsave(filename='~/Mozilla/PPPStudy/results/fig2_control.png', plot=last_plot())

plot_df = prop.table(table(perf_df$faster_browser, perf_df$primarybrowser), 2)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var1,  y=value,  fill=Var1)) + geom_col() +
  facet_wrap(~Var2, ncol=1, labeller=labeller(Var2=labs)) +
  scale_y_continuous(labels=percent_format(), limits=c(0,0.6)) +
  scale_fill_manual(values=cols, guide=F) +
  coord_flip() +
  theme_fivethirtyeight()
ggsave(filename='~/Mozilla/PPPStudy/results/fig2_perf.png', plot=last_plot())


plot_df = prop.table(table(ui_df$faster_browser, ui_df$primarybrowser), 2)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var1,  y=value,  fill=Var1)) + geom_col() +
  facet_wrap(~Var2, ncol=1, labeller=labeller(Var2=labs)) +
  scale_y_continuous(labels=percent_format(), limits=c(0,0.6)) +
  scale_fill_manual(values=cols, guide=F) +
  coord_flip() +
  theme_fivethirtyeight()
ggsave(filename='~/Mozilla/PPPStudy/results/fig2_ui.png', plot=last_plot())



# # Shows that Chrome users are vastly more likely to be considered the information provider for friends and family
# foo=table(df$primarybrowser, 
#           df$opinion)
# bar=prop.table(foo, margin=1)
# m = melt(bar)
# qplot(Var2, value, geom="point",color=Var1, data=m)
# 
# ## XXX make these better
# # Shows no difference between likelihood to install software for others between Chrome and Fx users
# plot_df=table(df$primarybrowser, 
#               df$installed)
# plot_df=melt(prop.table(plot_df, margin=1))
# cols <- c("Firefox" = "#E55B08", "Chrome" = "#00933B", "Other" = "#0266C8")
# ggplot(data=plot_df, aes(x=as.factor(Var2), y=value, fill=Var1)) + geom_col(position='dodge') +
#   scale_x_discrete("Have or have not installed software for others", labels=c("-1"="Have not", "0" = "Not sure", "1" = "Have")) +
#   scale_fill_manual(values=cols) +
#   scale_y_continuous(labels=percent_format()) +
#   ylab("Proportion of respondents") +
#   theme_bw()
# 
# # Chrome users are heavier workday users
# plot_df=table(df$primarybrowser, 
#               df$workday)
# plot_df=melt(prop.table(plot_df, margin=1))
# ggplot(data=plot_df, aes(x=Var2, y=value, fill=as.factor(Var1))) + geom_col(position='dodge') +
#   scale_fill_manual(values=cols)
# 
# # Chrome users are heavier weekend users
# plot_df=table(df$primarybrowser, 
#               df$weekend)
# plot_df=melt(prop.table(plot_df, margin=1))
# ggplot(data=plot_df, aes(x=Var2, y=value, fill=as.factor(Var1))) + geom_col(position='dodge')
# 
# #
# ddply(df, .(primarybrowser), summarise,
#       mean = mean(proficiency, na.rm=T),
#       sd = sd(proficiency, na.rm=T)
# )
# 
# #Overall plot of proficiency scores
# qplot(df$proficiency, binwidth=.5)
# 
# 
# 
# qplot(df$faster_browser, df$content_treat, geom="bar")
# 
# # Very weak relationship between primary browser choice and tech proficiency, hardly even a relationship
# ggplot(data=df, aes(
#   x=primarybrowser,
#   y=proficiency)) + geom_boxplot()
# 
