public class Simulation {

  //remember to change move() if size becomes bigger!

  Avatar a;
  int terrain, seconds, direction;
  ArrayList<PImage> terrains;
  boolean moving, start, battle;
  Battle b;
  String[][] pokes;

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
    start = false;
    seconds = millis();
    direction = 0;
    battle = false;
    Pokemon p = new Pokemon("Lapras");
    pokes = p.getPokes();
  }

  void update() {
    if (battle) {
      b.display();
      if (!b.getPause()) {
        if (b.getExit()) {
          battle = false;
        }
        if (keyPressed) b.keyPressed();
        if (b.getPoke().getCaught()) a.addPoke(b.getPoke());
      }
    } else {
      if (keyPressed) keyPressed();
      if (moving) move();
      for (int i = 0; i < 64; i ++) {
        image(terrains.get(terrain), 64 * (i / 8), 64 * (i % 8));
      }
      println(a);
    }
  }

  void move() {
    if (millis() - seconds > 150 || start) {
      if (direction == 1) a.setX(a.getX() - 32);
      else if (direction == 0) a.setY(a.getY() + 32);
      else if (direction == 2) a.setX(a.getX() + 32);
      else a.setY(a.getY() - 32);
      a.setDirection(direction);
      a.setPic(direction, (a.getPicNumber(direction) + 1) % 4);
      start = false;
    }
    if (millis() - seconds > 150) {
      moving = false;
      if ((int)(Math.random() * 10) < 1) {
        battle = true;
        System.out.println("battle!");
        int number = (int)(Math.random() * 100);
        if (number < 11) b = new Battle(pokes[terrain][0], terrain);
        else if (number < 22) b = new Battle(pokes[terrain][1], terrain);
        else if (number < 33) b = new Battle(pokes[terrain][2], terrain);
        else if (number < 44) b = new Battle(pokes[terrain][3], terrain);
        else if (number < 55) b = new Battle(pokes[terrain][4], terrain);
        else if (number < 66) b = new Battle(pokes[terrain][5], terrain);
        else if (number < 77) b = new Battle(pokes[terrain][6], terrain);
        else if (number < 88) b = new Battle(pokes[terrain][7], terrain);
        else if (number < 99) b = new Battle(pokes[terrain][8], terrain);
        else b = new Battle(pokes[terrain][9], terrain);
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
    if (moving == false) {
      if (keyCode == LEFT) {
        if (a.getX() >= 64) {
          moving = true;
          start = true;
          direction = 1;
          seconds = millis();
        }
      } else if (keyCode == DOWN) {
        if (a.getY() <= 256) {
          moving = true;
          start = true;
          direction = 0;
          seconds = millis();
        }
      } else if (keyCode == RIGHT) {
        if (a.getX() <= 384) {
          moving = true;
          start = true;
          direction = 2;
          seconds = millis();
        }
      } else if (keyCode == UP) {
        if (a.getY() >= 64) {
          moving = true;
          start = true;
          direction = 3;
          seconds = millis();
        }
      }
    }
  }

  void display() {
    if (!battle) {
      if (terrain == 0) a.display(true);
      else a.display(false);
    } else {
      a.displayBack();
    }
  }
}