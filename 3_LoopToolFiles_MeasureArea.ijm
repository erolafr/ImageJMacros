// SCRIPT per a mesurar àrees definint escala en cada imatge en un conjunt d'arxius 

path = "C:/Users/Erola/Desktop/Exemples/LeafAreaLoop/";
llista = getFileList(path);

run("Set Measurements...", "area display add redirect=None decimal=4");

for(i=0; i < llista.length; i++){
	open(path + llista[i]);
	ti = getTitle;

	setTool("line");
	waitForUser("Define the scale. Select 1 cm");
	run("Set Scale...", "known=1 unit=unit");

	setTool("polygon");
	waitForUser("Select the leaf area");
	run("Measure");

	close();

}

saveAs("Results", "C:/Users/Erola/Desktop/Exemples/LeafAreas.xls");
