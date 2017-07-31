
#Chrome users more likely to say Chrome was faster
#Firefox users more likely to say Firefox was faster
#Those who didn't use either were more likely to say Firefox was faster than Chrome, but equally likely to say neither
plot_df = prop.table(table(df$faster_browser, df$primarybrowser), 1)
plot_df = melt(plot_df)
cols <- c("Mozilla Firefox" = "#E55B08", "Google Chrome" = "#00933B", "Neither" = "#0266C8")
ggplot(data=plot_df, aes(
  x=Var2,  y=value,  fill=Var1)) + geom_col(position="dodge") +
  ylim(0, 0.7) +
  scale_y_continuous(labels=percent_format()) +
  scale_fill_manual(values=cols, name='Preferred browser') +
  ylab('Proportion of respondents') +
  xlab('Endorsed browser for faster perceived performance') +
  theme_bw() +
  ggtitle('Preferred browser and perception of faster performing browser') 
ggsave(filename='~/Mozilla/PPPStudy/results/fig1.png', plot=last_plot())

# When primed with the perf treatment, group means greater for Firefox than in any other condition
# No effect of UI treatment
# Control is Chrome is faster
plot_df = prop.table(table(df$faster_browser, df$content_treat), 1)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var2,  y=value,  fill=Var1)) + geom_col(position="dodge")+
  ylim(0, 0.6) +
  scale_y_continuous(labels=percent_format()) +
  scale_fill_manual(values=cols, name="Preferred browser") +
  scale_x_discrete("Article content treatment condition", labels=c("SDC"="Self-driving cars", "PPR" = "Performance improvements", "PUIR" = "Improved UI")) +
  ylab('Proportion of respondents') +
  ggtitle('Result of article content on group judgments of browser speed') +
  theme_bw()
ggsave(filename='~/Mozilla/PPPStudy/results/fig2.png', plot=last_plot())

plot_df = prop.table(table(df$smoother_browser, df$content_treat), 1)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var2,  y=value,  fill=Var1)) + geom_col(position="dodge")+
  ylim(0, 0.6) +
  scale_y_continuous(labels=percent_format()) +
  scale_fill_manual(values=cols, name="Preferred browser") +
  scale_x_discrete("Article content treatment condition", labels=c("SDC"="Self-driving cars", "PPR" = "Performance improvements", "PUIR" = "Improved UI")) +
  ylab('Proportion of respondents') +
  ggtitle('Result of article content on group judgments of browser smoothness') +
  theme_bw()
ggsave(filename='~/Mozilla/PPPStudy/results/fig3.png', plot=last_plot())


