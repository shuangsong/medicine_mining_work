#remove quarter column and keep indi_pt with list below:

#MULTIPLE MYELOMA

#LYMPHOMA

#Breast Cancer

#RENAL CELL CARCINOMA

#LUNG CANCER

#CHRONIC MYELOID LEUKAEMIA

#ACUTE MYELOID LEUKAEMIA

#ACUTE LYMPHOCYTIC LEUKAEMIA

#GASTRIC CANCER

#COLORECTAL CANCER

#OESOPHAGEAL CARCINOMA

#MYELODYSPLASTIC SYNDROME

#THYROID GLAND CANCER

#####################################################3
#search indi_pt with names below:
#^MULTIPLE MYELOMA$|^LYMPHOMA$|^BREAST CANCER$|^RENAL CELL CARCINOMA$|^LUNG CANCER$|^CHRONIC MYELOID LEUKAEMIA$|^ACUTE MYELOID LEUKAEMIA$|^ACUTE LYMPHOCYTIC LEUKAEMIA$|^GASTRIC CANCER$|^COLORECTAL CANCER$|^OESOPHAGEAL CARCINOMA$|^MYELODYSPLASTIC SYNDROME$|^THYROID GLAND CANCER$
rm(list=ls())

whole<-read.csv("E:/data/whole_case.csv")
head(whole)
whole$indi_pt<-toupper(whole$indi_pt) #turn indi_pt column into upper case

#remove duplicated caseid in whole.csv and named as: keep 

keep <- whole[!duplicated(whole),] # remove duplicated caseid and save as keep

#write.csv(keep, "E:/data/keep.csv", row.names=FALSE)

keep<-read.csv("E:/data/keep.csv")
#i want to subset the whole data to the one with indi_pt according to list above:
#so i grep the names in the list above (total 13 types of cancers) and named it as "keep" data.
total_cancer<-keep[grep("^MULTIPLE MYELOMA$|^LYMPHOMA$|^BREAST CANCER$|^RENAL CELL CARCINOMA$|^LUNG CANCER$|
                        ^CHRONIC MYELOID LEUKAEMIA$|^ACUTE MYELOID LEUKAEMIA$|^ACUTE LYMPHOCYTIC LEUKAEMIA$|^GASTRIC CANCER$|
                        ^COLORECTAL CANCER$|^OESOPHAGEAL CARCINOMA$|^MYELODYSPLASTIC SYNDROME$|^THYROID GLAND CANCER$", keep$indi_pt),]

head(total_cancer) 
nrow(total_cancer) #already unique case
#length(unique(total_cancer$caseid)) # count total number with cancer listed
#170353 unique caseid 

# then count how many males :(turn gender to upper case)
total_cancer$gndr_cod<-toupper(total_cancer$gndr_cod)
total_cancer$age<-toupper(total_cancer$age)
length(unique(total_cancer$caseid))
nrow(total_cancer)

write.csv(total_cancer, "E:/data/total_cancer.csv", row.names=FALSE)

#start from here:

rm(list=ls())
total_cancer<-read.csv("E:/data/total_cancer.csv")
total_cancer$gndr_cod<-toupper(total_cancer$gndr_cod)
total_cancer$age<-toupper(total_cancer$age)
length(unique(total_cancer$caseid))
nrow(total_cancer)

male<-total_cancer[total_cancer$gndr_cod == "M",]
#count unique male caseid:
length(unique(male$caseid))

#subset cases that have gender info:
dino<-total_cancer[!is.na(total_cancer$gndr_cod),]
dino2<-dino[!dino$gndr_cod == 'UNK',]
dino3<-dino2[!dino2$gndr_cod == 'NS',]
head(dino3)
dino3

length(unique(dino$caseid))
#158310
length(unique(dino3$caseid))
#156214
#write.csv(dino3, "E:/data/dino.csv", row.names=FALSE)
#age:
sum(is.na(total_cancer$age))
age_nona <- total_cancer[!is.na(total_cancer$age),]
age_nona <- age_nona[!is.na(age_nona$age),]
age_nona <- age_nona[!age_nona$age == 'NA',]
age_nona$age<-as.numeric(as.character(age_nona$age))
str(age_nona$age)
head(age_nona)
nrow(age_nona)
age_nona <- age_nona[!is.na(age_nona$age),]
#age_nona$age<-gsub(".","",age_nona$age)
#as.numeric(age_nona$age)
#check if have NAs:
age_nona[age_nona$age =='NA',]
sum(is.na(age_nona$age))
#create data called "new"----removed NA in age_cod
new<-age_nona[!is.na(age_nona$age_cod),]
new[new$age_cod == "NA",]
#save:
#write.csv(new, "E:/data/new.csv", row.names=FALSE)
#age_nona[age_nona$age_cod =="DY",]
#search for age_cod if they are MON DY then convert age:
#1,change month to year value:
new$age[new$age_cod == "MON"]<-new$age[new$age_cod == "MON"]/12
#2, change day value to year value:
new$age[new$age_cod == "DY"]<-new$age[new$age_cod == "DY"]/365
#3, change week value to year value:
new$age[new$age_cod == "WK"]<-new$age[new$age_cod == "WK"]/52.14


mean_age <- mean(new$age)
mean_age

sd_age <- sd(new$age)
sd_age


###############################################

# count each cancer use total_cancer data:

#note: type of cancer below:
#^MULTIPLE MYELOMA$|^LYMPHOMA$|^BREAST CANCER$|^RENAL CELL CARCINOMA$|^LUNG CANCER$|
#^CHRONIC MYELOID LEUKAEMIA$|^ACUTE MYELOID LEUKAEMIA$|^ACUTE LYMPHOCYTIC LEUKAEMIA$|^GASTRIC CANCER$|
#^COLORECTAL CANCER$|^OESOPHAGEAL CARCINOMA$|^MYELODYSPLASTIC SYNDROME$|^THYROID GLAND CANCER$

mul<-total_cancer[grep("^MULTIPLE MYELOMA$",total_cancer$indi_pt),]
head(mul)
length(unique(mul$caseid))
nrow(mul)



lym<-total_cancer[grep("^LYMPHOMA$",total_cancer$indi_pt),]
head(lym)
length(unique(lym$caseid))
nrow(lym)



bre<-total_cancer[grep("^BREAST CANCER$",total_cancer$indi_pt),]
head(bre)
length(unique(bre$caseid))
nrow(bre)


ren<-total_cancer[grep("^RENAL CELL CARCINOMA$",total_cancer$indi_pt),]
head(ren)
length(unique(ren$caseid))
nrow(ren)


#lung cancer:
lun<-total_cancer[grep("^LUNG CANCER$",total_cancer$indi_pt),]
head(lun)
length(unique(lun$caseid))
nrow(lun)


chr<-total_cancer[grep("^CHRONIC MYELOID LEUKAEMIA$",total_cancer$indi_pt),]
head(chr)
length(unique(chr$caseid))
nrow(chr)


acute<-total_cancer[grep("^ACUTE MYELOID LEUKAEMIA$",total_cancer$indi_pt),]
head(acute)
length(unique(acute$caseid))
nrow(acute)

acu<-total_cancer[grep("^ACUTE LYMPHOCYTIC LEUKAEMIA$",total_cancer$indi_pt),]
head(acu)
length(unique(acu$caseid))
nrow(acu)


gas<-total_cancer[grep("^GASTRIC CANCER$",total_cancer$indi_pt),]
head(gas)
length(unique(gas$caseid))
nrow(gas)


mye<-total_cancer[grep("^MYELODYSPLASTIC SYNDROME$",total_cancer$indi_pt),]
head(mye)
length(unique(mye$caseid))
nrow(mye)

mye<-total_cancer[grep("^MYELODYSPLASTIC SYNDROME$",total_cancer$indi_pt),]
head(mye)
length(unique(mye$caseid))
nrow(mye)

oes<-total_cancer[grep("^OESOPHAGEAL CARCINOMA$",total_cancer$indi_pt),]
head(oes)
length(unique(oes$caseid))
nrow(oes)



thy<-total_cancer[grep("^THYROID GLAND CANCER$",total_cancer$indi_pt),]
head(thy)
length(unique(thy$caseid))
nrow(thy)





