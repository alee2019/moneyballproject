#Graph and correlation of guards vertical vs. block percentage
graph_vertical_blkpctavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_VERTICAL, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Block Percentage Comparison of Guards")

cor(guards_career[["z_VERTICAL"]], guards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards vertical vs. block percentage
graph_vertical_blkpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_VERTICAL, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Block Percentage Comparison of Forwards")

cor(forwards_career[["z_VERTICAL"]], forwards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers vertical vs. block percentage
graph_vertical_blkpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_VERTICAL, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Block Percentage Comparison of Centers")

cor(centers_career[["z_VERTICAL"]], centers_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards vertical vs. steal percentage
graph_vertical_stlpctavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_VERTICAL, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Steal Percentage Comparison of Guards")

cor(guards_career[["z_VERTICAL"]], guards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards vertical vs. steal percentage
graph_vertical_stlpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_VERTICAL, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Steal Percentage Comparison of Forwards")

cor(forwards_career[["z_VERTICAL"]], forwards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers vertical vs. steal percentage
graph_vertical_stlpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_VERTICAL, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Steal Percentage Comparison of Centers")

cor(centers_career[["z_VERTICAL"]], centers_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards vertical vs. def rating
graph_vertical_defrtgavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_VERTICAL, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Defensive Rating Comparison of Guards")

cor(guards_career[["z_VERTICAL"]], guards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards vertical vs. def rating
graph_vertical_defrtgavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_VERTICAL, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Defensive Rating Comparison of Forwards")

cor(forwards_career[["z_VERTICAL"]], forwards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers vertical vs. def rating
graph_vertical_defrtgavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_VERTICAL, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_VERTICAL, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Vertical and Defensive Rating Comparison of Centers")

cor(centers_career[["z_VERTICAL"]], centers_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")
