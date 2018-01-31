graphics.off()
list(rm = ls())
##################################################################################
Cerio.WD = paste("C:/Users/Alexander Looi/Google Drive/",
                 "Dropbox/NOAA_Wetlands_Ceili-Alex/",
                 "Alex's Folder/Core Experiment--Alex Looi/",
                 "Zooplankton Data/Plot Ceriodaphnia Data", 
                 sep = "")

setwd(Cerio.WD)

W1M = read.csv("Cerio W1 Masses.csv", header = T)
W2M = read.csv("Cerio W2 Masses.csv", header = T)
GR = read.csv("Ceriodaphnia GR.csv", header = T)

# plot Ceriodaphnia Data
mag = 1.5
mag.text = 1.75
png(filename = "Ceriodaphnia Plots All.png",
    width = 900, height = 900)

layout(matrix(c(1:2), 2, 1),c(1,1))


##################################################################################
# plot week 1
x = c(1,5)
y.m = W1M$M1.U
y.sd = W1M$SD1.U
# plot the Upper
par(mar = c(1, 5, 1, 1), cex = mag)

plot(x, y.m, ylim = c(0,0.05), xlim = c(1, 10),
     xaxt = "n", yaxt = "n",
     ylab = "", xlab = "",
     type = "l")
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)   
points(x, y.m, pch = 23, bg = "yellow", cex = 1.25)

# plot Mid-Upper
x = c(0.9, 4.9)
y.m = W1M$M1.MU
y.sd = W1M$SD1.MU
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 22, bg = "red", cex = 1.25)

# plot Mid-Lower
x = c(1.1, 5.1)
y.m = W1M$M1.ML
y.sd = W1M$SD1.ML
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 21, bg = "Magenta", cex = 1.25)

# plot Lower
x = c(1.05, 4.95)
y.m = W1M$M1.ML
y.sd = W1M$SD1.ML
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 24, bg = "darkgreen")
# add legend
legend(.75, .051, pch = c(25, 21, 22, 23), 
       pt.bg = c("darkgreen","magenta", "red", "yellow"),
       legend =c("Lower", "Mid-Lower", "Mid-Upper", "Upper"),
       pt.cex = c(1, 1.25,1.25,1.25))


##################################################################################
# plot week 2

x = c(6,10)
y.m = W2M$M2.U
y.sd = W2M$SD2.U
# plot the Upper
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)   
points(x, y.m, pch = 23, bg = "yellow", cex = 1.25)

# plot Mid-Upper
x = c(6.05, 10.05)
y.m = W2M$M2.MU
y.sd = W2M$SD2.MU
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 22, bg = "red", cex = 1.25)

# plot Mid-Lower
x = c(6.1, 10.1)
y.m = W2M$M2.ML
y.sd = W2M$SD2.ML
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 21, bg = "Magenta", cex = 1.25)

# plot Lower
x = c(5.9, 9.9)
y.m = W2M$M2.ML
y.sd = W2M$SD2.ML
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 24, bg = "darkgreen")

# add axes
# axis(side = 1, at = c(1:10))
# mtext(side = 1, line = 2.25, text = "Experiment Day", cex = mag.text)
axis(side = 2, at = seq(0,0.05,by = 0.01), las = 2)
ylab = expression("Ceriodaphnia Mass  ( "*mu*"g)")
mtext(side = 2, line = 3, text = ylab, cex = mag.text)
###################################################################################
# Ceriodaphnia Growth Rates
x = jitter(rep(2.5, 4), amount = .65)
y.m = t(GR[1,2:5])
y.sd = t(GR[2,2:5])
par(mar = c(5, 5, 1, 1), cex = mag)
plot(x, y.m, xlim = c(1,10),ylim = c(0, 0.75),
     xaxt = "n", yaxt = "n",
     ylab = "", xlab = "")
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = c(23, 22, 21, 24),
       bg = c("yellow","red", "magenta", "darkgreen"), 
       cex = c(1.25, 1.25, 1.25, 1))

x = jitter(rep(7.5, 4), amount = .65)
y.m = t(GR[1,6:9])
y.sd = t(GR[2,6:9])
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = c(23, 22, 21, 24),
       bg = c("yellow","red", "magenta", "darkgreen"), 
       cex = c(1.25, 1.25, 1.25, 1))

# add axes
axis(side = 1, at = c(1, 5, 6, 10))
mtext(side = 1, line = 3, text = "Experiment Day", cex = mag.text)
      
axis(side = 2, at = seq(0,0.75,by = 0.15), las = 2)
ylab = expression("Ceriodaphnia Growth Rate  ( day"^-1*")")
mtext(side = 2, line = 3, text = ylab, cex = mag.text)
###########################################################################
dev.off()
graphics.off()
