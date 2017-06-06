import java.util.*;
import java.io.*;

public class Pokemon {

  private final String[][] data;
  private double catchRate;
  private double runRate;
  private int catchStage;
  private int runStage;
  private int catchDefault;
  private int speed;
  private String name;
  private String pokedex;
  private PImage sprite;
  private boolean caught;


  public Pokemon(String name) {
    ArrayList<String> lines = new ArrayList<String>();
    try {
      String[] boop = loadStrings("pokemon.txt");
      for (int i = 0; i < boop.length; i ++) {
        lines.add(boop[i]);
      }
    }
    catch(Exception e) {
      System.out.println("File not found: pokemon.txt");
      System.exit(1);
    }
    data = new String[60][5]; //60 Pokemon, 5 points of data for each
    for (int i = 0; i < lines.size() - 1; i++) {
      String[] temp = lines.get(i+1).split(",", 5); //separates lines in ArrayList
      for (int j = 0; j < temp.length; j++) { //reads into data array
        data[i][j] = temp[j];
      }
      if (data[i][0].equals(name)) { //if name is found fill in appropriate data
        this.name = name;
        catchDefault = Integer.parseInt(data[i][1]);
        speed = Integer.parseInt(data[i][2]);
        catchStage = 0;
        runStage = 0;
        catchRate = catchDefault;
        runRate = speed;
        pokedex = data[i][4];
        sprite = loadImage("pokemon/" + name + ".png");
        caught = false;
      }
    }
    try {
      boolean a = this.name.equals(null);
    }
    catch(NullPointerException e) {
      throw new IllegalArgumentException("Pokemon not found");
    }
  }

  public String toString() {
    String s = "";
    /*
    for(int r = 0; r < data.length; r++){
     for(int c = 0; c < data[0].length; c++){
     s = s +  "[" + data[r][c] + "] ";
     }
     s += '\n';
     }
     */
    s = s + "Name: " + name;// + "\n" + "Default Catch Rate: " + catchDefault + "\n" + "Catch Stage: " + catchStage + "\n" + "Speed: " + speed + "\n" + "Run Stage: " + runStage + "\n" + "Catch Rate: " + catchRate + "\n" + "Escape Rate: " + runRate + "\n" + "Pokedex Entry: " + pokedex + "\n";
    return s;
  }

  public void changeRates(String input) { //Modifies catch rate and run rate based on whether player throws bait or mud
    //stages cannot go below -6 and or above 6
    if (input.equals("bait") || input.equals("Bait")) {
      //When bait is thrown, it lowers the escape rate by one stage, but has a 90% chance of also lowering the catch rate by one stage.
      if (runStage > -6) {
        runStage -= 1;
      }
      if (Math.random() * 100 < 90 && catchStage > -6) {
        catchStage -= 1;
      }
    } else if (input.equals("mud") || input.equals("Mud")) {
      //When mud is thrown, it raises the catch rate by one stage, but has a 90% chance of raising the escape rate by one stage.
      if (catchStage < 6) {
        catchStage += 1;
      }
      if (Math.random() * 100 < 90 && runStage < 6) {
        runStage += 1;
      }
    } else {
      throw new IllegalArgumentException("input should be 'bait' or 'mud'");
    }
    //calculates new catch and escape rates
    if (catchStage >= 0) {
      catchRate = catchDefault * ((catchStage + 2.0)/2.0);
    } else { //if(catchStage < 0){
      catchRate = catchDefault * (2.0/(2.0 - catchStage));
    }
    if (runStage >= 0) {
      runRate = speed * ((runStage + 2.0)/2.0);
    } else { //if(catchStage < 0){
      runRate = speed * (2.0/(2.0 - runStage));
    }
    //caps catch and escape rates (must be between 0 and 255 inclusive)
    if (catchRate > 255) {
      catchRate = 255;
    } else if (catchRate < 0) {
      catchRate = 0;
    }
    if (runRate > 255) {
      runRate = 255;
    } else if (runRate < 0) {
      runRate = 0;
    }
  }

  public boolean catchPokemon() { //Occurs when player throws ball, decides whether pokemon is caught or not. If pokemon is caught, caught is changed to true
    //Generate a random int between 0 and 511 inclusive. If it is less than catchRate, the Pokemon is caught.
    double n = Math.random() * 512;
    if (n < catchRate) {
      caught = true;
    }
    return caught;
  }

  public String[][] getPokes() {
    String[][] yes = new String[6][10];
    yes[0] = splitter(50);
    yes[1] = splitter(0);
    yes[2] = splitter(40);
    yes[3] = splitter(30);
    yes[4] = splitter(10);
    yes[5] = splitter(20);
    return yes;
  }
  
  private String[] splitter(int number){
    String[] temp = new String[10];
    for (int i = 0; i < 10; i ++){
      temp[i] = data[i + number][0];
    }
    return temp;
  }
  
  public boolean getCaught(){
    return caught;
  }

  public void display() {
    image(sprite, 272, 0);
  }
}