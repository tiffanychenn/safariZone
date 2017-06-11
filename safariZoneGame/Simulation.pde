public class Simulation {

  //remember to change move() if size becomes bigger!

  Avatar a;
  int terrain, seconds, direction, tNum;
  ArrayList<PImage> terrains;
  boolean moving, start, battle, transition1, transition2, legend, pokedex;
  Battle b;
  Pokedex p;
  String[][] pokes;
  //used for screenwipe transition
  int transitionType;
  MyShape l = new MyShape(0, 0, -512, 384, 0); //left wipe
  MyShape c = new MyShape(256, 192, 640, 640, 0, 0, 1); //circle wipe 1
  MyShape c1 = new MyShape(256, 192, 640, 640, PI, PI, 1); //circle wipe 2, double circle wipe with c
  //used for battle opening transition
  boolean once = true;
  MyShape top = new MyShape(0, 192, 512, -192, 0);
  MyShape bot = new MyShape(0, 192, 512, 192, 0);

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
    legend = false;
    Pokemon poke = new Pokemon("Lapras");
    pokes = poke.getPokes();
    transition1 = true;
    transition2 = true;
    tNum = 0;
    pokedex = false;
    p = new Pokedex(a);
  }

  void update() {
    if (!pokedex) {
      if (battle) {
        if (transition1) { //screenwipe transition
          if (terrain == 0) a.display(true);
          else a.display(false);
          if (transitionType == 0) { //left wipe
            l.display();
            if (l.getX() < 520) {
              l.incrementX(4);
              //System.out.println(l.getX());
            } else {
              transition1 = false;
            }
          } else if (transitionType == 1) { //circle wipe 1
            c.display();
            if (c.getE() < 2*PI) {
              c.incrementE((2*PI)/128);
              //System.out.println(c.getE());
            } else {
              transition1 = false;
            }
          } else if (transitionType == 2) { //circle wipe 2
            c1.display();
            if (c1.getE() < 3*PI) {
              c1.incrementE((2*PI)/128);
              //System.out.println(c.getE());
            } else {
              transition1 = false;
            }
          } else if (transitionType == 3) { //double circle wipe, legendaries only
            c.display();
            c1.display();
            if (c.getE() < PI || c1.getE() < 2*PI) {
              c.incrementE((2*PI)/128);
              c1.incrementE((2*PI)/128);
              //System.out.println(c.getE());
              //System.out.println(c1.getE());
            } else {
              transition1 = false;
            }
          }
        } else if (transition2) { //battle opening transition
          if (once) { //delays a bit at the start
            delay(750);
            once = false;
          }
          if (!l.getReset()) {
            l.reset();
            l.display();
          }
          if (!c.getReset()) {
            c.reset();
            c.display();
          }
          if (!c1.getReset()) {
            c1.reset();
            c1.display();
          }
          b.display();
          a.displayBack();
          top.display();
          bot.display();
          if (top.getY() > -1 || bot.getY() < 384) {
            top.incrementY(-3);
            bot.incrementY(3);
            //System.out.println(top.getY());
            //System.out.println(bot.getY());
          } else {
            transition2 = false;
          }
        } else {
          b.display();
          if (!b.getPause()) {
            if (b.getExit()) {
              battle = false;
              //resets animation statuses
              transition1 = true;
              transition2 = true;
              top.reset();
              bot.reset();
            }
            if (keyPressed) b.keyPressed();
            if (b.getPoke().getCaught()) a.addPoke(b.getPoke());
          }
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
        legend = false;
        System.out.println("battle!");
        //randomly chooses screenwipe type
        int t = (int)(Math.random() * 3);
        transitionType = t;
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
        else {
          b = new Battle(pokes[terrain][9], terrain);
          legend = true;
          transitionType = 3;
        }
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
    else if (key == 'l' || key == 'L') {
      b = new Battle(pokes[terrain][9], terrain);
      battle = true;
      legend = true;
      transitionType = 3;
    } else if (key == 'p' || key == 'P') {
      pokedex = true;
    }
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
    } else if (battle && !transition2) {
      a.displayBack();
    }
    if (pokedex){
      p.display();
    }
  }

  int updateMusic() {
    if (battle) {
      if (legend) return 7;
      else return 6;
    } else return terrain;
  }
}