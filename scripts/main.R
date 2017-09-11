# main script that runs all of the analyses and produces all required output for reporting purposes
# https://github.com/mozilla/PPPStudy

rm(list=ls(all=T))
gc()
library(tidyverse)
library(assertthat)
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
library(psych)

#pkgs <- c("dplyr", "tidyr", "broom")
#install.packages(pkgs) #install 
#sapply(pkgs, require, character.only = T)

#source('getdata.R') # run this once upon cloning of project
fn = 'C:/Users/rjweiss/Documents/Mozilla/PPPStudy/data/data_2017-06-19.RData' # this is hardcoded
df = read_rds(fn)

setwd('C:/Users/rjweiss/Documents/Mozilla/PPPStudy/scripts/')
source('renaming.R')
source('recoding.R')
source('preprocessing.R')
source('run_tests.R')
source('models.R')
source('tables.R')
source('figures.R')