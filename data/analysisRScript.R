library(tidyverse)
combined <- data_complete %>%
  select(PLAYERID, POS, Year.x, Year, TEAM, Team, GP.x, GS.x, GP.y, GS.y, MPG.x,MPG.y, DEF_RTG.x,DEF_RTG.y, STL_PCT.x,STL_PCT.y,BLK_PCT.x,BLK_PCT.y , Agility, Shuttle, Sprint, Standing_Vertical, Max_Vertical, STANDING_REACH, Bench, HAND_LENGTH, HAND_WIDTH, HEIGHT_NO_SHOES, HEIGHT_SHOES, WEIGHT, WINGSPAN, ALL_DEFENSE, CONF_NCAA, zDEF_RTG_NCAA, zBLK_PCT_NCAA, zSTL_PCT_NCAA)
library(tidyverse)

combined_centers <- centers %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
combined_forwards <- forwards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
combined_guards <- guards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
graph_centers <- ggplot(data = combined_centers) +
  geom_point(aes(x = DEF_RTG_NCAA, y = DEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = DEF_RTG_NCAA, DEF_RTG_NBA), method = "lm", se = F)
graph_forwards <- ggplot(data = combined_forwards) +
  geom_point(aes(x = DEF_RTG_NCAA, y = DEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = DEF_RTG_NCAA, DEF_RTG_NBA), method = "lm", se = F)
graph_guards <- ggplot(data = combined_guards) +
  geom_point(aes(x = DEF_RTG_NCAA, y = DEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = DEF_RTG_NCAA, DEF_RTG_NBA), method = "lm", se = F)
graph_centers
graph_forwards
graph_guards
cor(centers[['DEF_RTG_NCAA']], centers[['DEF_RTG_NBA']])
save(combined, file = "combined.RData")
