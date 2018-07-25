library(tidyverse)
#combined <- data_complete %>%
  #select(PLAYERID, POS, Year.x, Year, TEAM, Team, ALL_DEFENSE, GP.x, GS.x, GP.y, GS.y, MPG.x,MPG.y, DEF_RTG.x,DEF_RTG.y, STL_PCT.x,STL_PCT.y,BLK_PCT.x,BLK_PCT.y , Agility, Shuttle, Sprint, Standing_Vertical, Max_Vertical, STANDING_REACH, Bench, HAND_LENGTH, HAND_WIDTH, HEIGHT_NO_SHOES, HEIGHT_SHOES, WEIGHT, WINGSPAN, CONF_NCAA, zDEF_RTG_NCAA, zBLK_PCT_NCAA, zSTL_PCT_NCAA)
library(tidyverse)

combined_centers <- centers %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0) 
combined_forwards <- forwards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
combined_guards <- guards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
graph_centers <- ggplot(data = combined_centers) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "DEF_RATING Z-Score Comparison of Centers")
graph_forwards <- ggplot(data = combined_forwards) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) +
  labs(title = "DEF_RATING Z-Score Comparison of Forwards")
graph_guards <- ggplot(data = combined_guards) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) +
  labs(title = "DEF_RATING Z-Score Comparison of Forwards")
graph_centers
graph_forwards
graph_guards
cor(combined_centers[['zDEF_RTG_NCAA']], combined_centers[['zDEF_RTG_NBA']], use = "na.or.complete")
cor(combined_forwards[['zDEF_RTG_NCAA']], combined_forwards[['zDEF_RTG_NBA']], use = "na.or.complete")
cor(combined_guards[['zDEF_RTG_NCAA']], combined_guards[['zDEF_RTG_NBA']], use = "na.or.complete")
graph_centers_career <- ggplot(data = centers_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "DEF_RATING Z-Score Comparison of Centers")
graph_forwards_career <- ggplot(data = forwards_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "DEF_RATING Z-Score Comparison of Centers")
graph_guards_career <- ggplot(data = guards_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "DEF_RATING Z-Score Comparison of Centers")
graph_centers_career
graph_forwards_career
graph_guards_career
cor(centers_career[['zDEF_RTG_NCAA']], centers_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
cor(forwards_career[['zDEF_RTG_NCAA']], forwards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
cor(guards_career[['zDEF_RTG_NCAA']], guards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
#save(combined, file = "combined.RData")
