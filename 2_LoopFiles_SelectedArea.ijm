// SCRIPT per a mesurar una àrea automàticament d'un llistat d'arxius on tenim ja una selecció

path = "C:/Users/Erola/Desktop/Exemples/Leaves/";

llista = getFileList(path);

for(i=0; i < llista.length; i++){
	open(path + llista[i]);
	ti = getTitle;

    run("Measure");
	close();

}

saveAs("Results", "C:/Users/Erola/Desktop/Exemples/ResultsLeafAreas.xls");