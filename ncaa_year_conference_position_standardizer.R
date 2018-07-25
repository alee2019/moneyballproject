load("data/ncaa_defense.RData")


standardize <- function(x) {
  return((x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE))
}

ncaa_data <- ncaa_data %>% 
  group_by(Year, CONF_NCAA) %>% 
  mutate(zDEF_RTG_NCAA = (-1) * standardize(DEF_RTG),
         zSTL_PCT_NCAA = standardize(STL_PCT),
         zBLK_PCT_NCAA = standardize(BLK_PCT)) %>% 
  ungroup()

save(ncaa_data, file = "data/ncaa_defense.RData")

