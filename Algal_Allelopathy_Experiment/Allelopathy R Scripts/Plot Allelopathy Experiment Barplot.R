graphics.off()
rm(list = ls())
source("http://www.math.mcmaster.ca/bolker/R/misc/legendx.R")
require(pgirmess)
###################################################################################
main.dir = paste("C:/Users/Alexander Looi/Google Drive/",
                 "Dropbox/NOAA_Wetlands_Ceili-Alex/Alex's Folder/", sep = "")
Allelo.dir = "Core Experiment--Alex Looi/Algal Allelopathy Experiment"

dir = paste(main.dir, Allelo.dir, sep = "")

setwd(dir)

A = read.csv("Allelopathy Algal Count.csv")
AC = read.csv("Algal Counts.csv")
ylimits = 55000
data = t(A[,2:9])
std.dev = t(A[10:17])
thickness = 2
barplot(data, beside = T, angle = c(45, 90, 45, 90, 
                                    45, 90, 90, 90), 
        col = c("red", "red", "green", "green", 
                "blue", "blue", "gold", "cyan"))

data(siegelp179)
attach(siegelp179)

# Friedmann's test
friedman.test(as.matrix(A[,2:9]), groups = colnames(t(data)))
friedmanmc(AC[,1], groups = AC[,2], block = AC[,3])
#
LDA = read.csv("Allelopathy Algal Last Day.csv", header = T)
MDA = read.csv("Allelopathy Algal Middle Day.csv", header = T)

pairwise.t.test(LDA$Counts, LDA$Treatment, p.adjust.method = "none")
pairwise.t.test(MDA$Count, MDA$Treatment, p.adjust.method = "none")

pairwise.wilcox.test(LDA$Counts, LDA$Treatment, p.adjust.method = "none")
pairwise.wilcox.test(MDA$Count, MDA$Treatment, p.adjust.method = "none")


LDA.lm = lm(LDA$Counts~LDA$Treatment+LDA$Rep)
MDA.lm = lm(MDA$Count~MDA$Treatment+MDA$Rep)

aov(LDA.lm)
TukeyHSD(aov(MDA.lm))

t.test(LDA[29:32,1], LDA[5:8,1])

plot(TukeyHSD(aov(LDA.lm)))
#

AF = read.csv("Friedmanns Allelopathy.csv", header = T, sep = ",")

friedmanmc(AF$Density, AF$Treatment, AF$day, prob = 0.1)


# Combo points
Combo = function(x.s){
  xj = jitter(x.s)
  y0 = c(data[7,])
  y1 = y0+c(std.dev[7,])
  arrows(xj, y0, xj, y1, length = .05, angle = 90, lwd = thickness)
  points(xj, data[7,], pch = 19, col = "gold", cex = 1.5)
  points(xj, data[7,], lwd = 1.25, cex = 1.5)
}

graphics.off()
png(filename = "Allelopathy Algal Growth Experiment.png",
    width = 1200, height = 1500)
y.labs = expression("Density (Cells mL"^-1*")")
mag = 2
mar.val = 4
layout(matrix(c(1:5),5,1), heights = c(3, 3, 3, 3, 2))

# Creek water
########################################################
par(cex = mag, mar = c(0,mar.val,0,0))
barplot(data[1:2,], beside = T, 
        ylim = c(0,ylimits), col = "darkblue")
par(new = T)
x = barplot(data[1:2,], beside = T, ylab = "",
            ylim = c(0, ylimits), col = c("white", NA), density = 50)
y0 = c(data[1,], data[2,])
x0 = c(x[1,], x[2,])
y1 = y0+c(std.dev[1,],std.dev[2,])
arrows(x0, y0, x0, y1, length = .05, angle = 90, lwd = thickness)
x.bar = colMeans(x)
mtext(side = 2, line = 2.75, y.labs, cex = 2)
Combo(x.bar)

# Upper
########################################################
par(cex = mag, mar = c(0,mar.val,0,0))
barplot(data[3:4,], beside = T, 
        ylim = c(0,ylimits), col = "darkgreen")
par(new = T)
x = barplot(data[3:4,], beside = T,  ylab = "",
            ylim = c(0,ylimits), col = c("white", NA), density = 50)
y0 = c(data[3,], data[4,])
y1 = y0+c(std.dev[1,],std.dev[2,])
arrows(x0, y0, x0, y1, length = .05, angle = 90, lwd = thickness)
x.bar = colMeans(x)
mtext(side = 2, line = 2.75, y.labs, cex = 2)
Combo(x.bar)

# Lower
########################################################
par(cex = mag, mar = c(0,mar.val,0,0))
barplot(data[5:6,], beside = T,  
        ylim = c(0,ylimits), col = "saddlebrown")
par(new = T)
barplot(data[5:6,], beside = T,  ylab = "",
        ylim = c(0,ylimits), col = c("white", NA), 
        density = c(25, NA), angle = c(45))
# legend("topleft",fill = c("saddlebrown", "saddlebrown"), bty = "n",
#        c("autoclaved","unautoclaved"))
# legend("topleft", fill = c("white", NA), bty = "n", 
#        c("autoclaved","unautoclaved"), density = c(50, NA))
y0 = c(data[5,], data[6,])
y1 = y0+c(std.dev[5,],std.dev[6,])
arrows(x0, y0, x0, y1, length = .05, angle = 90, lwd = thickness)
x.bar = colMeans(x)
mtext(side = 2, line = 2.75, y.labs, cex = 2)
Combo(x.bar)

# Plant Matter
########################################################
par(cex = mag, mar = c(c(mar.val-1.5),mar.val,0,0))
x.bar = barplot(data[8,], beside = T,  
        ylim = c(0,ylimits), col = "purple", ylab = "")
y0 = c(data[8,])
y1 = y0+c(std.dev[8,])
arrows(x.bar, y0, x.bar, y1, length = .05, angle = 90, lwd = thickness)
axis(side = 1, at = x.bar, c(1:7))
mtext(side = 1, "Experimental Day", line = 2, cex = 2)
mtext(side = 2, line = 2.75, y.labs, cex = 2)
Combo(x.bar)

############################################################
# Legend #
############################################################
plot.new()
par(cex = 1.75, mar = c(0,0,0,0))
legend('bottom',
       c("autoclaved creekwater","unautoclaved creekwater",  
         "autoclaved Lower", "unautoclaved Lower",
         "autoclaved Upper","unautoclaved Upper",
         "Plant Matter", "Combo"),
       fill = c("darkblue", "darkblue", 
                "darkgreen", "darkgreen", 
                "saddlebrown", "saddlebrown",
                "purple", "gold"),
       ncol = 4, bty = "n", y.intersp = 3, box.cex = c(1.25,1.25))

legend('bottom',
       c("autoclaved creekwater","unautoclaved creekwater",
         "autoclaved Lower", "unautoclaved Lower",
         "autoclaved Upper","unautoclaved Upper",
         "Plant Matter", "Combo"),
       fill = c("white",NA,
                "white",NA,
                "white",NA,
                NA, NA), angle = c(45),
       density = c(10, NA,
                   10, NA,
                   10, NA,
                   NA, NA),
       ncol = 4, bty = "n", y.intersp = 3, box.cex = c(1.25,1.25))
dev.off()


# Tests
data(siegelp179)
attach(siegelp179)
friedmanmc(score,treatment,block)
friedmanmc(score,treatment,block,probs=0.75)

detach(siegelp179)


