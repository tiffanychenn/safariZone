public class Simulation {

  //remember to change move() if size becomes bigger!
  
  Avatar a;
  int terrain, seconds, direction;
  ArrayList<PImage> terrains;
  boolean moving, welp, battle;
  Battle b;
  String[] pokes;

  public Simulation() {
    a = new Avatar("Dawn", false);
    terrains = new ArrayList<PImage>();
    terrains.add(loadImage("terrains/ocean.png"));
    terrains.add(loadImage("terrains/desert.png"));
    terrains.add(loadImage("terrains/meadow.png"));
    terrains.add(loadImage("terrains/forest.png"));
    terrains.add(loadImage("terrains/snow.png"));
    terrains.add(loadImage("terrains/cave.png"));
    terrain = 0;
    moving = false;
    welp = false;
    seconds = millis();
    direction = 0;
    battle = false;
    Pokemon p = new Pokemon("Lapras");
    pokes = p.getPokes();
  }

  void update() {
    if (battle) battle();
    if (keyPressed) keyPressed();
    if (moving) move();
    for (int i = 0; i < 64; i ++) {
      image(terrains.get(terrain), 64 * (i / 8), 64 * (i % 8));
    }
  }

  void move() {
    if (millis() - seconds > 150 || welp) {
      if (direction == 1) a.setX(a.getX() - 32);
      else if (direction == 0) a.setY(a.getY() + 32);
      else if (direction == 2) a.setX(a.getX() + 32);
      else a.setY(a.getY() - 32);
      a.setDirection(direction);
      a.setPic(direction, (a.getPicNumber(direction) + 1) % 4);
      welp = false;
    }
    if (millis() - seconds > 150){
      moving = false;
      if ((int)(Math.random() * 10) < 1){
        battle = true;
        System.out.println("battle!");
      }
    }
  }

  void keyPressed() {
    if (key == '1') terrain = 0;
    else if (key == '2') terrain = 1;
    else if (key == '3') terrain = 2;
    else if (key == '4') terrain = 3;
    else if (key == '5') terrain = 4;
    else if (key == '6') terrain = 5;
    if (moving == false){
        if (key == 'A' || key == 'a') {
        if (a.getX() >= 64) {
          moving = true;
          welp = true;
          direction = 1;
          seconds = millis();
        }
      } else if (key == 'S' || key == 's') {
        if (a.getY() <= 384) {
          moving = true;
          welp = true;
          direction = 0;
          seconds = millis();
        }
      } else if (key == 'D' || key == 'd') {
        if (a.getX() <= 384) {
          moving = true;
          welp = true;
          direction = 2;
          seconds = millis();
        }
      } else if (key == 'W' || key == 'w') {
        if (a.getY() >= 64) {
          moving = true;
          welp = true;
          direction = 3;
          seconds = millis();
        }
      }
    }
  }

  void display() {
    if (terrain == 0) a.display(true);
    else a.display(false);
  }
}