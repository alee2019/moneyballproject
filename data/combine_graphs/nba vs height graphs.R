load("/Users/ryan/Desktop/Moneyball/moneyballproject/data/centers.RData")
load("/Users/ryan/Desktop/Moneyball/moneyballproject/data/forwards.RData")
load("/Users/ryan/Desktop/Moneyball/moneyballproject/data/guards.RData")

# Filter all three tibbles
guards <- guards %>%
  filter(MPG_NBA >= 15, GP_NBA >= 40)

forwards <- forwards %>%
  filter(MPG_NBA >= 15, GP_NBA >= 40)

centers <- centers %>%
  filter(MPG_NBA >= 15, GP_NBA >= 40)


#Graph and correlation of guards height vs. block percentage
graph_height_blkpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_HEIGHT, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Height and Block Percentage Comparison of Guards")

cor(guards[["z_HEIGHT"]], guards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards height vs. block percentage
graph_height_blkpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_HEIGHT, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Height and Block Percentage Comparison of Forwards")

cor(forwards[["z_HEIGHT"]], forwards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers height vs. block percentage
graph_height_blkpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_HEIGHT, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Height and Block Percentage Comparison of Centers")

cor(centers[["z_HEIGHT"]], centers[["rBLK_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards height vs. steal percentage
graph_height_stlpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_HEIGHT, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Height and Steal Percentage Comparison of Guards")

cor(guards[["z_HEIGHT"]], guards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards height vs. steal percentage
graph_height_stlpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_HEIGHT, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Height and Steal Percentage Comparison of Forwards")

cor(forwards[["z_HEIGHT"]], forwards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers height vs. steal percentage
graph_height_stlpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_HEIGHT, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Height and Steal Percentage Comparison of Centers")

cor(centers[["z_HEIGHT"]], centers[["zSTL_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards height vs. def rating
graph_height_defrtg_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_HEIGHT, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Defensive Rating Comparison of Guards")

cor(guards[["z_HEIGHT"]], guards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards height vs. def rating
graph_height_defrtg_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_HEIGHT, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Defensive Rating Comparison of Forwards")

cor(forwards[["z_HEIGHT"]], forwards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers height vs. def rating
graph_height_defrtg_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_HEIGHT, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Defensive Rating Comparison of Centers")

cor(centers[["z_HEIGHT"]], centers[["zDEF_RTG_NBA"]], use = "na.or.complete")

