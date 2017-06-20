# main script that runs all of the analyses and produces all required output for reporting purposes
rm(list=ls(all=T))
gc()
library(tidyverse)
library(plyr)
library(forcats)
library(stringr)
library(reshape2)
library(ggplot2)
library(scales)
library(ggthemes)
library(sjPlot)
library(sjmisc)
library(lme4)
library(broom)

#source('getdata.R')
fn = '~/Mozilla/Projects/PPPStudy/data/data_2017-06-19.RData'
df = read_rds(fn)

setwd('~/Mozilla/Projects/PPPStudy/scripts/')
source('renaming.R')
source('recoding.R')
source('preprocessing.R')

# run_tests.R # this script should make some assertions about the dataset to ensure that we know the truth
# run_analyses.R
# make_report.R