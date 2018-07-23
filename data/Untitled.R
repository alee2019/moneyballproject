library(tidyverse)
combine_analysis <- qualified_nba
fit <- lm(DEF_RTG.x ~ z_HEIGHT, data = combine_analysis)
fit
height <- ggplot(data = combine_analysis) + 
  geom_point(mapping = aes(x = z_HEIGHT, zBLK_PCT_NBA_year), size = 0.3) + 
  geom_smooth(aes(x = z_HEIGHT, zBLK_PCT_NBA_year), method = 'lm', se = F)
height
