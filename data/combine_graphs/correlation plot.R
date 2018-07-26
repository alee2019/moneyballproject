install.packages("Hmisc")
install.packages("corrplot")
library("Hmisc")
library("corrplot")

guards_new <- guards %>% ungroup() %>% select(zDEF_RTG_NBA, zDEF_RTG_NCAA, rBLK_PCT_NBA, rBLK_PCT_NCAA, zSTL_PCT_NBA, zSTL_PCT_NCAA)

guards_2 <- guards %>% ungroup() %>% select(z_HEIGHT, z_AGILITY, z_WINGSPAN, z_VERTICAL)

res <- cor(guards_2, guards_new, use = "complete.obs")
round(res, 2)

corrplot(res, method = "color", outline = TRUE, type = "full")


