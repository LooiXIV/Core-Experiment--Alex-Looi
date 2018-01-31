Rot.dir = paste("C:/Users/Alexander Looi/Google Drive",
      "/Dropbox/NOAA_Wetlands_Ceili-Alex",
      "/Alex's Folder/Core Experiment--Alex Looi",
      "/Zooplankton Data/Rotifers", sep = "")
y.lims = c(-2.5, 0)
setwd(Rot.dir)

Rot.data = read.csv("Rotifer Growth Rates.csv", header = T)

Rot.data
x = 

plot(Rot.data[,2], Rot.data[,3], 
     xlab = "", ylab = "", 
     ylim = c(-1.75, 1), pch = 20)
lines(Rot.data[,2], Rot.data[,3])
points(Rot.data[,2], Rot.data[,4], col = 2, pch = 20)
lines(Rot.data[,2], Rot.data[,4])
points(Rot.data[,2], Rot.data[,5], col = 3, pch = 20)
lines(Rot.data[,2], Rot.data[,5])
points(Rot.data[,2], Rot.data[,6], col = 4, pch = 20)
lines(Rot.data[,2], Rot.data[,6])
#######################################################
graphics.off()
# set margins
mag = 2
mar.val = 4
png(filename = "Rotifer Growth Growth Experiment.png",
    width = 1200, height = 1500)
# plot
########################################################
layout(matrix(c(1:5),5,1), heights = c(3, 3, 3, 3, 2))

thickness = 3
y.lab = expression("Growth Rate Day"^-1)
Rot.matrix = matrix(Rot.data[,3:6])
ym = Rot.data[,3:6]
ys = Rot.data[,7:10]
y.axis = round(seq(0, -2.5, length.out = 5), 1)

# Upper
par(cex = mag, mar = c(2,mar.val,1,0))
x = barplot(ym[,1], ylim = y.lims, yaxt = "n", ylab = "", col = "yellow")
mtext(side = 2, line = 2.5, text = y.lab, cex = 2)
arrows(x, ym[,1], x, ym[,1]-ys[,1], length = .05, angle = 90, lwd = thickness)
axis(side = 2, at = y.axis, labels = y.axis, las = 2)

# Mid-Upper
par(cex = mag, mar = c(2,mar.val,1,0))
barplot(ym[,2], ylim = y.lims, yaxt = "n", ylab = "", col = "red")
mtext(side = 2, line = 2.5, text = y.lab, cex = 2)
arrows(x, ym[,2], x, ym[,2]-ys[,2], length = .05, angle = 90, lwd = thickness)
axis(side = 2, at = y.axis, labels = y.axis, las = 2)

# Mid-Lower
par(cex = mag, mar = c(2,mar.val,1,0))
barplot(ym[,3], ylim = y.lims, yaxt = "n", ylab = "", col = "magenta2")
mtext(side = 2, line = 2.5, text = y.lab, cex = 2)
arrows(x, ym[,3], x, ym[,3]-ys[,3], length = .05, angle = 90, lwd = thickness)
axis(side = 2, at = y.axis, labels = y.axis, las = 2)

# Lower
par(cex = mag, mar = c(2,mar.val,1,0))
barplot(ym[,4], ylim = y.lims, yaxt = "n", ylab = "", col = "green4")
mtext(side = 2, line = 2.5, text = y.lab, cex = 2)
arrows(x, ym[,4], x, ym[,4]-ys[,4], length = .05, angle = 90, lwd = thickness)
axis(side = 1, at = x, c(1:8))
axis(side = 2, at = y.axis, labels = y.axis, las = 2)

mtext(side = 1, line = 2.5, text = "Experiment Day", cex = 2)

#legend
source("http://www.math.mcmaster.ca/bolker/R/misc/legendx.R")
plot.new()
par(cex = 2.5, mar = c(0,0,0,0))
legend('bottom',
       c("Upper","Mid-Upper",  
         "Mid-Lower", "Lower"),
       fill = c("yellow", "red", 
                "magenta2", "green4"),
       ncol = 4, bty = "n", y.intersp = 3, box.cex = c(1.25,1.25))


dev.off()
graphics.off()
