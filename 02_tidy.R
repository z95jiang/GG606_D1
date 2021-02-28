# Clean and prepare data
# analysis-template/clean/

# Use this file for tidying data and preparing it for further analysis
#get unique values of columns
ncdb_names <- c("C_YEAR", "C_MNTH", "C_WDAY", "C_HOUR", "C_SEV", "C_CONF", "C_RCFG", "C_WTHR",
"C_RSUR", "C_RALN", "C_TRAF",   "V_TYPE",   "P_SEX", 
"P_PSN",  "P_ISEV", "P_SAFE", "P_USER")
for(i in ncdb_names){
  print(i)
  print(unique(ncdb[,i]))
}
summary(ncdb)
