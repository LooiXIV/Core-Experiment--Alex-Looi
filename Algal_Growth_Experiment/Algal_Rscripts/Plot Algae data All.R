graphics.off()
rm(list = ls())
##########################################################################
#Read in data to plot
algae.dir = paste("C:/Users/Alexander Looi/Google Drive/Dropbox/",
                  "NOAA_Wetlands_Ceili-Alex/Alex's Folder/",
                  "Core Experiment--Alex Looi/Algae Growth Experiment",
                  sep = "")

setwd(algae.dir)
NP.ratio = read.csv("NP ratio plot.csv", header = T)
CN.ratio = read.csv("CN ratio plot.csv", header = T)
GR.algae = read.csv("Algae GRs.csv")
DEN.algae = read.csv("Algal Densities means and std.csv", header = T)
# Format plots
mag = 1.75
mag.text = 2
png(filename = "Algal Plots All.png",
    width = 1200, height = 1500)

layout(matrix(c(1:4), 4, 1),c(1,1,1,1))

# plot Algal Densities
######################################################################################
par(mar = c(1, 5, 0, 1), cex = mag)
Exp.day = DEN.algae$Day
x = Exp.day
y.m = DEN.algae$L.M
y.sd = DEN.algae$L.SD
plot(x, y.m, type = "l", 
     ylim = c(0, 500000), xlim = c(1, 10),
     yaxt = "n", xaxt = "n",
     ylab = "", xlab = "")
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 25, bg = "darkgreen")

# plot ML
x = Exp.day+0.05
y.m = DEN.algae$ML.M
y.sd = DEN.algae$ML.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 21, bg = "magenta", cex = 1.25)

# plot MU
x = Exp.day+0.1
y.m = DEN.algae$MU.M
y.sd = DEN.algae$MU.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 22, bg = "red", cex = 1.25)

# plot U
x = Exp.day-0.1
y.m = DEN.algae$U.M
y.sd = DEN.algae$U.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 23, bg = "yellow", cex = 1.25)

# y axis ticks and labels
axis(side = 2, at = seq(0, 500000, by = 100000), 
     labels = c("0","1e+5","2e+5","3e+5","4e+5","5e+5"), las = 2)
y.lab = expression("Algal Growth Rate (Cells mL " ^-1*")")
mtext(side = 2, line = 3.25, text = y.lab, cex = mag.text)
legend(8.75, 505000, pch = c(25, 21, 22, 23), 
       pt.bg = c("darkgreen","magenta", "red", "yellow"),
       legend =c("Lower", "Mid-Lower", "Mid-Upper", "Upper"),
       pt.cex = c(1, 1.25,1.25,1.25))

######################################################################################
# plot Algal GRs
######################################################################################
par(mar = c(1, 5, 0, 1), cex = mag)

Exp.day = GR.algae$Day
x = Exp.day
y.m = GR.algae$L.M
y.sd = GR.algae$L.SD
plot(x, y.m, type = "l", 
     ylim = c(-1.5, 5), xlim = c(1, 10),
     yaxt = "n", xaxt = "n",
     ylab = "", xlab = "")
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 25, bg = "darkgreen")

# plot ML
x = Exp.day+0.05
y.m = GR.algae$ML.M
y.sd = GR.algae$ML.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 21, bg = "magenta", cex = 1.25)

# plot MU
x = Exp.day+0.1
y.m = GR.algae$MU.M
y.sd = GR.algae$MU.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 22, bg = "red", cex = 1.25)

# plot U
x = Exp.day-0.1
y.m = GR.algae$U.M
y.sd = GR.algae$U.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 23, bg = "yellow", cex = 1.25)

# add y axis ticks and labels
axis(side = 2, at = seq(-1, 5, by = 1), las = 2)
y.lab = expression("Algal Growth Rate (Day " ^-1*")")
mtext(side = 2, line = 2.5, text = y.lab, cex = mag.text)


# plot NP ratio
######################################################################
par(mar = c(1, 5, 0, 1), cex = mag)

Exp.day = NP.ratio$Day
x = Exp.day
y.m = NP.ratio$L.M
y.sd = NP.ratio$L.SD
plot(x, y.m, type = "l", 
     ylim = c(0, 45), xlim = c(1, 10),
     yaxt = "n", xaxt = "n",
     ylab = "", xlab = "")
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 25, bg = "darkgreen")

# plot ML
x = Exp.day+0.05
y.m = NP.ratio$ML.M
y.sd = NP.ratio$ML.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 21, bg = "magenta", cex = 1.25)

# plot MU
x = Exp.day+0.1
y.m = NP.ratio$MU.M
y.sd = NP.ratio$MU.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 22, bg = "red", cex = 1.25)

# plot U
x = Exp.day-0.1
y.m = NP.ratio$U.M
y.sd = NP.ratio$U.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 23, bg = "yellow", cex = 1.25)

# add y axis ticks and labels
axis(side = 2, at = seq(0,45,by = 10), las = 2)
mtext(side = 2, line = 2.5, text = "N:P ratio of algae", cex = mag.text)

# plot CN ratio
######################################################################
par(mar = c(5, 5, 0, 1), cex = mag)

Exp.day = CN.ratio$Day
x = Exp.day
y.m = CN.ratio$L.M
y.sd = CN.ratio$L.SD
plot(x, y.m, type = "l", 
     ylim = c(0, 45), xlim = c(1, 10),
     yaxt = "n", xaxt = "n",
     ylab = "", xlab = "")
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 25, bg = "darkgreen")

# plot ML
x = Exp.day+0.05
y.m = CN.ratio$ML.M
y.sd = CN.ratio$ML.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 21, bg = "magenta", cex = 1.25)

# plot MU
x = Exp.day+0.1
y.m = CN.ratio$MU.M
y.sd = CN.ratio$MU.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 22, bg = "red", cex = 1.25)

# plot U
x = Exp.day-0.1
y.m = CN.ratio$U.M
y.sd = CN.ratio$U.SD
lines(x, y.m)
arrows(x, y.m-y.sd, x, y.m+y.sd, 
       length=0.05, angle=90, code=3, lwd = 1.5)
points(x, y.m, pch = 23, bg = "yellow", cex = 1.25)

# add x and y axis ticks and labels
axis(side = 1, at = c(1:10))
mtext(side = 1, line = 2.25, text = "Experiment Day", cex = mag.text)
axis(side = 2, at = seq(0,45,by = 10), las = 2)
mtext(side = 2, line = 2.5, text = "C:N ratio of algae", cex = mag.text)
##########################################################################
dev.off()
graphics.off()