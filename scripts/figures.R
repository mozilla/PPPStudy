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
