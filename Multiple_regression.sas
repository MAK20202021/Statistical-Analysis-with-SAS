libname STAT1 base "/home/u63305039/EST142/data";

%let interval=Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;
%let interval2=Age Weight Neck Abdomen Hip Thigh Ankle Biceps Forearm Wrist;

ods graphics on;

proc reg data=STAT1.bodyfat2;
    model PctBodyFat2=&interval;
    title "Model with Body Fat";
run;

/* Eliminating highest p-values variables */


proc reg data=STAT1.bodyfat2;
    model PctBodyFat2=&interval2;
    title "Model with Body Fat eliminating highest p-value";
run;

title;
ods graphics off;