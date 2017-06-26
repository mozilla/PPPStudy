# move "truth" values to constants.R

content_count = as.vector(table(df$content_treat))
content_truth = c(489, 513, 496)
stopifnot(assert_that(are_equal(content_count, content_truth)))

source_count = as.vector(table(df$source_treat))
source_truth = c(755, 743)
stopifnot(assert_that(are_equal(source_count, source_truth)))

sc_count = as.vector(table(df$source_treat, df$content_treat))
sc_truth = c(236,253,273,240,246,250)
stopifnot(assert_that(are_equal(sc_count, sc_truth)))