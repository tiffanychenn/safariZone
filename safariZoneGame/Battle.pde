import java.util.*;

public class Battle {

  private Pokemon p;
  private PImage background;
  private int input, seconds;
  private boolean exit;

  public Battle(String name, int t) {
    p = new Pokemon(name);
    //chooses background based on terrain
    PImage backgrounds = loadImage("battle/backgrounds.png");
    ArrayList<PImage> backs = new ArrayList<PImage>();
    for (int i = 0; i < 4; i ++) {
      for (int j = 0; j < 3; j ++) {
        backs.add(backgrounds.get(j * 512, 290 * i + 34, 512, 256));
      }
    }
    ArrayList<PImage> temp = new ArrayList<PImage>();
    temp.add(backs.get(3));
    temp.add(backs.get(5));
    temp.add(backs.get(6));
    temp.add(backs.get(7));
    temp.add(backs.get(9));
    temp.add(backs.get(10));
    if (t == 0) background = temp.get(3);
    if (t == 1) background = temp.get(5);
    if (t == 2) background = temp.get(1);
    if (t == 3) background = temp.get(4);
    if (t == 4) background = temp.get(0);
    if (t == 5) background = temp.get(2);
    //loads pokemon and avatar images
    input = 0; // 0 is bait, 1 is mud, 2 is ball, 3 is run
    exit = false;
    seconds = millis();
  }

  public void display() {
    image(background, 0, 0);
    p.display();
  }

  public void keyPressed() { //WASD, enter
    if (keyCode == LEFT) {
      if (input == 1 || input == 3){
        input -= 1;
      }
    } else if (keyCode == DOWN) {
      if (input == 0 || input == 1) {
        input += 2;
      }
    } else if (keyCode == RIGHT) {
      if (input == 0 || input == 2) {
        input += 1;
      }
    } else if (keyCode == UP) {
      if (input == 2 || input == 3) {
        input -= 2;
      }
    } else if ((key == 13 || key == 10) && millis() - seconds > 250) {
      seconds = millis();
      if (input == 0) bait();
      if (input == 1) mud();
      if (input == 2) throwBall();
      if (input == 3) run();
    }
    println(input);
  }

  public void throwBall() { //throws ball
    if (p.catchPokemon()){
      println("Pokemon was caught!");
      exit = true;
    }
    else println("Pokemon was not caught!");
    pokemonRun();
  }

  public void bait() { //throws bait
    println("Bait was thrown!");
    p.changeRates("bait");
    pokemonRun();
  }

  public void mud() { //throws mud
    println("Mud was thrown!");
    p.changeRates("mud");
    pokemonRun();
  }

  public void run() {
    exit = true;
  }
  
  public void pokemonRun(){
    int n = (int)(Math.random() * 255);
    if(n < p.getRunRate()){
      exit = true;
      println("Pokemon ran!");
    }
    else println("Pokemon did not run!");
  }
  
  public boolean getExit(){
    return exit;
  }
  
  public Pokemon getPoke(){
    return p;
  }
  
}