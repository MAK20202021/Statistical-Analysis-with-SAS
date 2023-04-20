libname STAT1 base "/home/u63305039/EST142/data";

proc sgplot data = STAT1.drug;
	vline DrugDose / group = Disease
					stat = mean
					response = BloodP  
					markers;
run;

proc glm data = STAT1.drug
		order = internal
		plots(only)=intplot;
	class DrugDose Disease;
	model BloodP = Disease DrugDose Disease*DrugDose;
	lsmeans Disease*DrugDose/ diff slice = Disease;
	store out = interact;
	title "Model with Disease and DrugDose as Interacting Predictors";
run;
quit;