# Osoyoos Lake parr data summarization, tidying
# Braden Judson
# November 4, 2022

setwd("~/oso_primary/data/parr")

parr <- read.csv("OSO_ATS_age0_summary_nov4.2022.csv",   # Read in csv.
                 stringsAsFactors = F)                   # Keeps #s numeric.

parr$season <- case_when(           # Add season factor. Arbitrary right now.
 between(parr$month, 4, 9) ~ "W",   # September to March is Winter.
 !between(parr$month, 4, 9) ~ "S"   # April to August is Summer.
)

summary(parr$length_mean_cm); hist(parr$length_mean_cm)  # Explore lengths.
summary(parr$mass_mean_g); hist(parr$mass_mean_g)        # Explore masses.

ggplot(data = parr) +
  geom_point(aes(x = length_mean_cm, 
                 y = mass_mean_g))
