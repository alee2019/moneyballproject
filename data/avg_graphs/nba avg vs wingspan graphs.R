#Graph and correlation of guards wingspan vs. block percentage
graph_wingspan_blkpctavg_guards_career <- ggplot(data = guards_career_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Block Percentage Comparison of Guards")

cor(guards_career[["z_WINGSPAN"]], guards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards wingspan vs. block percentage
graph_wingspan_blkpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Block Percentage Comparison of Forwards")

cor(forwards_career[["z_WINGSPAN"]], forwards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers wingspan vs. block percentage
graph_wingspan_blkpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Block Percentage Comparison of Centers")

cor(centers_career[["z_WINGSPAN"]], centers_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards wingspan vs. steal percentage
graph_wingspan_stlpctavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Steal Percentage Comparison of Guards")

cor(guards_career[["z_WINGSPAN"]], guards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards wingspan vs. steal percentage
graph_wingspan_stlpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Steal Percentage Comparison of Forwards")

cor(forwards_career[["z_WINGSPAN"]], forwards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers wingspan vs. steal percentage
graph_wingspan_stlpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Steal Percentage Comparison of Centers")

cor(centers_career[["z_WINGSPAN"]], centers_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards wingspan vs. def rating
graph_wingspan_defrtgavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Defensive Rating Comparison of Guards")

cor(guards_career[["z_WINGSPAN"]], guards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards wingspan vs. def rating
graph_wingspan_defrtgavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Defensive Rating Comparison of Forwards")

cor(forwards_career[["z_WINGSPAN"]], forwards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers wingspan vs. def rating
graph_wingspan_defrtgavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_WINGSPAN, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_WINGSPAN, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Wingspan and Defensive Rating Comparison of Centers")

cor(centers_career[["z_WINGSPAN"]], centers_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")
