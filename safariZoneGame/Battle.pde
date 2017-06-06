import java.util.*;

public class Battle {

  private Pokemon p;
  //private PImage background;

  public Battle(String name, int t) {
    p = new Pokemon(name);
    //chooses background based on terrain

    //loads pokemon and avatar images
  }

  public void display() {
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