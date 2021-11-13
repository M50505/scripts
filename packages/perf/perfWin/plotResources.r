# vim:tabstop=2:shiftwidth=2:nu:filetype=sh

	
pcr<-function() {
	return(pcc("WIReportServer[^,]+CPU"))
}

pcc<-function(regexp,cpuCount) {
	return(plotCPU("C:/shared/Accounts/Parexel/BOEXILOGS/perfcap_03301152.csv",regexp,cpuCount))
}

plotCPU<-function(filename,target,cpuCount) {

	#
	# Read the CPU percentage values for all of the processes
	#

	cpu<-read.csv(
		filename,						#Absolute path to the file, using forward slashes ("/")
		header=T						#We leverage the first line to name the columns in the data frame
	)

	#
	# We need the indices of the columns to use, based on the
	# regular expression passed in the "target" parameter
	#

	pcol<-grep(target,names(cpu),ignore.case=T)


	#
	#	Set the margin sizes in terms of the number of
	# text lines, using the generic graphics function par()
	#
	par(
		mar=c(
			5,					#Bottom
			5,					#Left
			2,					#Top
			14					#Right
		)
	)

	#
	# Now that we know which columns (processes to plot),
	# get the data frame that is the appropriate subset.
	# The CPU percentage values represent the percentage 
	# of the TOTAL CPU capacity of the machine under
	# observation; divide each value by the number of CPUs
	# in order to have rational percentages plotted.
	#
	times<-subset(cpu,T,pcol)/cpuCount

	ylim=c(0,round(max(times)+1))											#Attempt to get a reasonable Y axis height

	#
	# Now plot the stacked bargraph
	#
	barplot(
		t(times),																				#Transpose the matrix portion of the data frame subset
		col=heat.colors(length(pcol)),									#Use the built-in "heat" colors
		space=0,																				#No space between bars
		legend.text=names(cpu)[pcol],										#The legend will lsit each process name with its color
		args.legend = list(x = 1.5 * max(cpu[,1])),			#This sets the X position of the legend
		ylim=ylim,
		main="CPU Utilization",													#Title
		xlab="Seconds into the observation",						#X axis label
		ylab="Percentage of combined CPUs"							#Y axis label

	)

	return(ylim)
}
