public class Select {

  private PImage brendan, rosa, arrow;
  private int seconds;
  private boolean choice, exit;

  public Select() {
    brendan = loadImage("avatars/brendanfull.png");
    rosa = loadImage("avatars/rosafull.png");
    arrow = loadImage("avatars/arrow.png");
    seconds = millis();
    choice = true;
    exit = false;
  }

  public void display() {
    background(255);
    image(brendan, 60, 96);
    image(rosa, 322, 96);
    if (choice) {
      image(arrow, 125, 40);
    } else {
      image(arrow, 345, 40);
    }
  }

  public void keyPressed() {
    if (keyCode == LEFT) {
      choice = true;
    }
    if (keyCode == RIGHT) {
      choice = false;
    }
    if (key == 13 || key == 10 && millis() - seconds > 750) {
      exit = true;
    }
  }

  public boolean getChoice() {
    return choice;
  }

  public boolean getExit() {
    return exit;
  }
}