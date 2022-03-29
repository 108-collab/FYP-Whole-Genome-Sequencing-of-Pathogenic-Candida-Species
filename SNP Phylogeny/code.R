#setwd(path of where the variants file is located)
library(stringr)
v=read.csv("variants.csv")
c=4 
cs0074 = numeric(81-c)          #comparing CS0074 with the other isolates 
for(j in 1:81-c){
c=c+1
c1=0  #to keep track of variant differences between isolates 
cs3<-str_split_fixed(v[,c], ":", 6)
cs3<cs3[,1]
for(i in 1:58230){
  if (cs2[i]!=cs3[i]){
    c1=c1 + 1
  }
}
cs0074[j]=c1
}
