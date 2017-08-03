# Shows that Chrome users are vastly more likely to be considered the information provider for friends and family
foo=table(df$primarybrowser, 
          df$opinion)
bar=prop.table(foo, margin=1)
m = melt(bar)
qplot(Var2, value, geom="point",color=Var1, data=m)

## XXX make these better
# Shows no difference between likelihood to install software for others between Chrome and Fx users
plot_df=table(df$primarybrowser, 
          df$installed)
plot_df=melt(prop.table(plot_df, margin=1))
cols <- c("Firefox" = "#E55B08", "Chrome" = "#00933B", "Other" = "#0266C8")
ggplot(data=plot_df, aes(x=as.factor(Var2), y=value, fill=Var1)) + geom_col(position='dodge') +
  scale_x_discrete("Have or have not installed software for others", labels=c("-1"="Have not", "0" = "Not sure", "1" = "Have")) +
  scale_fill_manual(values=cols) +
  scale_y_continuous(labels=percent_format()) +
  ylab("Proportion of respondents") +
  theme_bw()

# Chrome users are heavier workday users
plot_df=table(df$primarybrowser, 
              df$workday)
plot_df=melt(prop.table(plot_df, margin=1))
ggplot(data=plot_df, aes(x=Var2, y=value, fill=as.factor(Var1))) + geom_col(position='dodge') +
  scale_fill_manual(values=cols)

# Chrome users are heavier weekend users
plot_df=table(df$primarybrowser, 
              df$weekend)
plot_df=melt(prop.table(plot_df, margin=1))
ggplot(data=plot_df, aes(x=Var2, y=value, fill=as.factor(Var1))) + geom_col(position='dodge')

#
ddply(df, .(primarybrowser), summarise,
      mean = mean(proficiency, na.rm=T),
      sd = sd(proficiency, na.rm=T)
      )

#Overall plot of proficiency scores
qplot(df$proficiency, binwidth=.5)



qplot(df$faster_browser, df$content_treat, geom="bar")

# Very weak relationship between primary browser choice and tech proficiency, hardly even a relationship
ggplot(data=df, aes(
  x=primarybrowser,
  y=proficiency)) + geom_boxplot()

