import java.util.*;

public class Battle {

  private Pokemon p;
  private PImage background;

  public Battle(String name, int t) {
    p = new Pokemon(name);
    //chooses background based on terrain
    PImage backgrounds = loadImage("battle/backgrounds.png");
    ArrayList<PImage> backs = new ArrayList<PImage>();
    for (int i = 0; i < 4; i ++){
      for (int j = 0; j < 3; j ++){
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
  }

  public void display() {
    image(background, 0, 0);
    p.display();
  }

  public void keyPressed() { //WASD, enter
  }

  public void throwBall() { //throws ball
    p.catchPokemon();
  }

  public void bait() { //throws bait
    p.changeRates("bait");
  }

  public void mud() { //throws mud
    p.changeRates("mud");
  }

  public void run() { //runs from battle. always 100%
  }
}