#Graph and correlation of guards height vs. block percentage
graph_height_blkpctavg_guards_career <- ggplot(data = guards_career_career) + geom_point(mapping = aes(x = z_HEIGHT, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Block Percentage Comparison of Guards")

cor(guards_career[["z_HEIGHT"]], guards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards height vs. block percentage
graph_height_blkpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_HEIGHT, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Block Percentage Comparison of Forwards")

cor(forwards_career[["z_HEIGHT"]], forwards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers height vs. block percentage
graph_height_blkpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_HEIGHT, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Block Percentage Comparison of Centers")

cor(centers_career[["z_HEIGHT"]], centers_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards height vs. steal percentage
graph_height_stlpctavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_HEIGHT, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Steal Percentage Comparison of Guards")

cor(guards_career[["z_HEIGHT"]], guards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards height vs. steal percentage
graph_height_stlpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_HEIGHT, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Steal Percentage Comparison of Forwards")

cor(forwards_career[["z_HEIGHT"]], forwards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers height vs. steal percentage
graph_height_stlpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_HEIGHT, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Steal Percentage Comparison of Centers")

cor(centers_career[["z_HEIGHT"]], centers_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards height vs. def rating
graph_height_defrtgavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_HEIGHT, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Defensive Rating Comparison of Guards")

cor(guards_career[["z_HEIGHT"]], guards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards height vs. def rating
graph_height_defrtgavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_HEIGHT, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Defensive Rating Comparison of Forwards")

cor(forwards_career[["z_HEIGHT"]], forwards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers height vs. def rating
graph_height_defrtgavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_HEIGHT, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_HEIGHT, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Height and Defensive Rating Comparison of Centers")

cor(centers_career[["z_HEIGHT"]], centers_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")
