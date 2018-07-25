#Graph and correlation of guards agility vs. block percentage
graph_agility_blkpctavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_AGILITY, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Block Percentage Comparison of Guards")

cor(guards_career[["z_AGILITY"]], guards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards agility vs. block percentage
graph_agility_blkpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_AGILITY, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Block Percentage Comparison of Forwards")

cor(forwards_career[["z_AGILITY"]], forwards_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers agility vs. block percentage
graph_agility_blkpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_AGILITY, y = rBLK_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, rBLK_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Block Percentage Comparison of Centers")

cor(centers_career[["z_AGILITY"]], centers_career[["rBLK_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards agility vs. steal percentage
graph_agility_stlpctavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_AGILITY, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Steal Percentage Comparison of Guards")

cor(guards_career[["z_AGILITY"]], guards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards agility vs. steal percentage
graph_agility_stlpctavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_AGILITY, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Steal Percentage Comparison of Forwards")

cor(forwards_career[["z_AGILITY"]], forwards_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers agility vs. steal percentage
graph_agility_stlpctavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_AGILITY, y = zSTL_PCT_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zSTL_PCT_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Steal Percentage Comparison of Centers")

cor(centers_career[["z_AGILITY"]], centers_career[["zSTL_PCT_AVG_NBA"]], use = "na.or.complete")




#Graph and correlation of guards agility vs. def rating
graph_agility_defrtgavg_guards_career <- ggplot(data = guards_career) + geom_point(mapping = aes(x = z_AGILITY, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Defensive Rating Comparison of Guards")

cor(guards_career[["z_AGILITY"]], guards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of forwards agility vs. def rating
graph_agility_defrtgavg_forwards_career <- ggplot(data = forwards_career) + geom_point(mapping = aes(x = z_AGILITY, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Defensive Rating Comparison of Forwards")

cor(forwards_career[["z_AGILITY"]], forwards_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")


#Graph and correlation of centers agility vs. def rating
graph_agility_defrtgavg_centers_career <- ggplot(data = centers_career) + geom_point(mapping = aes(x = z_AGILITY, y = zDEF_RTG_AVG_NBA), size = .3, alpha = 0.3) +
  geom_smooth(aes(x = z_AGILITY, zDEF_RTG_AVG_NBA), method = "lm", se = F) + 
  labs(title = "Agility and Defensive Rating Comparison of Centers")

cor(centers_career[["z_AGILITY"]], centers_career[["zDEF_RTG_AVG_NBA"]], use = "na.or.complete")
