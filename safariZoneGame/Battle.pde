import java.util.*;

public class Battle {

  private Pokemon p;
  private PImage background;
  private int input, seconds, currentText;
  private boolean exit, pause;
  private final ArrayList<PImage> text;

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
    pause = false;
    seconds = millis();
    text = new ArrayList<PImage>();
    text.add(loadImage("text/textBoxBait.png"));
    text.add(loadImage("text/textBoxMud.png"));
    text.add(loadImage("text/textBoxBall.png"));
    text.add(loadImage("text/textBoxRun.png"));
    text.add(loadImage("text/throwBait.png"));
    text.add(loadImage("text/throwMud.png"));
    text.add(loadImage("text/throwBall.png"));
    text.add(loadImage("text/runAvatar.png"));
    text.add(loadImage("text/runPokemon.png"));
    text.add(loadImage("text/caughtYes.png"));
    text.add(loadImage("text/caughtNo.png"));
    text.add(loadImage("text/stay.png"));
    currentText = 0;
  }

  public void display() {
    image(background, 0, 0);
    image(text.get(currentText), 0, 256);
    p.display();
    if (pause && millis() - seconds > 1000){
      seconds = millis();
      pause = false;
      if (currentText == 4 || currentText == 5 || currentText == 10){
        pokemonRun();
        pause = true;
      }
      else if (currentText == 6){
        pause = true;
        catchPokemon();
      }
      else {
        currentText = 0;
        input = 0;
      }
    }
  }

  public void keyPressed() { //WASD, enter
    if (keyCode == LEFT) {
      if (input == 1 || input == 3){
        input -= 1;
        currentText -= 1;
      }
    } else if (keyCode == DOWN) {
      if (input == 0 || input == 1) {
        input += 2;
        currentText += 2;
      }
    } else if (keyCode == RIGHT) {
      if (input == 0 || input == 2) {
        input += 1;
        currentText += 1;
      }
    } else if (keyCode == UP) {
      if (input == 2 || input == 3) {
        input -= 2;
        currentText -= 2;
      }
    } else if (key == 13 || key == 10) {
      seconds = millis();
      if (input == 0) bait();
      if (input == 1) mud();
      if (input == 2) throwBall();
      if (input == 3) run();
      pause = true;
    }
  }

  public void throwBall() { //throws ball
    currentText = 6;
  }

  public void catchPokemon(){
    if (p.catchPokemon()){
      currentText = 9;
      exit = true;
    }
    else{
      currentText = 10;
    }
  }

  public void bait() { //throws bait
    p.changeRates("bait");
    currentText = 4;
  }

  public void mud() { //throws mud
    p.changeRates("mud");
    currentText = 5;
  }

  public void run() {
    currentText = 7;
    exit = true;
  }
  
  public void pokemonRun(){
    int n = (int)(Math.random() * 255);
    if(n < p.getRunRate()){
      exit = true;
      currentText = 8;
    }
    else {
      currentText = 11;
    }
  }
  
  public boolean getExit(){
    return exit;
  }
  
  public Pokemon getPoke(){
    return p;
  }
  
  public boolean getPause(){
    return pause;
  }
  
}