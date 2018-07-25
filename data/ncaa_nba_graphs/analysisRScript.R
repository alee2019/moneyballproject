library(tidyverse)
#combined <- data_complete %>%
  #select(PLAYERID, POS, Year.x, Year, TEAM, Team, ALL_DEFENSE, GP.x, GS.x, GP.y, GS.y, MPG.x,MPG.y, DEF_RTG.x,DEF_RTG.y, STL_PCT.x,STL_PCT.y,BLK_PCT.x,BLK_PCT.y , Agility, Shuttle, Sprint, Standing_Vertical, Max_Vertical, STANDING_REACH, Bench, HAND_LENGTH, HAND_WIDTH, HEIGHT_NO_SHOES, HEIGHT_SHOES, WEIGHT, WINGSPAN, CONF_NCAA, zDEF_RTG_NCAA, zBLK_PCT_NCAA, zSTL_PCT_NCAA)
install.packages('Hmisc')
combined_centers <- centers %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0) 
combined_forwards <- forwards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
combined_guards <- guards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
#graph of college def rating for centers
graph_centers <- ggplot(data = combined_centers) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "DEF_RATING Z-Score Comparison of Centers")

#graph of college def rating for forwards
graph_forwards <- ggplot(data = combined_forwards) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) +
  labs(title = "DEF_RATING Z-Score Comparison of Forwards")

#graph of college def rating for guards
graph_guards <- ggplot(data = combined_guards) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) +
  labs(title = "DEF_RATING Z-Score Comparison of Guards")
graph_centers
graph_forwards
graph_guards

#correlations for all 3 positions
cor(combined_centers[['zDEF_RTG_NCAA']], combined_centers[['zDEF_RTG_NBA']], use = "na.or.complete")
cor(combined_forwards[['zDEF_RTG_NCAA']], combined_forwards[['zDEF_RTG_NBA']], use = "na.or.complete")
cor(combined_guards[['zDEF_RTG_NCAA']], combined_guards[['zDEF_RTG_NBA']], use = "na.or.complete")

#graph of college def rating for centers vs. average nba def rating
graph_centers_career <- ggplot(data = centers_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Average DEF_RATING Z-Score Comparison of Centers")

#graph of college def rating for forwards vs. average nba def rating
graph_forwards_career <- ggplot(data = forwards_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Average DEF_RATING Z-Score Comparison of Forwards")

#graph of college def rating for guards vs. average nba def rating
graph_guards_career <- ggplot(data = guards_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.3, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Average DEF_RATING Z-Score Comparison of Guards")
graph_centers_career
graph_forwards_career
graph_guards_career

#correlation of average def rating for all 3 positions
cor(centers_career[['zDEF_RTG_NCAA']], centers_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
cor(forwards_career[['zDEF_RTG_NCAA']], forwards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
cor(guards_career[['zDEF_RTG_NCAA']], guards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')

library(Hmisc)
res <- rcorr(as.matrix(centers))
