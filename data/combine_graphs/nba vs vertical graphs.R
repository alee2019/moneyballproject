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


#Graph and correlation of guards vertical vs. block percentage
graph_vertical_blkpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_VERTICAL, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Block Percentage Comparison of Guards")

cor(guards[["z_VERTICAL"]], guards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards vertical vs. block percentage
graph_vertical_blkpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_VERTICAL, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Block Percentage Comparison of Forwards")

cor(forwards[["z_VERTICAL"]], forwards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers vertical vs. block percentage
graph_vertical_blkpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_VERTICAL, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Block Percentage Comparison of Centers")

cor(centers[["z_VERTICAL"]], centers[["rBLK_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards vertical vs. steal percentage
graph_vertical_stlpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_VERTICAL, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Steal Percentage Comparison of Guards")

cor(guards[["z_VERTICAL"]], guards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards vertical vs. steal percentage
graph_vertical_stlpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_VERTICAL, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Steal Percentage Comparison of Forwards")

cor(forwards[["z_VERTICAL"]], forwards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers vertical vs. steal percentage
graph_vertical_stlpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_VERTICAL, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Steal Percentage Comparison of Centers")

cor(centers[["z_VERTICAL"]], centers[["zSTL_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards vertical vs. def rating
graph_vertical_defrtg_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_VERTICAL, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Defensive Rating Comparison of Guards")

cor(guards[["z_VERTICAL"]], guards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards vertical vs. def rating
graph_vertical_defrtg_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_VERTICAL, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Defensive Rating Comparison of Forwards")

cor(forwards[["z_VERTICAL"]], forwards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers vertical vs. def rating
graph_vertical_defrtg_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_VERTICAL, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Defensive Rating Comparison of Centers")

cor(centers[["z_VERTICAL"]], centers[["zDEF_RTG_NBA"]], use = "na.or.complete")

