graphics.off();
rm(list=ls());

require(pgirmess)

setwd("C:/Users/Alex Looi/Dropbox/NOAA_Wetland_Cores/Core Experiment Results/Friedmans")

# Read in the data
data.A = read.csv("FriedmansData Algae.csv", sep = ",", header = TRUE) 

# Friedman's Test for Algae
###################################################################
reps = length(data.A[,1])/4
row.p = 1

new.data = data.frame(rep(0,reps), c("Upper", "Mid.Upper", "Mid.Lower", "Lower"),
                      rep(0,reps),rep(0,reps),rep(0,reps),rep(0,reps),rep(0,reps),
                      rep(0,reps),rep(0,reps),rep(0,reps),rep(0,reps),rep(0,reps))
colnames(new.data) = c("Rep", "Treatment", 
                       "T1", "T2","T3","T4","T5","T6","T7","T8","T9", "T10")

for(row in seq(1, length(data.A$T1)/reps)){
  
  for(col in seq(3, length(data.A))) {
    new.data[row,col] = mean(data.A[row.p:(row.p+(reps-1)), col])    
  }
  row.p = row.p + reps-1
}

t.data = matrix(rep(0,40), nrow = 10, ncol = 4, byrow = T,
                    dimnames = list(1:10, 
                                    c("Upper", "Mid.Upper", "Mid.Lower", "Lower")))

for (i in 1:4){
  
  t.data[,i] = as.numeric(new.data[i,3:12])
  
}

friedman.test(t.data)
friedmanmc(t.data)

# Friedman's Test for Rotifers
###################################################################

rm(list=ls());

require(pgirmess)

setwd("C:/Users/Alex Looi/Dropbox/NOAA_Wetland_Cores/Core Experiment Results/Friedmans")

data.R = read.csv("FriedmansData Rotifers.csv", sep = ",", header = TRUE)


reps = 4
row.p = 1

new.data = data.frame(rep(0,reps), c("Upper", "Mid.Upper", "Mid.Lower", "Lower"),
                      rep(0,reps),rep(0,reps),rep(0,reps),rep(0,reps),rep(0,reps),
                      rep(0,reps),rep(0,reps),rep(0,reps))
colnames(new.data) = c("Rep", "Treatment", 
                       "T1", "T2","T3","T4","T5","T6","T7","T8")

for(row in seq(1, 4)){
  
  for(col in seq(3, length(data.R))) {
    new.data[row,col] = mean(data.R[row.p:(row.p+(reps-1)), col])    
  }
  row.p = row.p + reps-1
}

t.data = matrix(rep(0,40), nrow = 8, ncol = 4, byrow = T,
                dimnames = list(1:8, 
                                c("Upper", "Mid.Upper", "Mid.Lower", "Lower")))

for (i in 1:4){
  
  t.data[,i] = as.numeric(new.data[i,3:10])
  
}

friedman.test(t.data)
friedmanmc(t.data)
