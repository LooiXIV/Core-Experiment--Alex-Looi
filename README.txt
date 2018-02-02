This repository contains all data, R scripts, and figures used in the Core-Experiment. There are 
4 general folders in this repository "Algal_Growth+Experiment", "Algal_Allelopathy_Experiment", and
"Zooplankton_Data".
###################################################################################################

1) Algal_Allelopathy_Experiment: This folder contains all files, data, and R scripts relating to the 
	Allelopathy Experiment. There are three folders in this folder: Allelopath Count Data, Allelopathy
	Figures, and Allelopathy R Scripts
	
	a) Allelopathy Count Data: 
		i) Algal Counts.xlsx: raw algal allelopathy count data. Each tab in the file is a 
		different day of count data, the final two sheets in the file are mean densities of
		cells, labeled by treatment. The very last tab includes standard deviation as well.
		ii) Allelopathy Algal Count.csv: contains daily mean densities and daily standard
		deviations for all allelopathy experiment treatments. This csv file is used in 
		plotting algal daily mean densities and standard deviation bars for these means.
		iii) Allelopathy Algal Last Day TT.csv: Raw algal count data for the last day of the
		experiment used to do a student T-Test.
		iv) Allelopathy Algal Middle Day TT.csv: Raw algal count data for the Middel day of 
		the experiment used to do a student T-Test.
		v) Friendmanns Allelopathy.csv: a csv file used to conduct a friedmanns test to see
		if the trends among treatments were different.
	b) Allelopathy Figures:
		i) Algal Growth 2.jpg: a cartoon depicting how the allelopathy experiment was 
		conducted.
		ii) Algal Growth Procedure 2.pptx: a powerpoint file of Algal Growth 2.jpg
		iii) Allelopathy Algal Growth Experiment.png: Figure showing algal growth trends
		in the allelopath experiment.
	c) Plot Allelopathy Experiment Barplot.R: The R script does the friedmann's test to test
	for significant difference in trends among treatments, student T-tests to see if specific
	days of the experiment are different among treatments, and plots the "Allelopathy Algal 
	Growth Experiment.png"

2) Algal_Growth_Experiment: this contains R scripts, data, and figures produced in the original algal
	growth experiment. There are four folders: Algal Figures, Algal_Rscripts, Friedmanns, Growth
	Rate Count and Nutrients, and Stable Istope Data.
	a) Algal_Figures: have one figure in it called "Algal Plots All.png". This figure has 4 subplots
	algal density over time, Algal growth rate over time, N:P ratio over time, and C:N ratio over
	time.
	b) Growth Rate Count and Nutrients
		i) Algal Growth Counts.xlsx: raw algal allelopathy count data. Each tab in the file is a 
		different day of count data, the final two sheets in the file are mean densities of
		cells, labeled by treatment.
		ii) Algal GRs.csv: shows the daily growth rates of algae during the growth rate experiment
		iii) Algal Densities means and std.csv: a csv of algal daily densities and std of the
		daily densities.
		iv) Algal GR2.csv: mean daily growth rate of of individual treatment replicates.
		v) Algal Nutrient Ratios.xlsx: the mean daily N:P and C:N ratios of phytoplankton during
		the growth rate experiment. These are split into two seperate tabs.
		vi) Algal TDP.xlsx: raw daily data for the concentration of TDP in algal samples for each rep.
		The last three tabs show daily means for each treatment. The second to last tab plots the
		data, and the final table contains C, N, and P concentrationsfor all treatments.
		vii) Carbon Input.csv: Daily carbon concentration for phytoplankton.
		viii) CN Input.csv: Daily C to N ratio for phytoplankton.
		ix) CN ratio plot.csv: data used to plot C to N ratios. Note the data present here uses
		interpolated data.
		x) CNP Algae.xlsx: An excel file where the first 6 tabs show phosphorus, nitrogen, carbon, 
		CN ratio, NP ratio and CP ratio plots for all treatments. The final tab shows the data used
		to plot the preceeding figures in addition to interpolated data.
		xi) FriedmannsData Algae.csv: input algal growth data used to do a friedmanns test.
		xii) Nitrogen Input.csv: mean daily nitrogen concentrations in micromoles/liter.
		xiii) NP ratio plot.csv: csv of NP ratio used for plotting in R. includes daily means and std.
		xiv) Phosphorus Input.csv: mean daily phosphorus concentrations in micromoles/liter.
	c) Stable Isotope Data: Folder with all data acquired and derived from Prof. Mark Teese's mass
		spectrometer. Nutrient concentration was obtained from this data.
		i) Alex LOOI 2014 Results.xlsx: raw data from Mark Teese's lab.
		ii) AlgaeStableIsotopes.csv: csv version of of the first "Results" tab of the "Alex LOOI
		2014 Results.xlsx" file.
		iii) AmtC.xlsx: excel file showing carbon concentrations of the raw data in addition to 
		calculations to get more standardize numbers.
		iv) AmtC.csv: csv version of the first tab in the AmtC.xlsx file.
		v) AmtN.xlsx: excel file showing nitrogen concentrations of the raw data in addition to 
		calculations to get more standardize numbers.
		vi) AmtN.csv: csv version of the first tab in the AmtN.xlsx file.
		vii) d13C.csv: Stable isotope ratios of delta C13.
		viii) d15N.csv: Stable isotope ratios of delta N14.
		ix) Stable Isotope Adjusted.csv: Adjusted and cleaned stable isotope data from Alex LOOI
		2014 Results.xlsx.
	d) Algal_Rscripts: 
		i)Algal GR.R: plots algal growth rate over time using the "Algae GRs.csv" file
		ii) Friedmanns Test Algae.R: Does a friedmanns test using the FriedmannsData Algae.csv file.
		It will also conduct a friedmanns test on the FriendmannsData Rotifers.csv file.
		iii) Plot Algae data All.R: plots NP, CN ratios, Algal Growth rates, and algal mean densities
		with standard deviations for each day of the algal growth experiment.
3) Zooplankton_Data
	a) Ceriodaphnia Mass Data: all data used in the Ceriodaphnia growth experiment.
		i) Ceriodaphnia Sampling Sheet.xlsx: Sampling sheet used to log raw ceriodaphnia neonate data.
		ii) Ceriodaphnia Data plot.xlsx: means and standard deviations of neonate mass for both weeks
		of the ceriodaphnia growth experiment (first two tabs). The last tabs shows the neonate growth
		rate of ceriodaphnia for both weeks of the experiment (mean and standard deviation).
		iii) Ceriodaphnia Data R Input W1.csv: the raw ceriopdahnia mass and growth rate during the 
		first week of the experiment in csv form. Blanks show neonates that died before massing.
		iv) Ceriodaphnia Data R Input W2.csv: the raw ceriopdahnia mass and growth rate during the 
		second week of the experiment in csv form. Blanks show neonates that died before massing.
		v) Cerio W1 Masses.csv: means and standard deviations of ceriodaphnia neonate mass for the 
		first week of the ceriodaphnia growth rate experiment.
		vi) Cerio W2 Masses.csv: means and standard deviations of ceriodaphnia neonate mass for the 
		second week of the ceriodaphnia growth rate experiment.
		vii) Ceriodaphnia GR.csv: mean and standard deviation growth rate of the ceriodaphnia for both
		weeks of the experiment.
		viii) GR Ceriodaphnia.csv: raw growth rates fo each individual neonate in the experiment. Blank
		entries show neonates that died before the end of the experiment. Both week 1 and week 2 neonates
		are present.
	b) Rotifers:
		i)Rotifer Data.xlsx: This has the raw rotifer data. The first tab shows the smapling sheet. With 
		rotifer growth rates per replicate. The second tab shows rotifer growth rate over the course of 
		the experiment. Shows growth rate for each replicate, treatment and day of the experiment.
		ii) Rotifer Growth Rates.csv: a csv file of rotifer growth rates.
	c) Zoop_Figures: 
		i) Ceriodaphnia_Isotopes.JNB: a sigma plot file showing the ceriodaphnia stable isotope data.
		ii) Ceriodaphnia Plots All.png: plot of change in ceriodaphnia mass and growth rate for the two
		weeks of the ceriodaphnia experiment.
		Rotifer Growth Growth Experiment.png: shows the daily growth rates of rotifers during the core
		experiment.
	d) Zoop_R_scripts:
		i) Ceriodaphnia Mass and GR plot.R: this creates the Ceriodaphnia Plots All.png figure.
		Also does statistical test to see if masses and growth rates are significantly different.
		among treatments.
		ii) Plot Rotifer GR.R: this creates the Plot Rotifer GR.R figure. Also does statistical test to
		see if growth rate trends are significantly different among treatments.
