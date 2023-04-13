libname STAT1 base "/home/u63305039/EST142/data";

%let interval1=Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle;
%let interval2= Biceps Forearm Wrist;
%let interval3= Abdomen Chest Hip Weight Thigh;

ods graphics/ reset=all imagemap;
proc corr data=STAT1.bodyfat2 rank
		  plots(only)=scatter(nvar=all ellipse=none);
	var &interval1;
	with PctBodyFat2;
	title "Correlations and Scatter Plots with PctBodyFat2";
run;

proc corr data=STAT1.bodyfat2 rank
		  plots(only)=scatter(nvar=all ellipse=none);
	var &interval2;
	with PctBodyFat2;
	title "Correlations and Scatter Plots with PctBodyFat2";
run;

proc corr data=STAT1.bodyfat2 rank
		  plots(only)=scatter(nvar=all ellipse=none) out=pearson best=5;
	var &interval1;
	title "Correlations and Scatter Plots with PctBodyFat2";
run;
title;
ods graphics off;
