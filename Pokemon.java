import java.util.*;
import java.io.*;

public class Pokemon{

    private final String[][] data;
    private int catchRate;
    private int runRate;
    private String name;
    private String pokedex;
    //private PImage sprite;
    private boolean caught;


    public Pokemon(String name){
	ArrayList<String> lines = new ArrayList<String>();
	try{
	    Scanner in = new Scanner(new File("pokemon.txt")); //reads file into ArrayList
	    while(in.hasNext()){
		lines.add(in.nextLine());
	    }
	}catch(FileNotFoundException e){
	    System.out.println("File not found: " + "pokemon.txt");
	    System.exit(1);
	}
	data = new String[60][5]; //60 Pokemon, 5 points of data for each
	for(int i = 0; i < lines.size() - 1; i++){
	    String[] temp = lines.get(i+1).split(",", 5); //separates lines in ArrayList
	    for(int j = 0; j < temp.length; j++){ //reads into data array
		data[i][j] = temp[j];
	    }
	    if(data[i][0].equals(name)){ //if name is found fill in appropriate data
		this.name = name;
		catchRate = Integer.parseInt(data[i][1]);
		runRate = Integer.parseInt(data[i][1]); //CHANGE LATER (run rate is not always the speed)
		pokedex = data[i][4];
		//sprite = 
		caught = false;
	    }
	}
	try{
	    boolean a = this.name.equals(null);
	}catch(NullPointerException e){
	    throw new IllegalArgumentException("Pokemon not found");
	}
    }
    
    public String toString(){
	String s = "";
	/*
	for(int r = 0; r < data.length; r++){
	    for(int c = 0; c < data[0].length; c++){
		s = s +  "[" + data[r][c] + "] ";
	    }
	    s += '\n';
	}
	*/
	s = s + "Name: " + name + "\n" + "Catch Rate: " + catchRate + "\n" + "Pokedex Entry: " + pokedex + "\n";
	return s;
    }

    public void changeRates(String input){
	//Modifies catch rate and run rate based on whether player throws bait or mud
    }

    public void changeRates(int c, int r){
	//Int version
    }

    public void catchPokemon(){
	//Occurs when player throws ball, decides whether pokemon is caught or not. If pokemon is caught, caught is changed to true
    }

    public void display(){

    }

    
    public static void main(String[]args){
	Pokemon s = new Pokemon("Sandshrew");
	System.out.println(s);
      	Pokemon k = new Pokemon("Kyogre");
	System.out.println(k);
	/*
	//Should throw IllegalArgumentException
	Pokemon ks = new Pokemon("SandshrewKyogre");
	System.out.println(ks);
	*/
    }
    
}
