library(tidyverse)
combined <- data_complete %>%
  select(PLAYERID, TEAM, GP.x, GS.x, MPG.x,MPG.y, DEF_RTG.x,DEF_RTG.y, DEF_REB_PCT.x,DEF_REB_PCT.y, STL_PCT.x,STL_PCT.y,BLK_PCT.x,BLK_PCT.y, DEFLECTIONS_PER_48,Year, Agility, Shuttle, Sprint, Standing_Vertical, Max_Vertical, STANDING_REACH, Bench, HAND_LENGTH, HAND_WIDTH, HEIGHT_NO_SHOES, HEIGHT_SHOES, WEIGHT, WINGSPAN, ALL_DEFENSE)
combined <- combined %>%
  filter(MPG.y >= 15, MPG.x >= 15, GP.y >=15, GP.x >= 40, DEF_RTG.y >= 0, DEF_RTG.x >= 0)
fit <- lm(DEF_RTG.x ~ DEF_RTG.y, data = combined)
fit
g <- ggplot(data = combined) +
  geom_point(aes(x = DEF_RTG.y, y = DEF_RTG.x), size = 0.3, alpha = .3) +
  geom_abline(intercept = 79.0397, slope = 0.3029, col = 'red') +
geom_smooth(aes(x = DEF_RTG.y, DEF_RTG.x), method = "lm", se = F)
g
cor(combined[['DEF_RTG.y']], combined[['DEF_RTG.x']])
save(combined, file = "combined.RData")