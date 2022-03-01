//SCRIPT PER A SELECIONAR MÚLTIPLES AREES D'UNA FOTOGRAFIA

open("C:/Users/Erola/Desktop/Exemples/DSC_3823_.JPG");

run("Set Measurements...", "area mean modal display redirect=None decimal=3");

ti = getTitle;
selectWindow(ti);

run("ROI Manager...");

Dialog.create("Settings");
	Dialog.addNumber("Number of Areas of Interest:", 5);
Dialog.show()

number_AOI=Dialog.getNumber();

setTool("polygon");

for(i=0; i < number_AOI;i++){
	waitForUser("Select object");
	if (selectionType==-1) exit("you must draw a region first");
	roiManager("Add");
}

roiManager("Associate", "false");
roiManager("Centered", "false");
roiManager("UseNames", "true");
roiManager("Show All");
run("Duplicate...", " ");
run("Lab Stack");
roiManager("Show All");
roiManager("multi-measure measure_all");
run("Set Measurements...", "area mean modal display redirect=None decimal=3");
roiManager("multi-measure measure_all");
selectWindow(ti);
run("HSB Stack");
roiManager("Show All");
roiManager("Show None");
roiManager("Show All");
run("Set Measurements...", "area mean modal display redirect=None decimal=3");
roiManager("Measure");
run("Input/Output...", "jpeg=85 gif=-1 file=.xls use_file copy_column copy_row save_column save_row");


saveAs("Results", "C:/Users/Erola/Desktop/Exemples/Results.xls");

function closeWin(name) {
	if (isOpen(name)) {
	     selectWindow(name);
	     run("Close");
	}
}

