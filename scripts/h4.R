
#Chrome users more likely to say Chrome was faster
#Firefox users more likely to say Firefox was faster
#Those who didn't use either were more likely to say Firefox was faster than Chrome, but equally likely to say neither
plot_df = prop.table(table(df$faster_browser, df$primarybrowser), 1)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var2,
  y=value,
  fill=Var1)) + geom_col(position="dodge") +
  ylim(0, 0.7)

# When primed with the perf treatment, group means greater for Firefox than in any other condition
# No effect of UI treatment
# Control is Chrome is faster
plot_df = prop.table(table(df$faster_browser, df$content_treat), 1)
plot_df = melt(plot_df)
ggplot(data=plot_df, aes(
  x=Var2,
  y=value,
  fill=Var1)) + geom_col(position="dodge")+
  ylim(0, 0.6)
