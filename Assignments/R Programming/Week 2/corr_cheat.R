crr=function(directory,threshold=0){
    temp=c()
    data=dir(directory,full.names=T)
    d=length(data)
    temp1=complete(directory,1:d)
    temp1=temp1[["nobs"]]>threshold
    
    data=data[temp1]
    if(length(data)!=0){
        for(i in 1:length(data)){
            dat1=read.csv(data[i])
            dat2=dat1[complete.cases(dat1), ]
            dat3=cor(dat2[["sulfate"]], dat2[["nitrate"]])
            
            temp=c(temp,dat3)
        }
    }
    temp
    
}
