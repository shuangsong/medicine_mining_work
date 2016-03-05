#search cardiomyopathy
# ^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$



#04q1
rm(list=ls())
setwd("")
reac_data<-read.table("E:/data/original/2004q1/REAC04Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT) #change pt to upper case so as easier to search cardiomyopathy

drug_data<-read.table("E:/data/original/2004q1/DRUG04Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data1<-merge(drug_data, reac_data, by="ISR")
data1[is.na(data1)]<-NA
data1$DRUGNAME<-toupper(data1$DRUGNAME)
data1<-data1[,c(1,2,4,13)]
find1<-data1[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                  ", data1$PT),]
head(data1)

demo_data<-read.table("E:/data/original/2004q1/DEMO04Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2004q1/INDI04Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)

data2<-merge(demo_data, indi_data, by="ISR")
data2[is.na(data2)]<-NA
data2<-data2[,c(1,12,13,14,25)]
data2$INDI_PT<-toupper(data2$INDI_PT)
finalMerge_1<-merge(find1, data2, by="ISR",all = TRUE)
head(finalMerge_1)
df_1<-data.frame(finalMerge_1)
quarter<-rep("04q1", nrow(df_1))
df_1<-cbind(df_1, quarter)
head(df_1)



#04q2

reac_data<-read.table("E:/data/original/2004q2/REAC04Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2004q2/DRUG04Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data3<-merge(drug_data, reac_data, by="ISR")
data3[is.na(data3)]<-NA
data3$DRUGNAME<-toupper(data3$DRUGNAME)
data3<-data3[,c(1,2,4,13)]
find2<-data3[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                  ", data3$PT),]
head(data3)

demo_data<-read.table("E:/data/original/2004q2/DEMO04Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2004q2/INDI04Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data4<-merge(demo_data, indi_data, by="ISR")
data4[is.na(data4)]<-NA
data4<-data4[,c(1,12,13,14,25)]
data4$INDI_PT<-toupper(data4$INDI_PT)
finalMerge_2<-merge(find2, data4, by="ISR",all=TRUE)
head(finalMerge_2)
df_2<-data.frame(finalMerge_2)
quarter<-rep("04q2", nrow(df_2))
df_2<-cbind(df_2, quarter)
head(df_2)


#04q3

reac_data<-read.table("E:/data/original/2004q3/REAC04Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2004q3/DRUG04Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data5<-merge(drug_data, reac_data, by="ISR")
data5[is.na(data5)]<-NA
data5$DRUGNAME<-toupper(data5$DRUGNAME)
data5<-data5[,c(1,2,4,13)]
find3<-data5[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                  ", data5$PT),]
head(data5)

demo_data<-read.table("E:/data/original/2004q3/DEMO04Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2004q3/INDI04Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data6<-merge(demo_data, indi_data, by="ISR")
data6[is.na(data6)]<-NA
data6<-data6[,c(1,12,13,14,25)]
data6$INDI_PT<-toupper(data6$INDI_PT)
finalMerge_3<-merge(find3, data6, by="ISR",all=TRUE)
head(finalMerge_3)
df_3<-data.frame(finalMerge_3)
quarter<-rep("04q3", nrow(df_3))
df_3<-cbind(df_3, quarter)
head(df_3)

#04q4

reac_data<-read.table("E:/data/original/2004q4/REAC04Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2004q4/DRUG04Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data7<-merge(drug_data, reac_data, by="ISR")
data7[is.na(data7)]<-NA
data7$DRUGNAME<-toupper(data7$DRUGNAME)
data7<-data7[,c(1,2,4,13)]
find4<-data7[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                  ", data7$PT),]
head(data7)

demo_data<-read.table("E:/data/original/2004q4/DEMO04Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2004q4/INDI04Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data8<-merge(demo_data, indi_data, by="ISR")
data8[is.na(data8)]<-NA
data8<-data8[,c(1,12,13,14,25)]
data8$INDI_PT<-toupper(data8$INDI_PT)
finalMerge_4<-merge(find4, data8, by="ISR",all=TRUE)
head(finalMerge_4)
df_4<-data.frame(finalMerge_4)
quarter<-rep("04q4", nrow(df_4))
df_4<-cbind(df_4, quarter)
head(df_4)

#05q1
reac_data<-read.table("E:/data/original/2005q1/REAC05Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2005q1/DRUG05Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data9<-merge(drug_data, reac_data, by="ISR")
data9[is.na(data9)]<-NA
data9$DRUGNAME<-toupper(data9$DRUGNAME)
data9<-data9[,c(1,2,4,13)]
find5<-data9[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                  ", data9$PT),]
head(data9)

demo_data<-read.table("E:/data/original/2005q1/DEMO05Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2005q1/INDI05Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data10<-merge(demo_data, indi_data, by="ISR")
data10[is.na(data10)]<-NA
data10<-data10[,c(1,12,13,14,25)]
data10$INDI_PT<-toupper(data10$INDI_PT)
finalMerge_5<-merge(find5, data10, by="ISR",all=TRUE)
head(finalMerge_5)
df_5<-data.frame(finalMerge_5)
quarter<-rep("05q1", nrow(df_5))
df_5<-cbind(df_5, quarter)
head(df_5)
#05q2
reac_data<-read.table("E:/data/original/2005q2/REAC05Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2005q2/DRUG05Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data11<-merge(drug_data, reac_data, by="ISR")
data11[is.na(data11)]<-NA
data11$DRUGNAME<-toupper(data11$DRUGNAME)
data11<-data11[,c(1,2,4,13)]
find6<-data11[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                   ", data11$PT),]
head(data11)

demo_data<-read.table("E:/data/original/2005q2/DEMO05Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2005q2/INDI05Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data12<-merge(demo_data, indi_data, by="ISR")
data12[is.na(data12)]<-NA
data12<-data12[,c(1,12,13,14,25)]
data12$INDI_PT<-toupper(data12$INDI_PT)
finalMerge_6<-merge(find6, data12, by="ISR",all=TRUE)
head(finalMerge_6)
df_6<-data.frame(finalMerge_6)
quarter<-rep("05q2", nrow(df_6))
df_6<-cbind(df_6, quarter)
head(df_6)
#05q3
reac_data<-read.table("E:/data/original/2005q3/REAC05Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2005q3/DRUG05Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data13<-merge(drug_data, reac_data, by="ISR")
data13[is.na(data13)]<-NA
data13$DRUGNAME<-toupper(data13$DRUGNAME)
data13<-data13[,c(1,2,4,13)]
find7<-data13[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                   ", data13$PT),]
head(data13)

demo_data<-read.table("E:/data/original/2005q3/DEMO05Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2005q3/INDI05Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data14<-merge(demo_data, indi_data, by="ISR")
data14[is.na(data14)]<-NA
data14<-data14[,c(1,12,13,14,25)]
data14$INDI_PT<-toupper(data14$INDI_PT)
finalMerge_7<-merge(find7, data14, by="ISR",all=TRUE)
head(finalMerge_7)
df_7<-data.frame(finalMerge_7)
quarter<-rep("05q3", nrow(df_7))
df_7<-cbind(df_7, quarter)
head(df_7)
#05q4
reac_data<-read.table("E:/data/original/2005q4/REAC05Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2005q4/DRUG05Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data15<-merge(drug_data, reac_data, by="ISR")
data15[is.na(data15)]<-NA
data15$DRUGNAME<-toupper(data15$DRUGNAME)
data15<-data15[,c(1,2,4,13)]
find8<-data15[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                   ", data15$PT),]
head(data15)

demo_data<-read.table("E:/data/original/2005q4/DEMO05Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2005q4/INDI05Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data16<-merge(demo_data, indi_data, by="ISR")
data16[is.na(data16)]<-NA
data16<-data16[,c(1,12,13,14,25)]
data16$INDI_PT<-toupper(data16$INDI_PT)
finalMerge_8<-merge(find8, data16, by="ISR",all=TRUE)
head(finalMerge_8)
df_8<-data.frame(finalMerge_8)
quarter<-rep("05q4", nrow(df_8))
df_8<-cbind(df_8, quarter)
head(df_8)

#06q1
reac_data<-read.table("E:/data/original/2006q1/REAC06Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2006q1/DRUG06Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data17<-merge(drug_data, reac_data, by="ISR")
data17[is.na(data17)]<-NA
data17$DRUGNAME<-toupper(data17$DRUGNAME)
data17<-data17[,c(1,2,4,13)]
find9<-data17[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                   ", data17$PT),]
head(data17)

demo_data<-read.table("E:/data/original/2006q1/DEMO06Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2006q1/INDI06Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data18<-merge(demo_data, indi_data, by="ISR")
data18[is.na(data18)]<-NA
data18<-data18[,c(1,12,13,14,25)]
data18$INDI_PT<-toupper(data18$INDI_PT)
finalMerge_9<-merge(find9, data18, by="ISR",all=TRUE)
head(finalMerge_9)
df_9<-data.frame(finalMerge_9)
quarter<-rep("06q1", nrow(df_9))
df_9<-cbind(df_9, quarter)
head(df_9)
#06q2
reac_data<-read.table("E:/data/original/2006q2/REAC06Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2006q2/DRUG06Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data19<-merge(drug_data, reac_data, by="ISR")
data19[is.na(data19)]<-NA
data19$DRUGNAME<-toupper(data19$DRUGNAME)
data19<-data19[,c(1,2,4,13)]
find10<-data19[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data19$PT),]
head(data19)

demo_data<-read.table("E:/data/original/2006q2/DEMO06Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2006q2/INDI06Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data20<-merge(demo_data, indi_data, by="ISR")
data20[is.na(data20)]<-NA
data20<-data20[,c(1,12,13,14,25)]
data20$INDI_PT<-toupper(data20$INDI_PT)
finalMerge_10<-merge(find10, data20, by="ISR",all=TRUE)
head(finalMerge_10)
df_10<-data.frame(finalMerge_10)
quarter<-rep("06q2", nrow(df_10))
df_10<-cbind(df_10, quarter)
head(df_10)
#06q3
reac_data<-read.table("E:/data/original/2006q3/REAC06Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2006q3/DRUG06Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data21<-merge(drug_data, reac_data, by="ISR")
data21[is.na(data21)]<-NA
data21$DRUGNAME<-toupper(data21$DRUGNAME)
data21<-data21[,c(1,2,4,13)]
find11<-data21[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data21$PT),]
head(data21)

demo_data<-read.table("E:/data/original/2006q3/DEMO06Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2006q3/INDI06Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data22<-merge(demo_data, indi_data, by="ISR")
data22[is.na(data22)]<-NA
data22<-data22[,c(1,12,13,14,25)]
data22$INDI_PT<-toupper(data22$INDI_PT)
finalMerge_11<-merge(find11, data22, by="ISR",all=TRUE)
head(finalMerge_11)
df_11<-data.frame(finalMerge_11)
quarter<-rep("06q3", nrow(df_11))
df_11<-cbind(df_11, quarter)
head(df_11)
#06q4
reac_data<-read.table("E:/data/original/2006q4/REAC06Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2006q4/DRUG06Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data23<-merge(drug_data, reac_data, by="ISR")
data23[is.na(data23)]<-NA
data23$DRUGNAME<-toupper(data23$DRUGNAME)
data23<-data23[,c(1,2,4,13)]
find12<-data23[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data23$PT),]
head(data23)

demo_data<-read.table("E:/data/original/2006q4/DEMO06Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2006q4/INDI06Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data24<-merge(demo_data, indi_data, by="ISR")
data24[is.na(data24)]<-NA
data24<-data24[,c(1,12,13,14,25)]
data24$INDI_PT<-toupper(data24$INDI_PT)
finalMerge_12<-merge(find12, data24, by="ISR",all=TRUE)
head(finalMerge_12)
df_12<-data.frame(finalMerge_12)
quarter<-rep("06q4", nrow(df_12))
df_12<-cbind(df_12, quarter)
head(df_12)
#07q1
reac_data<-read.table("E:/data/original/2007q1/REAC07Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2007q1/DRUG07Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data25<-merge(drug_data, reac_data, by="ISR")
data25[is.na(data25)]<-NA
data25$DRUGNAME<-toupper(data25$DRUGNAME)
data25<-data25[,c(1,2,4,13)]
find13<-data25[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data25$PT),]
head(data25)

demo_data<-read.table("E:/data/original/2007q1/DEMO07Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2007q1/INDI07Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data26<-merge(demo_data, indi_data, by="ISR")
data26[is.na(data26)]<-NA
data26<-data26[,c(1,12,13,14,25)]
data26$INDI_PT<-toupper(data26$INDI_PT)
finalMerge_13<-merge(find13, data26, by="ISR",all=TRUE)
head(finalMerge_13)
df_13<-data.frame(finalMerge_13)
quarter<-rep("07q1", nrow(df_13))
df_13<-cbind(df_13, quarter)
head(df_13)
#07q2
reac_data<-read.table("E:/data/original/2007q2/REAC07Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2007q2/DRUG07Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data27<-merge(drug_data, reac_data, by="ISR")
data27[is.na(data27)]<-NA
data27$DRUGNAME<-toupper(data27$DRUGNAME)
data27<-data27[,c(1,2,4,13)]
find14<-data27[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data27$PT),]
head(data27)

demo_data<-read.table("E:/data/original/2007q2/DEMO07Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2007q2/INDI07Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data28<-merge(demo_data, indi_data, by="ISR")
data28[is.na(data28)]<-NA
data28<-data28[,c(1,12,13,14,25)]
data28$INDI_PT<-toupper(data28$INDI_PT)
finalMerge_14<-merge(find14, data28, by="ISR",all=TRUE)
head(finalMerge_14)
df_14<-data.frame(finalMerge_14)
quarter<-rep("07q2", nrow(df_14))
df_14<-cbind(df_14, quarter)
head(df_14)
#07q3
reac_data<-read.table("E:/data/original/2007q3/REAC07Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2007q3/DRUG07Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data29<-merge(drug_data, reac_data, by="ISR")
data29[is.na(data29)]<-NA
data29$DRUGNAME<-toupper(data29$DRUGNAME)
data29<-data29[,c(1,2,4,13)]
find15<-data29[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data29$PT),]
head(data29)

demo_data<-read.table("E:/data/original/2007q3/DEMO07Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2007q3/INDI07Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data30<-merge(demo_data, indi_data, by="ISR")
data30[is.na(data30)]<-NA
data30<-data30[,c(1,12,13,14,25)]
data30$INDI_PT<-toupper(data30$INDI_PT)
finalMerge_15<-merge(find15, data30, by="ISR",all=TRUE)
head(finalMerge_15)
df_15<-data.frame(finalMerge_15)
quarter<-rep("07q3", nrow(df_15))
df_15<-cbind(df_15, quarter)
head(df_15)
#07q4
reac_data<-read.table("E:/data/original/2007q4/REAC07Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2007q4/DRUG07Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data31<-merge(drug_data, reac_data, by="ISR")
data31[is.na(data31)]<-NA
data31$DRUGNAME<-toupper(data31$DRUGNAME)
data31<-data31[,c(1,2,4,13)]
find16<-data31[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data31$PT),]
head(data31)

demo_data<-read.table("E:/data/original/2007q4/DEMO07Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2007q4/INDI07Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data32<-merge(demo_data, indi_data, by="ISR")
data32[is.na(data32)]<-NA
data32<-data32[,c(1,12,13,14,25)]
data32$INDI_PT<-toupper(data32$INDI_PT)
finalMerge_16<-merge(find16, data32, by="ISR",all=TRUE)
head(finalMerge_16)
df_16<-data.frame(finalMerge_16)
quarter<-rep("07q4", nrow(df_16))
df_16<-cbind(df_16, quarter)
head(df_16)
#08q1
reac_data<-read.table("E:/data/original/2008q1/REAC08Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2008q1/DRUG08Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data33<-merge(drug_data, reac_data, by="ISR")
data33[is.na(data33)]<-NA
data33$DRUGNAME<-toupper(data33$DRUGNAME)
data33<-data33[,c(1,2,4,13)]
find17<-data33[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data33$PT),]
head(data33)

demo_data<-read.table("E:/data/original/2008q1/DEMO08Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2008q1/INDI08Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data34<-merge(demo_data, indi_data, by="ISR")
data34[is.na(data34)]<-NA
data34<-data34[,c(1,12,13,14,25)]
data34$INDI_PT<-toupper(data34$INDI_PT)
finalMerge_17<-merge(find17, data34, by="ISR",all=TRUE)
head(finalMerge_17)
df_17<-data.frame(finalMerge_17)
quarter<-rep("08q1", nrow(df_17))
df_17<-cbind(df_17, quarter)
head(df_17)
#08q2
reac_data<-read.table("E:/data/original/2008q2/REAC08Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2008q2/DRUG08Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data35<-merge(drug_data, reac_data, by="ISR")
data35[is.na(data35)]<-NA
data35$DRUGNAME<-toupper(data35$DRUGNAME)
data35<-data35[,c(1,2,4,13)]
find18<-data35[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data35$PT),]
head(data35)

demo_data<-read.table("E:/data/original/2008q2/DEMO08Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2008q2/INDI08Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data36<-merge(demo_data, indi_data, by="ISR")
data36[is.na(data36)]<-NA
data36<-data36[,c(1,12,13,14,25)]
data36$INDI_PT<-toupper(data36$INDI_PT)
finalMerge_18<-merge(find18, data36, by="ISR",all=TRUE)
head(finalMerge_18)
df_18<-data.frame(finalMerge_18)
quarter<-rep("08q2", nrow(df_18))
df_18<-cbind(df_18, quarter)
head(df_18)
#08q3
reac_data<-read.table("E:/data/original/2008q3/REAC08Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2008q3/DRUG08Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data37<-merge(drug_data, reac_data, by="ISR")
data37[is.na(data37)]<-NA
data37$DRUGNAME<-toupper(data37$DRUGNAME)
data37<-data37[,c(1,2,4,13)]
find19<-data37[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data37$PT),]
head(data37)

demo_data<-read.table("E:/data/original/2008q3/DEMO08Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2008q3/INDI08Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data38<-merge(demo_data, indi_data, by="ISR")
data38[is.na(data38)]<-NA
data38<-data38[,c(1,12,13,14,25)]
data38$INDI_PT<-toupper(data38$INDI_PT)
finalMerge_19<-merge(find19, data38, by="ISR",all=TRUE)
head(finalMerge_19)
df_19<-data.frame(finalMerge_19)
quarter<-rep("08q3", nrow(df_19))
df_19<-cbind(df_19, quarter)
head(df_19)
#08q4
reac_data<-read.table("E:/data/original/2008q4/REAC08Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2008q4/DRUG08Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data39<-merge(drug_data, reac_data, by="ISR")
data39[is.na(data39)]<-NA
data39$DRUGNAME<-toupper(data39$DRUGNAME)
data39<-data39[,c(1,2,4,13)]
find20<-data39[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data39$PT),]
head(data39)

demo_data<-read.table("E:/data/original/2008q4/DEMO08Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2008q4/INDI08Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data40<-merge(demo_data, indi_data, by="ISR")
data40[is.na(data40)]<-NA
data40<-data40[,c(1,12,13,14,25)]
data40$INDI_PT<-toupper(data40$INDI_PT)
finalMerge_20<-merge(find20, data40, by="ISR",all=TRUE)
head(finalMerge_20)
df_20<-data.frame(finalMerge_20)
quarter<-rep("08q4", nrow(df_20))
df_20<-cbind(df_20, quarter)
head(df_20)
#09q1
reac_data<-read.table("E:/data/original/2009q1/REAC09Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2009q1/DRUG09Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data41<-merge(drug_data, reac_data, by="ISR")
data41[is.na(data41)]<-NA
data41$DRUGNAME<-toupper(data41$DRUGNAME)
data41<-data41[,c(1,2,4,13)]
find21<-data41[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data41$PT),]
head(data41)

demo_data<-read.table("E:/data/original/2009q1/DEMO09Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2009q1/INDI09Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data42<-merge(demo_data, indi_data, by="ISR")
data42[is.na(data42)]<-NA
data42<-data42[,c(1,12,13,14,25)]
data42$INDI_PT<-toupper(data42$INDI_PT)
finalMerge_21<-merge(find21, data42, by="ISR",all=TRUE)
head(finalMerge_21)
df_21<-data.frame(finalMerge_21)
quarter<-rep("09q1", nrow(df_21))
df_21<-cbind(df_21, quarter)
head(df_21)
#09q2
reac_data<-read.table("E:/data/original/2009q2/REAC09Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2009q2/DRUG09Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data43<-merge(drug_data, reac_data, by="ISR")
data43[is.na(data43)]<-NA
data43$DRUGNAME<-toupper(data43$DRUGNAME)
data43<-data43[,c(1,2,4,13)]
find22<-data43[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data43$PT),]
head(data43)

demo_data<-read.table("E:/data/original/2009q2/DEMO09Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2009q2/INDI09Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data44<-merge(demo_data, indi_data, by="ISR")
data44[is.na(data44)]<-NA
data44<-data44[,c(1,12,13,14,25)]
data44$INDI_PT<-toupper(data44$INDI_PT)
finalMerge_22<-merge(find22, data44, by="ISR",all=TRUE)
head(finalMerge_22)
df_22<-data.frame(finalMerge_22)
quarter<-rep("09q2", nrow(df_22))
df_22<-cbind(df_22, quarter)
head(df_22)
#09q3
reac_data<-read.table("E:/data/original/2009q3/REAC09Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2009q3/DRUG09Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data45<-merge(drug_data, reac_data, by="ISR")
data45[is.na(data45)]<-NA
data45$DRUGNAME<-toupper(data45$DRUGNAME)
data45<-data45[,c(1,2,4,13)]
find23<-data45[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data45$PT),]
head(data45)

demo_data<-read.table("E:/data/original/2009q3/DEMO09Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2009q3/INDI09Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data46<-merge(demo_data, indi_data, by="ISR")
data46[is.na(data46)]<-NA
data46<-data46[,c(1,12,13,14,25)]
data46$INDI_PT<-toupper(data46$INDI_PT)
finalMerge_23<-merge(find23, data46, by="ISR",all=TRUE)
head(finalMerge_23)
df_23<-data.frame(finalMerge_23)
quarter<-rep("09q3", nrow(df_23))
df_23<-cbind(df_23, quarter)
head(df_23)
#09q4
reac_data<-read.table("E:/data/original/2009q4/REAC09Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2009q4/DRUG09Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data47<-merge(drug_data, reac_data, by="ISR")
data47[is.na(data47)]<-NA
data47$DRUGNAME<-toupper(data47$DRUGNAME)
data47<-data47[,c(1,2,4,13)]
find24<-data47[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data47$PT),]
head(data47)

demo_data<-read.table("E:/data/original/2009q4/DEMO09Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2009q4/INDI09Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data48<-merge(demo_data, indi_data, by="ISR")
data48[is.na(data48)]<-NA
data48<-data48[,c(1,12,13,14,25)]
data48$INDI_PT<-toupper(data48$INDI_PT)
finalMerge_24<-merge(find24, data48, by="ISR",all=TRUE)
head(finalMerge_24)
df_24<-data.frame(finalMerge_24)
quarter<-rep("09q4", nrow(df_24))
df_24<-cbind(df_24, quarter)
head(df_24)
#10q1
reac_data<-read.table("E:/data/original/2010q1/REAC10Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2010q1/DRUG10Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data49<-merge(drug_data, reac_data, by="ISR")
data49[is.na(data49)]<-NA
data49$DRUGNAME<-toupper(data49$DRUGNAME)
data49<-data49[,c(1,2,4,13)]
find25<-data49[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data49$PT),]
head(data49)

demo_data<-read.table("E:/data/original/2010q1/DEMO10Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2010q1/INDI10Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data50<-merge(demo_data, indi_data, by="ISR")
data50[is.na(data50)]<-NA
data50<-data50[,c(1,12,13,14,25)]
data50$INDI_PT<-toupper(data50$INDI_PT)
finalMerge_25<-merge(find25, data50, by="ISR",all=TRUE)
head(finalMerge_50)
df_25<-data.frame(finalMerge_25)
quarter<-rep("10q1", nrow(df_25))
df_25<-cbind(df_25, quarter)
head(df_25)
#10q2
reac_data<-read.table("E:/data/original/2010q2/REAC10Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2010q2/DRUG10Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data51<-merge(drug_data, reac_data, by="ISR")
data51[is.na(data51)]<-NA
data51$DRUGNAME<-toupper(data51$DRUGNAME)
data51<-data51[,c(1,2,4,13)]
find26<-data51[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data51$PT),]
head(data51)

demo_data<-read.table("E:/data/original/2010q2/DEMO10Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2010q2/INDI10Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data52<-merge(demo_data, indi_data, by="ISR")
data52[is.na(data52)]<-NA
data52<-data52[,c(1,12,13,14,25)]
data52$INDI_PT<-toupper(data52$INDI_PT)
finalMerge_26<-merge(find26, data52, by="ISR",all=TRUE)
head(finalMerge_26)
df_26<-data.frame(finalMerge_26)
quarter<-rep("10q2", nrow(df_26))
df_26<-cbind(df_26, quarter)
head(df_26)
#10q3
reac_data<-read.table("E:/data/original/2010q3/REAC10Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2010q3/DRUG10Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data53<-merge(drug_data, reac_data, by="ISR")
data53[is.na(data53)]<-NA
data53$DRUGNAME<-toupper(data53$DRUGNAME)
data53<-data53[,c(1,2,4,13)]
find27<-data53[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data53$PT),]
head(data53)

demo_data<-read.table("E:/data/original/2010q3/DEMO10Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2010q3/INDI10Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data54<-merge(demo_data, indi_data, by="ISR")
data54[is.na(data54)]<-NA
data54<-data54[,c(1,12,13,14,25)]
data54$INDI_PT<-toupper(data54$INDI_PT)
finalMerge_27<-merge(find27, data54, by="ISR",all=TRUE)
head(finalMerge_27)
df_27<-data.frame(finalMerge_27)
quarter<-rep("10q3", nrow(df_27))
df_27<-cbind(df_27, quarter)
head(df_27)
#10q4
reac_data<-read.table("E:/data/original/2010q4/REAC10Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2010q4/DRUG10Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data55<-merge(drug_data, reac_data, by="ISR")
data55[is.na(data55)]<-NA
data55$DRUGNAME<-toupper(data55$DRUGNAME)
data55<-data55[,c(1,2,4,13)]
find28<-data55[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data55$PT),]
head(data55)

demo_data<-read.table("E:/data/original/2010q4/DEMO10Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2010q4/INDI10Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data56<-merge(demo_data, indi_data, by="ISR")
data56[is.na(data56)]<-NA
data56<-data56[,c(1,12,13,14,25)]
data56$INDI_PT<-toupper(data56$INDI_PT)
finalMerge_28<-merge(find28, data56, by="ISR",all=TRUE)
head(finalMerge_28)
df_28<-data.frame(finalMerge_28)
quarter<-rep("10q4", nrow(df_28))
df_28<-cbind(df_28, quarter)
head(df_28)
#11q1
reac_data<-read.table("E:/data/original/2011q1/REAC11Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2011q1/DRUG11Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data57<-merge(drug_data, reac_data, by="ISR")
data57[is.na(data57)]<-NA
data57$DRUGNAME<-toupper(data57$DRUGNAME)
data57<-data57[,c(1,2,4,13)]
find29<-data57[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data57$PT),]
head(data57)

demo_data<-read.table("E:/data/original/2011q1/DEMO11Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2011q1/INDI11Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data58<-merge(demo_data, indi_data, by="ISR")
data58[is.na(data58)]<-NA
data58<-data58[,c(1,12,13,14,25)]
data58$INDI_PT<-toupper(data58$INDI_PT)
finalMerge_29<-merge(find29, data58, by="ISR",all=TRUE)
head(finalMerge_29)
df_29<-data.frame(finalMerge_29)
quarter<-rep("11q1", nrow(df_29))
df_29<-cbind(df_29, quarter)
head(df_29)
#11q2
reac_data<-read.table("E:/data/original/2011q2/REAC11Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2011q2/DRUG11Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data59<-merge(drug_data, reac_data, by="ISR")
data59[is.na(data59)]<-NA
data59$DRUGNAME<-toupper(data59$DRUGNAME)
data59<-data59[,c(1,2,4,13)]
find30<-data59[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data59$PT),]
head(data59)

demo_data<-read.table("E:/data/original/2011q2/DEMO11Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2011q2/INDI11Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data60<-merge(demo_data, indi_data, by="ISR")
data60[is.na(data60)]<-NA
data60<-data60[,c(1,12,13,14,25)]
data60$INDI_PT<-toupper(data60$INDI_PT)
finalMerge_30<-merge(find30, data60, by="ISR",all=TRUE)
head(finalMerge_30)
df_30<-data.frame(finalMerge_30)
quarter<-rep("11q2", nrow(df_30))
df_30<-cbind(df_30, quarter)
head(df_30)
#11q3
reac_data<-read.table("E:/data/original/2011q3/REAC11Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2011q3/DRUG11Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data61<-merge(drug_data, reac_data, by="ISR")
data61[is.na(data61)]<-NA
data61$DRUGNAME<-toupper(data61$DRUGNAME)
data61<-data61[,c(1,2,4,13)]
find31<-data61[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data61$PT),]
head(data61)

demo_data<-read.table("E:/data/original/2011q3/DEMO11Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2011q3/INDI11Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data62<-merge(demo_data, indi_data, by="ISR")
data62[is.na(data62)]<-NA
data62<-data62[,c(1,12,13,14,25)]
data62$INDI_PT<-toupper(data62$INDI_PT)
finalMerge_31<-merge(find31, data62, by="ISR",all=TRUE)
head(finalMerge_31)
df_31<-data.frame(finalMerge_31)
quarter<-rep("11q3", nrow(df_31))
df_31<-cbind(df_31, quarter)
head(df_31)
#11q4
reac_data<-read.table("E:/data/original/2011q4/REAC11Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2011q4/DRUG11Q4.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data63<-merge(drug_data, reac_data, by="ISR")
data63[is.na(data63)]<-NA
data63$DRUGNAME<-toupper(data63$DRUGNAME)
data63<-data63[,c(1,2,4,13)]
find32<-data63[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data63$PT),]
head(data63)

demo_data<-read.table("E:/data/original/2011q4/DEMO11Q4.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2011q4/INDI11Q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data64<-merge(demo_data, indi_data, by="ISR")
data64[is.na(data64)]<-NA
data64<-data64[,c(1,12,13,14,25)]
data64$INDI_PT<-toupper(data64$INDI_PT)
finalMerge_32<-merge(find32, data64, by="ISR",all=TRUE)
head(finalMerge_32)
df_32<-data.frame(finalMerge_32)
quarter<-rep("11q4", nrow(df_32))
df_32<-cbind(df_32, quarter)
head(df_32)
#12q1
reac_data<-read.table("E:/data/original/2012q1/REAC12Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2012q1/DRUG12Q1.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data65<-merge(drug_data, reac_data, by="ISR")
data65[is.na(data65)]<-NA
data65$DRUGNAME<-toupper(data65$DRUGNAME)
data65<-data65[,c(1,2,4,13)]
find33<-data65[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data65$PT),]
head(data65)

demo_data<-read.table("E:/data/original/2012q1/DEMO12Q1.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2012q1/INDI12Q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data66<-merge(demo_data, indi_data, by="ISR")
data66[is.na(data66)]<-NA
data66<-data66[,c(1,12,13,14,25)]
data66$INDI_PT<-toupper(data66$INDI_PT)
finalMerge_33<-merge(find33, data66, by="ISR",all=TRUE)
head(finalMerge_33)
df_33<-data.frame(finalMerge_33)
quarter<-rep("12q1", nrow(df_33))
df_33<-cbind(df_33, quarter)
head(df_33)
#12q2
reac_data<-read.table("E:/data/original/2012q2/REAC12Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2012q2/DRUG12Q2.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data67<-merge(drug_data, reac_data, by="ISR")
data67[is.na(data67)]<-NA
data67$DRUGNAME<-toupper(data67$DRUGNAME)
data67<-data67[,c(1,2,4,13)]
find34<-data67[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data67$PT),]
head(data67)

demo_data<-read.table("E:/data/original/2012q2/DEMO12Q2.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2012q2/INDI12Q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data68<-merge(demo_data, indi_data, by="ISR")
data68[is.na(data68)]<-NA
data68<-data68[,c(1,12,13,14,25)]
data68$INDI_PT<-toupper(data68$INDI_PT)
finalMerge_34<-merge(find34, data68, by="ISR",all=TRUE)
head(finalMerge_34)
df_34<-data.frame(finalMerge_34)
quarter<-rep("12q2", nrow(df_34))
df_34<-cbind(df_34, quarter)
head(df_34)
#12q3
reac_data<-read.table("E:/data/original/2012q3/REAC12Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",stringsAsFactors=FALSE)
reac_data[,3]<-NULL
colnames(reac_data)<-c("ISR", "PT")
reac_data$PT<-toupper(reac_data$PT)

drug_data<-read.table("E:/data/original/2012q3/DRUG12Q3.txt",
                      header=FALSE,sep="$",fill=TRUE, na.strings="",quote="",
                      skip=1,stringsAsFactors=FALSE)
drug_data[,13]<-NULL
colnames(drug_data)<-c("ISR", "DRUG_SEQ", "ROLE_COD", "DRUGNAME", "VAL_VBM", 
                       "ROUTE", "DOSE_VBM", "DECHAL", 
                       "RECHAL", "LOT_NUM", "EXP_DT", "NDA_NUM")
data69<-merge(drug_data, reac_data, by="ISR")
data69[is.na(data69)]<-NA
data69$DRUGNAME<-toupper(data69$DRUGNAME)
data69<-data69[,c(1,2,4,13)]
find35<-data69[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data69$PT),]
head(data69)

demo_data<-read.table("E:/data/original/2012q3/DEMO12Q3.txt", 
                      header=FALSE,sep="$",fill=TRUE, na.strings="",skip=1,quote="",
                      comment.char="",stringsAsFactors=FALSE)
demo_data[,24]<-NULL
colnames(demo_data)<-c("ISR", "CASE", "I_F_COD", "FOLL_SEQ", "IMAGE", "EVENT_DT", "MFR_DT", "FDA_DT", 
                       "REPT_COD", "MFR_NUM", "MFR_SNDR", "AGE","AGE_COD","GNDR_COD","E_SUB","WT","WT_COD","REPT_DT","OCCP_COD","DEATH_DT",
                       "TO_MFR","CONFID","REPORTER_COUNTRY")
indi_data<-read.table("E:/data/original/2012q3/INDI12Q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",
                      comment.char="",stringsAsFactors=FALSE)


data70<-merge(demo_data, indi_data, by="ISR")
data70[is.na(data70)]<-NA
data70<-data70[,c(1,12,13,14,25)]
data70$INDI_PT<-toupper(data70$INDI_PT)
finalMerge_35<-merge(find35, data70, by="ISR",all=TRUE)
head(finalMerge_35)
df_35<-data.frame(finalMerge_35)
quarter<-rep("12q3", nrow(df_35))
df_35<-cbind(df_35, quarter)
head(df_35)




#combine df 1 to df 35 
case_1<-rbind(df_1,df_2,df_3,df_4,df_5,df_6,df_7,df_8,
              df_9,df_10,df_11,df_12,df_13,df_14,df_15,df_16, df_17, df_18, df_19,
              df_20, df_21, df_22,df_23, df_24, df_25, df_26, df_27, df_28, df_29,
              df_30, df_31, df_32, df_33, df_34, df_35)
head(case_1)
part1<-case_1[,c(1,2,3,4,5,6,7,8)]
head(part1)
names(part1)<-NULL
names(part1)<-c("caseid", "drug_seq","drugname","pt","age","age_cod","gndr_cod","indi_pt")
write.csv(part1, "E:/data/all1.csv",row.names=FALSE)


#_______________________________________________


#for 12q4 to 14q1 

#12q4
rm(list=ls())
reac_data<-read.table("E:/data/original/2012q4/reac12q4.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2012q4/drug12q4.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data71<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data71$drugname<-toupper(data71$drugname)
data71<-data71[,c(1,2,3,5,20)]
find36<-data71[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data71$pt),]
head(data71)

demo_data<-read.table("E:/data/original/2012q4/demo12q4.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2012q4/indi12q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data72<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data72<-data72[,c(1,2,12,13,14,24)]
data72$indi_pt<-toupper(data72$indi_pt)
finalMerge_36<-merge(find36, data72, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_36)
length(unique(finalMerge_36$caseid))
df_36<-data.frame(finalMerge_36)
quarter<-rep("12q4", nrow(df_36))
df_36<-cbind(df_36, quarter)
df_36<-df_36[,c(2,3,4,5,6,7,8,9)]
head(df_36)
#13q1
reac_data<-read.table("E:/data/original/2013q1/reac13q1.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2013q1/drug13q1.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data73<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data73$drugname<-toupper(data73$drugname)
data73<-data73[,c(1,2,3,5,20)]
find37<-data73[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data73$pt),]
head(data73)

demo_data<-read.table("E:/data/original/2013q1/demo13q1.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2013q1/indi13q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data74<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data74<-data74[,c(1,2,12,13,14,24)]
data74$indi_pt<-toupper(data74$indi_pt)
finalMerge_37<-merge(find37, data74, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_37)
length(unique(finalMerge_37$caseid))
df_37<-data.frame(finalMerge_37)
quarter<-rep("13q1", nrow(df_37))
df_37<-cbind(df_37, quarter)
df_37<-df_37[,c(2,3,4,5,6,7,8,9)]
head(df_37)

#13q2
reac_data<-read.table("E:/data/original/2013q2/reac13q2.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2013q2/drug13q2.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data75<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data75$drugname<-toupper(data75$drugname)
data75<-data75[,c(1,2,3,5,20)]
find38<-data75[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data75$pt),]
head(data75)

demo_data<-read.table("E:/data/original/2013q2/demo13q2.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2013q2/indi13q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data76<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data76<-data76[,c(1,2,12,13,14,24)]
data76$indi_pt<-toupper(data76$indi_pt)
finalMerge_38<-merge(find38, data76, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_38)
length(unique(finalMerge_38$caseid))
df_38<-data.frame(finalMerge_38)
quarter<-rep("13q2", nrow(df_38))
df_38<-cbind(df_38, quarter)
df_38<-df_38[,c(2,3,4,5,6,7,8,9)]
head(df_38)

#13q3
reac_data<-read.table("E:/data/original/2013q3/reac13q3.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2013q3/drug13q3.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data77<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data77$drugname<-toupper(data77$drugname)
data77<-data77[,c(1,2,3,5,20)]
find39<-data77[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data77$pt),]
head(data77)

demo_data<-read.table("E:/data/original/2013q3/demo13q3.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2013q3/indi13q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data78<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data78<-data78[,c(1,2,12,13,14,24)]
data78$indi_pt<-toupper(data78$indi_pt)
finalMerge_39<-merge(find39, data78, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_39)
length(unique(finalMerge_39$caseid))
df_39<-data.frame(finalMerge_39)
quarter<-rep("13q3", nrow(df_39))
df_39<-cbind(df_39, quarter)
df_39<-df_39[,c(2,3,4,5,6,7,8,9)]
head(df_39)
#13q4
reac_data<-read.table("E:/data/original/2013q4/reac13q4.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2013q4/drug13q4.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data79<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data79$drugname<-toupper(data79$drugname)
data79<-data79[,c(1,2,3,5,20)]
find40<-data79[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data79$pt),]
head(data79)

demo_data<-read.table("E:/data/original/2013q4/demo13q4.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2013q4/indi13q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data80<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data80<-data80[,c(1,2,12,13,14,24)]
data80$indi_pt<-toupper(data80$indi_pt)
finalMerge_40<-merge(find40, data80, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_40)
length(unique(finalMerge_40$caseid))
df_40<-data.frame(finalMerge_40)
quarter<-rep("13q4", nrow(df_40))
df_40<-cbind(df_40, quarter)
df_40<-df_40[,c(2,3,4,5,6,7,8,9)]
head(df_40)
#14q1
reac_data<-read.table("E:/data/original/2014q1/reac14q1.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2014q1/drug14q1.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data81<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data81$drugname<-toupper(data81$drugname)
data81<-data81[,c(1,2,3,5,20)]
find41<-data81[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data81$pt),]
head(data81)

demo_data<-read.table("E:/data/original/2014q1/demo14q1.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2014q1/indi14q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data82<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data82<-data82[,c(1,2,12,13,14,24)]
data82$indi_pt<-toupper(data82$indi_pt)
finalMerge_41<-merge(find41, data82, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_41)
length(unique(finalMerge_41$caseid))
df_41<-data.frame(finalMerge_41)
quarter<-rep("14q1", nrow(df_41))
df_41<-cbind(df_41, quarter)
df_41<-df_41[,c(2,3,4,5,6,7,8,9)]
head(df_41)
#14q2
reac_data<-read.table("E:/data/original/2014q2/reac14q2.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2014q2/drug14q2.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data83<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data83$drugname<-toupper(data83$drugname)
data83<-data83[,c(1,2,3,5,20)]
find42<-data83[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data83$pt),]
head(data83)

demo_data<-read.table("E:/data/original/2014q2/demo14q2.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2014q2/indi14q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data84<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data84<-data84[,c(1,2,12,13,14,24)]
data84$indi_pt<-toupper(data84$indi_pt)
finalMerge_42<-merge(find42, data84, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_42)
length(unique(finalMerge_42$caseid))
df_42<-data.frame(finalMerge_42)
quarter<-rep("14q2", nrow(df_42))
df_42<-cbind(df_42, quarter)
df_42<-df_42[,c(2,3,4,5,6,7,8,9)]
head(df_42)
#14q3
reac_data<-read.table("E:/data/original/2014q3/reac14q3.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2014q3/drug14q3.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data85<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data85$drugname<-toupper(data85$drugname)
data85<-data85[,c(1,2,3,5,21)]
find43<-data85[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data85$pt),]
head(data85)

demo_data<-read.table("E:/data/original/2014q3/demo14q3.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2014q3/indi14q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data86<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data86<-data86[,c(1,2,14,15,17,27)]
data86$indi_pt<-toupper(data86$indi_pt)
finalMerge_43<-merge(find43, data86, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_43)
length(unique(finalMerge_43$caseid))
df_43<-data.frame(finalMerge_43)
quarter<-rep("14q3", nrow(df_43))
df_43<-cbind(df_43, quarter)
names(df_43)<-NULL
names(df_43)<-c("primaryid","caseid","drug_seq","drugname", "pt","age","age_cod","gndr_cod","indi_pt","quarter")
df_43<-df_43[,c(2,3,4,5,6,7,8,9)]
head(df_43)
#14q4
reac_data<-read.table("E:/data/original/2014q4/reac14q4.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2014q4/drug14q4.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data87<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data87$drugname<-toupper(data87$drugname)
data87<-data87[,c(1,2,3,5,21)]
find44<-data87[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data87$pt),]
head(data87)

demo_data<-read.table("E:/data/original/2014q4/demo14q4.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2014q4/indi14q4.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data88<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data88<-data88[,c(1,2,14,15,17,27)]
data88$indi_pt<-toupper(data88$indi_pt)
finalMerge_44<-merge(find44, data88, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_44)
length(unique(finalMerge_44$caseid))
df_44<-data.frame(finalMerge_44)
quarter<-rep("14q4", nrow(df_44))
df_44<-cbind(df_44, quarter)
names(df_44)<-NULL
names(df_44)<-c("primaryid","caseid","drug_seq","drugname","pt","age","age_cod","gndr_cod","indi_pt","quarter")
df_44<-df_44[,c(2,3,4,5,6,7,8,9)]
head(df_44)
#15q1
reac_data<-read.table("E:/data/original/2015q1/reac15q1.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2015q1/drug15q1.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data89<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data89$drugname<-toupper(data89$drugname)
data89<-data89[,c(1,2,3,5,21)]
find45<-data89[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data89$pt),]
head(data89)

demo_data<-read.table("E:/data/original/2015q1/demo15q1.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2015q1/indi15q1.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data90<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data90<-data90[,c(1,2,14,15,17,27)]
data90$indi_pt<-toupper(data90$indi_pt)
finalMerge_45<-merge(find45, data90, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_45)
length(unique(finalMerge_45$caseid))
df_45<-data.frame(finalMerge_45)
quarter<-rep("15q1", nrow(df_45))
df_45<-cbind(df_45, quarter)
names(df_45)<-NULL
names(df_45)<-c("primaryid","caseid","drug_seq","drugname","pt","age","age_cod","gndr_cod","indi_pt","quarter")
df_45<-df_45[,c(2,3,4,5,6,7,8,9)]
head(df_45)
#15q2
reac_data<-read.table("E:/data/original/2015q2/reac15q2.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2015q2/drug15q2.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data91<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data91$drugname<-toupper(data91$drugname)
data91<-data91[,c(1,2,3,5,21)]
find46<-data91[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data91$pt),]
head(data91)

demo_data<-read.table("E:/data/original/2015q2/demo15q2.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2015q2/indi15q2.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data92<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data92<-data92[,c(1,2,14,15,17,27)]
data92$indi_pt<-toupper(data92$indi_pt)
finalMerge_46<-merge(find46, data92, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_46)
length(unique(finalMerge_46$caseid))
df_46<-data.frame(finalMerge_46)
quarter<-rep("15q2", nrow(df_46))
df_46<-cbind(df_46, quarter)
names(df_46)<-NULL
names(df_46)<-c("primaryid","caseid","drug_seq","drugname","pt","age","age_cod","gndr_cod","indi_pt","quarter")
df_46<-df_46[,c(2,3,4,5,6,7,8,9)]
head(df_46)
#15q3
reac_data<-read.table("E:/data/original/2015q3/reac15q3.txt",
                      header=TRUE,sep="$",quote="",stringsAsFactors=FALSE)
reac_data$pt<-toupper(reac_data$pt)


drug_data<-read.table("E:/data/original/2015q3/drug15q3.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
colnames(drug_data)[1]<-"primaryid"
data93<-merge(drug_data, reac_data, by=c("primaryid","caseid"))
data93$drugname<-toupper(data93$drugname)
data93<-data93[,c(1,2,3,5,21)]
find47<-data93[grep("^CARDIOMYOPATHY$|^ISCHAEMIC CARDIOMYOPATHY$|^CONGESTIVE CARDIOMYOPATHY$|^STRESS CARDIOMYOPATHY$|^HYPERTROPHIC CARDIOMYOPATHY$|^HYPERTENSIVE CARDIOMYOPATHY$|^CYTOTOXIC CARDIOMYOPATHY$|^VIRAL CARDIOMYOPATHY$|^CARDIOMYOPATHY ACUTE$
                    ", data93$pt),]
head(data93)

demo_data<-read.table("E:/data/original/2015q3/demo15q3.txt",
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
indi_data<-read.table("E:/data/original/2015q3/indi15q3.txt", 
                      header=TRUE,sep="$",fill=TRUE, na.strings="", quote="",comment.char="",stringsAsFactors=FALSE)
data94<-merge(demo_data, indi_data, by=c("primaryid","caseid"))
data94<-data94[,c(1,2,14,15,17,27)]
data94$indi_pt<-toupper(data94$indi_pt)
finalMerge_47<-merge(find47, data94, by=c("primaryid","caseid"),all=TRUE)
head(finalMerge_47)
length(unique(finalMerge_47$caseid))
df_47<-data.frame(finalMerge_47)
quarter<-rep("15q3", nrow(df_47))
df_47<-cbind(df_47, quarter)
names(df_47)<-NULL
names(df_47)<-c("primaryid","caseid","drug_seq","drugname","pt","age","age_cod","gndr_cod","indi_pt","quarter")
df_47<-df_47[,c(2,3,4,5,6,7,8,9)]
head(df_47)


#df_36<-data.frame(df_36)
#df_37<-data.frame(df_37)
#df_38<-data.frame(df_38)
#df_39<-data.frame(df_39)
#df_40<-data.frame(df_40)
#df_41<-data.frame(df_41)
#df_42<-data.frame(df_42)
#df_43<-data.frame(df_43)
#df_44<-data.frame(df_44)
#df_45<-data.frame(df_45)
#df_46<-data.frame(df_46)
#df_47<-data.frame(df_47)
#change age_cod, gndr_cod, quarter to charater 


#change age to numeric : 

#df_36[,2]<-sapply(df_36[,2], as.numeric)
#df_37[,2]<-sapply(df_37[,2], as.numeric)
#df_38[,2]<-sapply(df_38[,2], as.numeric)
#df_39[,2]<-sapply(df_39[,2], as.numeric)
#df_40[,2]<-sapply(df_40[,2], as.numeric)
#df_41[,2]<-sapply(df_41[,2], as.numeric)
#df_42[,2]<-sapply(df_42[,2], as.numeric)
#df_43[,2]<-sapply(df_43[,2], as.numeric)
#df_44[,2]<-sapply(df_44[,2], as.numeric)
#df_45[,2]<-sapply(df_45[,2], as.numeric)
#df_46[,2]<-sapply(df_46[,2], as.numeric)
#df_47[,2]<-sapply(df_47[,2], as.numeric)
# thus when rbind, there is no warning: 
case_2<-rbind.data.frame(df_36, df_37, df_38, df_39, df_40, df_41, df_42, df_43, df_44, df_45, df_46, df_47)

nrow(case_2)
head(case_2,200)
write.csv(case_2, "E:/data/all2.csv",row.names=FALSE)
#write.csv(whole, "E:/data/whole_case.csv", row.names=FALSE)


#############################
#read in case_1 (data from 04q1 to 12q3) as they are similar in column names: 
case_1<-read.csv("E:/data/all1.csv")
head(case_1)
nrow(case_1)
#read in case_2 (data from 12q4 to 15q3) as they are similar in column names; 
case_2<-read.csv("E:/data/all2.csv")
#change column character then can rbind without warning: 
#case_1[,2]<-sapply(case_1[,2], as.numeric)


whole<-rbind(case_1, case_2)
length(unique(whole$caseid))

write.csv(whole, "E:/data/all.CSV", row.names=FALSE)


################################
#therefore can read in whole from csv: 
# whole_case means I have append all the data form 04q1 to 15q3 with (pt == cardiomyopathy list) 

whole<-read.csv("E:/data/all.csv")
head(whole)
length(unique(whole$caseid))