graphics.off();
rm(list=ls());

setwd("C:/Users/Alex Looi/Dropbox/NOAA_Wetlands_Ceili-Alex/Alex's Folder/Core Experiment--Alex Looi/Algae Growth Experiment")

Algae.GR = read.csv("Algae GRs.csv", header = T)


# Plot the GR of the algae over time
x = Algae.GR$Interval

y.avg =  Algae.GR[,2:5]

y.sd = Algae.GR[,6:9]

x.jitter = jitter(1:9)


par(mar=c(4.5, 4.5, 4.5, 4.5))

layout(rbind(1,2), heights=c(7,1))

plot(x.jitter, y.avg[,1], type = "o", ylim = c(-2, 4), 
     xlab = c("Day interval"), ylab = c("GR (ind. day-1)"),
     col = 1, main = c("Algal Growth Rates"))
segments(x.jitter, c(y.avg[,1]-y.sd[,1]), 
         x.jitter, c(y.avg[,1]+y.sd[,1]))

for(i in 2:4){
x.jitter = jitter(1:9)
points(x.jitter, y.avg[,i], type = "o", ylim = c(-1, 3), 
     xlab = c("Day interval"), ylab = c("GR (ind. day-1)"),
     col = i)
segments(x.jitter, c(y.avg[,i]-y.sd[,i]), 
         x.jitter, c(y.avg[,i]+y.sd[,i]))
}

par(mar=c(0, 0, 0, 0))
plot.new()

legend("center",legend = c("Upper","Mid Upper", "Mid Lower", "Lower"),
       col = c(4, 3, 2, 1), pch = c(1,1,1,1), lty = c(1,1,1,1),
       ncol=4,bty ="n")
par(mar=c(4.5, 4.5, 4.5, 4.5))


