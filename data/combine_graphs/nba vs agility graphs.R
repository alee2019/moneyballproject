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


#Graph and correlation of guards agility vs. block percentage
graph_agility_blkpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_AGILITY, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Block Percentage Comparison of Guards")

cor(guards[["z_AGILITY"]], guards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards agility vs. block percentage
graph_agility_blkpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_AGILITY, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Block Percentage Comparison of Forwards")

cor(forwards[["z_AGILITY"]], forwards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers agility vs. block percentage
graph_agility_blkpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_AGILITY, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Block Percentage Comparison of Centers")

cor(centers[["z_AGILITY"]], centers[["rBLK_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards agility vs. steal percentage
graph_agility_stlpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_AGILITY, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Steal Percentage Comparison of Guards")

cor(guards[["z_AGILITY"]], guards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards agility vs. steal percentage
graph_agility_stlpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_AGILITY, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Steal Percentage Comparison of Forwards")

cor(forwards[["z_AGILITY"]], forwards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers agility vs. steal percentage
graph_agility_stlpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_AGILITY, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Steal Percentage Comparison of Centers")

cor(centers[["z_AGILITY"]], centers[["zSTL_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards agility vs. def rating
graph_agility_defrtg_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_AGILITY, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Defensive Rating Comparison of Guards")

cor(guards[["z_AGILITY"]], guards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards agility vs. def rating
graph_agility_defrtg_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_AGILITY, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Defensive Rating Comparison of Forwards")

cor(forwards[["z_AGILITY"]], forwards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers agility vs. def rating
graph_agility_defrtg_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_AGILITY, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Defensive Rating Comparison of Centers")

cor(centers[["z_AGILITY"]], centers[["zDEF_RTG_NBA"]], use = "na.or.complete")
