# vim:tabstop=2:shiftwidth=2:nu:filetype=sh

plotQuery<-function(start,stop,label,y) {

	#y<-qy

	#start<-as.integer(args[1])
	#stop<-as.integer(args[2])
	#label<-args[3]

	segments(start,y,stop,y)
	segments(start,y,start,0.99*y)
	segments(stop,y,stop,0.99*y)
	
	text(start+(stop-start)/2,y*1.01,label,offset=0,pos=3)

	qy<<-0.93*qy	

}

#plotQueries<-function(filename,startY) {
#
#	qy<-startY
#
#	q<-read.table(filename,sep=",",header=T)
#
#	apply(q,1,plotQuery)
#
#}
