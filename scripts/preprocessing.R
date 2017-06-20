# Filters
remove_non_US = function(df) {
  return(df[df$"Country" == 'United States',])
} 

# Filtering
df = df %>% 
  remove_non_US# %>%


#Calculate tech proficiency
f=ddply(df, .(id), function(x){
  return(proficiency=sum(x$weekend,
                         x$workday,
                         x$installed,
                         x$opinion))
})
names(f) = c('id','proficiency')
df = join(df, f, by="id")
rm(f)

#Calculate overall performance ratings
# Sum for Firefox predictions?

#Creating treatment variables
df$PERF = str_detect(df$Branches, 'PPR')
df$UI = str_detect(df$Branches, 'PUIR')
df$SD = str_detect(df$Branches, 'SDC')
df$USAT = str_detect(df$Branches, '-USAT')
df$V = df$USAT = str_detect(df$Branches, '-V')

content_treat = ddply(df, .(id), function(x){
    foo = as.vector(str_split(x$Branches, '-', simplify=T))
    return(foo[1])
})  
names(content_treat) = c('id','content_treat')


source_treat = ddply(df, .(id), function(x){
  foo = as.vector(str_split(x$Branches, '-', simplify=T))
  return(foo[2])
})  
names(source_treat) = c('id','source_treat')

df = join(df, content_treat, by='id')
df = join(df, source_treat, by='id')

#Making factor levels
df$content_treat = fct_relevel(df$content_treat, "SDC")
df$source_treat = fct_relevel(df$source_treat, "USAT")

rm('content_treat')
rm('source_treat')

rm(list=ls()[str_detect(ls(), 'remove')])