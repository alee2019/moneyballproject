library(tidyverse)
Big12 <- c("KAN", "OKST", "OU", "BAYLOR", "TEXAS", "TTU", "WVU", "KSU", "TCU", "ISU")
ACC <- c("UVA", "DUKE", "CLEM", "UNC", "MIA", "FSU", "LOU", "SYR", "BC", "GT", "WAKE", "PITT", "NCST", "VT", "ND", "BC")
BigEast <- c("XAVIER", "NOVA", "SHU", "CREIGH", "PROV", "BUTLER", "MARQ", "GTOWN", "SJC", "DPU")
BigTen <- c("MSU", "PUR", "MICH", "NEB", "PSU", "IND", "MD", "WIS", "NU", "MINN", "ILL", "IOWA", "RUTG")
SEC <- c("AUB", "TENN", "FLA", "UK", "ARK", "MIZZOU", "MSU", "TXA&M", "ALA", "LSU", "UGA", "USC", "VANDY", "OMISS")
TheAmerican <- c("CIN", "HOU", "WICH", "TULSA", "MEM", "UCF", "TEMPLE", "UCONN", "SMU", "TULANE", "ECU", "USF")
PAC12 <- c("ARIZ", "USC", "UTAH", "UCLA", "STAN", "ORE", "WASH", "ASU", "CU", "OSU", "WSU", "CAL") 

load("data/ncaa_defense.RData")

ncaa_data <- ncaa_data %>% mutate(CONF_NCAA = case_when(
  Team %in% Big12 ~ "Big 12", 
  Team %in% ACC ~ "ACC",
  Team %in% BigEast ~"Big East",
  Team %in% BigTen ~ "Big Ten",
  Team %in% SEC ~ "SEC",
  Team %in% TheAmerican ~ "The American",
  Team %in% PAC12 ~ "PAC 12"
))

save(ncaa_data, file = "data/ncaa_defense.RData")

