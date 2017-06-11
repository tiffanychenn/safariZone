public class Pokedex {

  int current;
  Avatar a;
  PImage background;
  PShape name, photo;

  public Pokedex(Avatar av) {
    background = loadImage("pokedex/background.jpg");
    a = av;
    name = createShape(RECT, 156, 10, 200, 20);
    photo = createShape(RECT, 196, 132, 120, 120);
  }

  void display() {
    image(background, 0, 0);
    shape(name);
    shape(photo);
    if (a.getCaught().size() > 0) {
      image(a.getCaught().get(current).getSprite(), 196, 132);
      text("Name: " + a.getCaught().get(current).getName(), 160, 24);
    }
  }
}