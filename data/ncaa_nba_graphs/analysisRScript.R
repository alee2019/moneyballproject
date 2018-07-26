library(tidyverse)
#combined <- data_complete %>%
  #select(PLAYERID, POS, Year.x, Year, TEAM, Team, ALL_DEFENSE, GP.x, GS.x, GP.y, GS.y, MPG.x,MPG.y, DEF_RTG.x,DEF_RTG.y, STL_PCT.x,STL_PCT.y,BLK_PCT.x,BLK_PCT.y , Agility, Shuttle, Sprint, Standing_Vertical, Max_Vertical, STANDING_REACH, Bench, HAND_LENGTH, HAND_WIDTH, HEIGHT_NO_SHOES, HEIGHT_SHOES, WEIGHT, WINGSPAN, CONF_NCAA, zDEF_RTG_NCAA, zBLK_PCT_NCAA, zSTL_PCT_NCAA)
combined_centers <- centers %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0) 
combined_forwards <- forwards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)
combined_guards <- guards %>%
  filter(MPG_NBA >= 15,  GP_NBA >= 40,  DEF_RTG_NBA >= 0)

cor_center <- cor(combined_centers[['zDEF_RTG_NCAA']], combined_centers[['zDEF_RTG_NBA']], use = "na.or.complete")
#graph of college def rating for centers
graph_centers <- ggplot(data = combined_centers) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.5, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) + 
  ggtitle("NCAA Defensive Rating vs. NBA Defensive Rating: Centers",
          subtitle = paste("R =", round(cor_center, 3))) + theme_classic()

cor_forward <- cor(combined_forwards[['zDEF_RTG_NCAA']], combined_forwards[['zDEF_RTG_NBA']], use = "na.or.complete")
#graph of college def rating for forwards
graph_forwards <- ggplot(data = combined_forwards) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.5, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) +
  ggtitle("NCAA Defensive Rating vs. NBA Defensive Rating: Forwards",
          subtitle = paste("R =", round(cor_forward, 3))) + theme_classic()

cor_guard <- cor(combined_guards[['zDEF_RTG_NCAA']], combined_guards[['zDEF_RTG_NBA']], use = "na.or.complete")
#graph of college def rating for guards
graph_guards <- ggplot(data = combined_guards) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_NBA), size = 0.5, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_NBA), method = "lm", se = F) +
  ggtitle("NCAA Defensive Rating vs. NBA Defensive Rating: Guards",
          subtitle = paste("R =", round(cor_guard, 3))) + theme_classic()
graph_centers
graph_forwards
graph_guards

#correlations for all 3 positions
cor(combined_centers[['zDEF_RTG_NCAA']], combined_centers[['zDEF_RTG_NBA']], use = "na.or.complete")
cor(combined_forwards[['zDEF_RTG_NCAA']], combined_forwards[['zDEF_RTG_NBA']], use = "na.or.complete")
cor(combined_guards[['zDEF_RTG_NCAA']], combined_guards[['zDEF_RTG_NBA']], use = "na.or.complete")

cor_center_avg <- cor(centers_career[['zDEF_RTG_NCAA']], centers_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
#graph of college def rating for centers vs. average nba def rating
graph_centers_career <- ggplot(data = centers_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.5, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  ggtitle("NCAA Defensive Rating vs. NBA Defensive Rating: Centers",
          subtitle = paste("R =", round(cor_center_avg, 3))) + theme_classic()

cor_forward_avg <- cor(forwards_career[['zDEF_RTG_NCAA']], forwards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
#graph of college def rating for forwards vs. average nba def rating
graph_forwards_career <- ggplot(data = forwards_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.5, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  ggtitle("NCAA Defensive Rating vs. NBA Defensive Rating: Forwards",
          subtitle = paste("R =", round(cor_forward_avg, 3))) + theme_classic()

cor_guard_avg <- cor(guards_career[['zDEF_RTG_NCAA']], guards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
#graph of college def rating for guards vs. average nba def rating
graph_guards_career <- ggplot(data = guards_career) +
  geom_point(aes(x = zDEF_RTG_NCAA, y = zDEF_RTG_AVG_NBA), size = 0.5, alpha = .3)+
  geom_smooth(aes(x = zDEF_RTG_NCAA, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  ggtitle("NCAA Defensive Rating vs. NBA Defensive Rating: Guards",
          subtitle = paste("R =", round(cor_guard_avg, 3))) + theme_classic()
graph_centers_career
graph_forwards_career
graph_guards_career

#correlation of average def rating for all 3 positions
cor(centers_career[['zDEF_RTG_NCAA']], centers_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
cor(forwards_career[['zDEF_RTG_NCAA']], forwards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')
cor(guards_career[['zDEF_RTG_NCAA']], guards_career[['zDEF_RTG_AVG_NBA']], use = 'na.or.complete')


