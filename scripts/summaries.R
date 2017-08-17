# were the articles in USA today perceived as more credible than in the verge (it'd probably be useful to see this answer in terms of each of the 3 articles as well as overall)?
# if either source was perceived as more credible, did that correspond to higher performance ratings?
# did our "tech savvy" users assign greater credibility to USA Today than The Verge/is this different than the plebs?
# The credibility metric is usually determined (per similar scales in the lit) via a summated mean and I'm sure there is something creative you can do to cutoff the tech savvy respondents from the plebs

# proficiency scaling

df$prof_normalized = (df$proficiency-min(df$proficiency, na.rm=T))/(max(df$proficiency, na.rm=T)-min(df$proficiency, na.rm=T))

df$rating = df$article_accurate + 
  df$article_balanced + 
  df$article_current + 
  df$article_honest +
  df$article_trustworthy +
  df$article_uptodate +
  df$article_unbiased

df$rating_normalized = (df$rating-min(df$rating, na.rm=T))/(max(df$rating, na.rm=T)-min(df$rating, na.rm=T))

plot_df = df %>% select(source_treat, content_treat, rating_normalized, prof_normalized) 

labs = c('SDC' = "Self-Driving Cars", 'PUIR' = 'UI', 'PPR' = 'Performance')

ggplot(data = na.omit(plot_df), aes(
  x = source_treat, y = rating_normalized)) + 
  stat_summary(fun.data = "mean_cl_normal", size = 1, na.rm=T) +
  coord_flip() + facet_wrap(~content_treat, ncol=1,labeller=labeller(content_treat=labs))+
  labs(title = "Article credibility by source and content", x='', y='Normalized mean credibility rating with 95% CI') +
  scale_x_discrete(labels=c("USA Today", "The Verge")) +
  theme_few()
  ggsave(filename='../results/cred_by_treats.png', plot=last_plot())

labs = c('USAT'="USA Today", 'V'='The Verge')
ggplot(data = na.omit(plot_df), aes(
  x = prof_normalized, y = rating_normalized)) +
  geom_point() + geom_jitter(width = 0.05, height = 0.05) +
  stat_smooth(method='lm') +
  facet_wrap(~source_treat, labeller=labeller(source_treat=labs)) +
  labs(title = "Proficiency against article credibility by source", 
       x='Normalized proficiency score', 
       y='Normalized mean credibility rating') +
  theme_few()
  ggsave(filename='../results/prof_cred_bysource.png', plot=last_plot())

  source_corr = ddply(na.omit(plot_df), .(source_treat), summarise,
      corr=(cor.test(rating_normalized, prof_normalized)), name=names(corr))

ggplot(data = na.omit(plot_df), aes(
  x = prof_normalized, y = rating_normalized)) +
  geom_point() + geom_jitter(width = 0.05, height = 0.05) +
  stat_smooth(method='lm') +
  facet_wrap(~content_treat, labeller=labeller(source_treat=labs)) +
  labs(title = "Proficiency against article credibility by content", 
       x='Normalized proficiency score', 
       y='Normalized mean credibility rating') +
  theme_few()
ggsave(filename='../results/prof_cred_bycontent.png', plot=last_plot())

content_corr = ddply(na.omit(plot_df), .(content_treat), summarise,
      corr=(cor.test(rating_normalized, prof_normalized)), name=names(corr))
