public class Pokedex {

  int current;
  Avatar a;
  PImage background;
  PShape name, photo, description, prev, next;

  public Pokedex(Avatar av) {
    background = loadImage("pokedex/background.jpg");
    a = av;
    name = createShape(RECT, 156, 50, 200, 20);
    photo = createShape(RECT, 196, 100, 120, 120);
    description = createShape(RECT, 106, 252, 300, 80);
    prev = createShape(TRIANGLE, 20, 162, 60, 177, 60, 147);
    next = createShape(TRIANGLE, 492, 162, 452, 177, 452, 147);
  }
  
  void keyPressed(){
    if (keyCode == RIGHT) current = (current + 1) % a.getCaught().size();
    else if (keyCode == LEFT) current = ((current - 1) + a.getCaught().size()) % a.getCaught().size();
  }

  void display() {
    image(background, 0, 0);
    shape(name);
    shape(photo);
    shape(description);
    shape(prev);
    shape(next);
    fill(0);
    text("prev", 30, 142);
    text("next", 457, 142);
    text("POKEDEX", 230, 24);
    if (a.getCaught().size() > 0) {
      image(a.getCaught().get(current).getSprite(), 196, 100);
      text("Name: " + a.getCaught().get(current).getName(), 160, 65);
      text(a.getCaught().get(current).getPokedex(), 110, 260, 292, 64);
    }
  }
}