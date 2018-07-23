library(tidyverse)
#install.packages("Lahman")
ncaa_data1 <- ncaa_data %>%
  select(PLAYERID, Team, GP, GS, MPG, DEF_RTG, DEF_REB_PCT, STL_PCT,BLK_PCT, Year)
nba_data1 <- nba_data_all %>%
  select(PLAYERID, TEAM, GP, GS, MPG, DEF_RTG, DEF_REB_PCT, STL_PCT,BLK_PCT, DEFLECTIONS_PER_48,Year)
combined <- merge(nba_data1, ncaa_data1, by = "PLAYERID")
combined <- combined %>%
  filter(MPG.y >= 15, MPG.x >= 15, GP.y >=15, GP.x >= 40)
fit <- lm(DEF_RTG.x ~ DEF_RTG.y, data = combined)
fit
combined_sum <- combined %>%
  summarize(mean = mean(DEF_RTG.x))
combined_sum
g <- ggplot(data = combined) +
  geom_point(aes(x = DEF_RTG.y, y = DEF_RTG.x), size = 0.3) +
  geom_abline(intercept = 78.7999, slope = 0.3041, col = 'red')
g
cor(combined[['DEF_RTG.y']], combined[['DEF_RTG.x']])
