# Filter all three tibbles
guards <- guards %>%
  filter(MPG_NBA >= 15, GP_NBA >= 40)

forwards <- forwards %>%
  filter(MPG_NBA >= 15, GP_NBA >= 40)

centers <- centers %>%
  filter(MPG_NBA >= 15, GP_NBA >= 40)


#Graph and correlation of guards block percentage
graph_blkpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = rBLK_PCT_NCAA, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = rBLK_PCT_NCAA, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Block Percentage Comparison of Guards")

cor(guards[["rBLK_PCT_NCAA"]], guards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards block percentage
graph_blkpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = rBLK_PCT_NCAA, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = rBLK_PCT_NCAA, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Block Percentage Comparison of Forwards")


cor(forwards[["rBLK_PCT_NCAA"]], forwards[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers block percentage
graph_blkpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = rBLK_PCT_NCAA, y = rBLK_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = rBLK_PCT_NCAA, rBLK_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Block Percentage Comparison of Centers")

cor(centers[["rBLK_PCT_NCAA"]], centers[["rBLK_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of guards steal percentage
graph_stlpct_guards <- ggplot(data = guards) + geom_point(mapping = aes(x = zSTL_PCT_NCAA, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = zSTL_PCT_NCAA, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Steal Percentage Comparison of Guards")

cor(guards[["zSTL_PCT_NCAA"]], guards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards steal percentage
graph_stlpct_forwards <- ggplot(data = forwards) + geom_point(mapping = aes(x = zSTL_PCT_NCAA, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = zSTL_PCT_NCAA, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Steal Percentage Comparison of Forwards")


cor(forwards[["zSTL_PCT_NCAA"]], forwards[["zSTL_PCT_NBA"]], use = "na.or.complete")


#Graph and correlation of centers steal percentage
graph_stlpct_centers <- ggplot(data = centers) + geom_point(mapping = aes(x = zSTL_PCT_NCAA, y = zSTL_PCT_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = zSTL_PCT_NCAA, zSTL_PCT_NBA), method = "lm", se = F) + 
  labs(title = "Steal Percentage Comparison of Centers")

cor(centers[["zSTL_PCT_NCAA"]], centers[["zSTL_PCT_NBA"]], use = "na.or.complete")

