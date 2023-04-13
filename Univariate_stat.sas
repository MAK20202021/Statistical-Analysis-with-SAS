libname STAT1 base "/home/u63305039/EST142/data";

/*Univariate -- Statistical Description*/

%let interval=BodyTemp HeartRate; 
ods graphics; 
ods select histogram; 
proc univariate data=stat1.NormTemp noprint; 
   var &interval; 
   histogram &interval / normal kernel; 
   inset n mean std / position=ne; 
   title "Interval Variable Distribution Analysis"; 
run;



proc ttest data=stat1.NormTemp 
   plots(shownull)=interval
   h0=98.6; 
   var BodyTemp; 
   title 'Testing Whether the Mean Body Temperature=98.6'; 
run; 
title;