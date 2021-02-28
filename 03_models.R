# Create models
# analysis-template/model/

# Use this file for generating models from your tidied data
#Dirver age & gender distribution 2017
#Number of Licenced Drivers by Gender and by Age 2017, 
#data was obtained from the following link: 
#https://www.tc.gc.ca/eng/motorvehiclesafety/canadian-motor-vehicle-traffic-collision-statistics-2017.html
Male_driver <- c(26489L,588792L,1014217L,2279447L,2254865L,2393092L,2339975L,2471717L)
Female_driver <-  c(23153L,544804L,936415L,2190249L,2208617L,2287732L,2224636L,2220191L)
driver_2017 <- data.frame(Male_driver,Female_driver)
age_grp <- c("<16","16-19","20~24","25~34","35~44","45~54","55~64","65+")
rownames(driver_2017) <- age_grp
barplot(height = (Male_driver+Female_driver),names.arg = age_grp,xlab = "Age of driver", ylab ="Number of licensed drivers", col="blue",main = "Licensed drivers 2017")

ncdb$P_AGE=as.numeric((as.character(ncdb$P_AGE)))  #convert to numeric
Driver_AGE=ncdb$P_AGE[ncdb$P_PSN=="11"&ncdb$C_YEAR==2017]  #Retrieve only driver age (seat position= '11')

#Driver_AGE_count <- table(Driver_AGE)
#creat bin for age groups
breaks <- c(0,16,20,25,35,45,55,65,100)
tags <- c("[0~5)","[5~10)","[10~15)","[15~20)","[20~25)","[25~30)","[30~35)","[35~40)","[40~45)","[45~50)","[50~55)","[55~60)","[60~65)","[65~70)","[70~75)","[75~80)","[80~85)","[85~90)","[90~95)","[95~100)")
group_tags <- cut(Driver_AGE,breaks = breaks,include.lowest = TRUE,right=FALSE,labels = age_grp)
Driver_AGE_count <- table(group_tags)
barplot(Driver_AGE_count,xlab = "Age of driver", ylab ="Number of collision records", col="blue", main = "Collision records by age group 2017")

#Driver gender distribution
Male_driver_2017 <- sum(Male_driver)
Female_driver_2017 <- sum(Female_driver)
pct <- round(c(Male_driver_2017,Female_driver_2017)/(Male_driver_2017+Female_driver_2017)*100)
lbls <- paste(c("Male","Female"),pct,"%")
pie3D(pct,labels=lbls,explode=0.1,main="Driver license holders by gender 2017",start =15,col = c("red","green"))


Driver_sex <- ncdb$P_SEX[ncdb$P_PSN=="11" & ncdb$C_YEAR==2017]
Sex_count <- table(Driver_sex)
pct <- round(Sex_count/sum(Sex_count)*100)
lbls <- paste(c("Female","Male","N/A","Unknown"),pct,"%")
#pie(Sex_count, labels=lbls[c(1,2,4)],init.angle = 90,col=rainbow(length(lbls)))
pie3D(Sex_count,labels=lbls,explode=0.1,main="Gender distribtion of collisions 2017",col = c("green","red","yellow","purple"))

#Collision hour distribution
class(ncdb$C_HOUR)
ncdb$C_HOUR=as.numeric(as.character(ncdb$C_HOUR))
hourcount <- table(ncdb$C_HOUR[ncdb$P_PSN=="11"| ncdb$P_PSN == "UU" | ncdb$P_PSN == "NN" ])
barplot(hourcount,xlab = "Hour of the day", ylab ="Number of records", col="blue")

#Age of car involved in collision
ncdb$V_YEAR=as.numeric(as.character(ncdb$V_YEAR))
Age_of_Car <-  ncdb$C_YEAR - ncdb$V_YEAR
Age_of_Car_count <- table(Age_of_Car[ncdb$P_PSN=="11"| ncdb$P_PSN == "UU" | ncdb$P_PSN == "NN" ])
barplot(Age_of_Car_count[0:20],xlab = "Age of Car",ylab = "Number of records", col="blue")

#Collision Serverity
unique(ncdb$P_ISEV)
SEV_count <- table(ncdb$P_ISEV[ncdb$P_PSN=="11"| ncdb$P_PSN == "UU" | ncdb$P_PSN == "NN" ])
pct <- round(SEV_count/sum(SEV_count)*100)
lbls <- paste(c("No Injury","Injury","Fatality","N/A","Unknown"),pct,"%")
#pie(SEV_count, labels=lbls,init.angle = 90,col=c("green","Pink","red","yellow","blue"))
pie3D(SEV_count,labels=lbls,explode=0.1)

#type of collision
Collision_type_count <- table(ncdb$C_CONF[ncdb$P_PSN=="11"| ncdb$P_PSN == "UU" | ncdb$P_PSN == "NN" ])
collision_type_lbl <- c("Hit a moving object","Hit a stationary object","Ran off left shoulder","Ran off right shoulder",
                        "Rollover on roadway","Any other single vehicle collision","Rear-end collision",
                        "Side swipe","1 vehicle to the left /left turn conflict",
                        "1 vehicle to the right / right turn conflict","Any other two vehicle - same direction ",
                        "Head-on collision","Approaching side-swipe","Left turn across opposing traffic","Right turn, including turning conflicts",
                        "Right angle collision","Any other 2-vehicle - diff-direction ","Hit a parked motor vehicle","Other","Unknown")
par(mar=c(16,10,1,1))
barplot(Collision_type_count,names.arg=collision_type_lbl,las=2,col="blue")
