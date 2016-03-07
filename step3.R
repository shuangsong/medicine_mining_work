#step 3
rm(list=ls())
gc()
#get the frequency and percentage of drugnames for each cancer indication.

#use new.csv (contain unique caseid 5938016)

whole<-read.csv("E:/data/new.csv")  
head(whole)
length(unique(whole$caseid))

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

whole$indi_pt<-toupper(whole$indi_pt) 
total_cancer<-whole[grep("^MULTIPLE MYELOMA$|^LYMPHOMA$|^BREAST CANCER$|^RENAL CELL CARCINOMA$|^LUNG CANCER$|
^CHRONIC MYELOID LEUKAEMIA$|^ACUTE MYELOID LEUKAEMIA$|^ACUTE LYMPHOCYTIC LEUKAEMIA$|^GASTRIC CANCER$|
                        ^COLORECTAL CANCER$|^OESOPHAGEAL CARCINOMA$|^MYELODYSPLASTIC SYNDROME$|^THYROID GLAND CANCER$", whole$indi_pt),]

head(total_cancer) 
nrow(total_cancer)

length(unique(total_cancer$caseid))
nrow(total_cancer)


library(plyr) # package to manage data
#1 multiple myeloma
mul<-total_cancer[grep("^MULTIPLE MYELOMA$",total_cancer$indi_pt),]
head(mul)
length(unique(mul$caseid))
#count drugname frequency in mul:
count(mul,'drugname')
save1<-count(mul,'drugname')
write.csv(save1, "E:/data/save1.csv", row.names= FALSE)


#2 lymphoma
lym<-total_cancer[grep("^LYMPHOMA$",total_cancer$indi_pt),]
head(lym)
#count drugname frequency in mul:
count(lym,'drugname')
save2<-count(lym,'drugname')
write.csv(save2, "E:/data/save2.csv", row.names= FALSE)


#3 breast cancer
bre<-total_cancer[grep("^BREAST CANCER$",total_cancer$indi_pt),]
head(bre)
length(unique(bre$caseid))
#count frequency:
save3<-count(bre, 'drugname')
write.csv(save3, "E:/data/save3.csv", row.names=FALSE)


#4 renal cell carcinoma
ren<-total_cancer[grep("^RENAL CELL CARCINOMA$",total_cancer$indi_pt),]
head(ren)
length(unique(ren$caseid))
#count drugname frequency in mul:
save4<-count(ren,'drugname')
write.csv(save4, "E:/data/save4.csv", row.names= FALSE)

#5 lung cancer:
lun<-total_cancer[grep("^LUNG CANCER$",total_cancer$indi_pt),]
head(lun)
length(unique(lun$caseid))
save5<-count(lun,'drugname')
write.csv(save5, "E:/data/save5.csv", row.names= FALSE)

#6 chronic myeloid leukamemia
chr<-total_cancer[grep("^CHRONIC MYELOID LEUKAEMIA$",total_cancer$indi_pt),]
head(chr)
length(unique(chr$caseid))
save6<-count(chr,'drugname')
write.csv(save6, "E:/data/save6.csv", row.names= FALSE)

#7 acute myeloid leukaemia
acute<-total_cancer[grep("^ACUTE MYELOID LEUKAEMIA$",total_cancer$indi_pt),]
head(acute)
length(unique(acute$caseid))
save7<-count(acute,'drugname')
write.csv(save7, "E:/data/save7.csv", row.names= FALSE)

#8acute lymphocytic leukaemia
acu<-total_cancer[grep("^ACUTE LYMPHOCYTIC LEUKAEMIA$",total_cancer$indi_pt),]
head(acu)
length(unique(acu$caseid))
save8<-count(acu,'drugname')
write.csv(save8, "E:/data/save8.csv", row.names= FALSE)

#9gastric cancer
gas<-total_cancer[grep("^GASTRIC CANCER$",total_cancer$indi_pt),]
head(gas)
length(unique(gas$caseid))
save9<-count(gas,'drugname')
write.csv(save9, "E:/data/save9.csv", row.names= FALSE)

#10 colorectal cancer
col<-total_cancer[grep("^COLORECTAL CANCER$",total_cancer$indi_pt),]
head(col)
length(unique(col$caseid))
save10<-count(col,'drugname')
write.csv(save10, "E:/data/save10.csv", row.names= FALSE)

#11oesophageal carcinoma
oes<-total_cancer[grep("^OESOPHAGEAL CARCINOMA$",total_cancer$indi_pt),]
head(oes)
length(unique(oes$caseid))
save11<-count(oes,'drugname')
write.csv(save11, "E:/data/save11.csv", row.names= FALSE)


#12 myelodysplastic syndrome
mye<-total_cancer[grep("^MYELODYSPLASTIC SYNDROME$",total_cancer$indi_pt),]
head(mye)
length(unique(mye$caseid))
save12<-count(mye,'drugname')
write.csv(save12, "E:/data/save12.csv", row.names= FALSE)



#13 thyroid gland cancer
thy<-total_cancer[grep("^THYROID GLAND CANCER$",total_cancer$indi_pt),]
head(thy)
length(unique(thy$caseid))
save13<-count(thy,'drugname')
write.csv(save13, "E:/data/save13.csv", row.names= FALSE)







