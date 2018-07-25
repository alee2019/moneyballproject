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


#Graph and correlation of guards wingspan vs. block percentage
graph_wingspan_blkpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_WINGSPAN, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Block Percentage Comparison of Guards")

cor(guards[["z_WINGSPAN"]], guards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards wingspan vs. block percentage
graph_wingspan_blkpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_WINGSPAN, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Block Percentage Comparison of Forwards")

cor(forwards[["z_WINGSPAN"]], forwards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers wingspan vs. block percentage
graph_wingspan_blkpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_WINGSPAN, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Block Percentage Comparison of Centers")

cor(centers[["z_WINGSPAN"]], centers[["rBLK_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards wingspan vs. steal percentage
graph_wingspan_stlpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_WINGSPAN, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Steal Percentage Comparison of Guards")

cor(guards[["z_WINGSPAN"]], guards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards wingspan vs. steal percentage
graph_wingspan_stlpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_WINGSPAN, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Steal Percentage Comparison of Forwards")

cor(forwards[["z_WINGSPAN"]], forwards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers wingspan vs. steal percentage
graph_wingspan_stlpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_WINGSPAN, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Steal Percentage Comparison of Centers")

cor(centers[["z_WINGSPAN"]], centers[["zSTL_PCT_NBA"]], use = "na.or.complete")




#Graph and correlation of guards wingspan vs. def rating
graph_wingspan_defrtg_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = z_WINGSPAN, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Defensive Rating Comparison of Guards")

cor(guards[["z_WINGSPAN"]], guards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards wingspan vs. def rating
graph_wingspan_defrtg_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = z_WINGSPAN, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Defensive Rating Comparison of Forwards")

cor(forwards[["z_WINGSPAN"]], forwards[["zDEF_RTG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers wingspan vs. def rating
graph_wingspan_defrtg_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = z_WINGSPAN, y = zDEF_RTG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zDEF_RTG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Defensive Rating Comparison of Centers")

cor(centers[["z_WINGSPAN"]], centers[["zDEF_RTG_NBA"]], use = "na.or.complete")
