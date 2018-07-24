library(tidyverse)
Big12 <- c("KAN", "OKST", "OU", "BAYLOR", "TEXAS")
ACC <- c("UVA", "DUKE", "CLEM", "UNC", "MIA", "FSU", "LOU", "SYR", "BC", "GT", "WAKE", "PITT")
BigEast <- c("XAVIER", "NOVA", "SHU", "CREIGH", "PROV", "BUTLER", "MARQ", "GTOWN")
BigTen <- c("MSU", "PUR", "OSU", "MICH", "NEB", "Penn State", "IND", "MD", "WIS", "Northwestern", "Minnesota", "ILL", "IOWA", "Rutgers")
SEC <- c("AUB", "Tennessee", "FLA", "UK", "ARK", "MIZZOU", "Mississippi State", "Texas A&M", "ALA", "LSU", "Georgia", "USC", "VANDY", "Ole Miss")
TheAmerican <- c("CIN", "HOU", "WICH", "Tulsa", "MEM", "UCF", "TEMPLE", "UCONN", "SMU", "Tulane", "East Carolina", "South Florida")
PAC12 <- c("ARIZ", "USC", "UTAH", "UCLA", "STAN", "ORE", "Washington", "ASU", "Colorado", "Oregon State", "CAL") 

load("data/qualified_standardized_guards.RData")
load("data/qualified_standardized_forwards.RData")
load("data/qualified_standardized_centers.RData")

guards <- guards %>% mutate(CONF_NCAA = case_when(
  TEAM_NCAA %in% Big12 ~ "Big 12", 
  TEAM_NCAA %in% ACC ~ "ACC",
  TEAM_NCAA %in% BigEast ~"Big East",
  TEAM_NCAA %in% BigTen ~ "Big Ten",
  TEAM_NCAA %in% SEC ~ "SEC",
  TEAM_NCAA %in% TheAmerican ~ "The American",
  TEAM_NCAA %in% PAC12 ~ "PAC 12"
))

forwards <- forwards %>% mutate(CONF_NCAA = case_when(
  TEAM_NCAA %in% Big12 ~ "Big 12", 
  TEAM_NCAA %in% ACC ~ "ACC",
  TEAM_NCAA %in% BigEast ~"Big East",
  TEAM_NCAA %in% BigTen ~ "Big Ten",
  TEAM_NCAA %in% SEC ~ "SEC",
  TEAM_NCAA %in% TheAmerican ~ "The American",
  TEAM_NCAA %in% PAC12 ~ "PAC 12"
))

centers <- centers %>% mutate(CONF_NCAA = case_when(
  TEAM_NCAA %in% Big12 ~ "Big 12", 
  TEAM_NCAA %in% ACC ~ "ACC",
  TEAM_NCAA %in% BigEast ~"Big East",
  TEAM_NCAA %in% BigTen ~ "Big Ten",
  TEAM_NCAA %in% SEC ~ "SEC",
  TEAM_NCAA %in% TheAmerican ~ "The American",
  TEAM_NCAA %in% PAC12 ~ "PAC 12"
))

save(guards, file = "data/qualified_standardized_guards.RData")
save(forwards, file = "data/qualified_standardized_forwards.RData")
save(centers, file = "data/qualified_standardized_centers.RData")
