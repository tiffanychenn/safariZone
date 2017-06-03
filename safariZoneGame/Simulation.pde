public class Simulation{
  
  Avatar a;
  int terrain;
  ArrayList<PImage> terrains;

  public Simulation(){
    a = new Avatar("Dawn");
    terrains = new ArrayList<PImage>();
    terrains.add(loadImage("terrains/ocean.png"));
    terrains.add(loadImage("terrains/desert.png"));
    terrains.add(loadImage("terrains/meadow.png"));
    terrains.add(loadImage("terrains/forest.png"));
    terrains.add(loadImage("terrains/snow.png"));
    terrains.add(loadImage("terrains/cave.png"));
    terrain = 0;
  }
  
  void update(){
    for (int i = 0; i < 16; i ++){
      image(terrains.get(terrain), 64 * (i / 4), 64 * (i % 4));
    }
    if (keyPressed) keyPressed();
  }
  
  void keyPressed(){
    if (key == '1') terrain = 0;
    else if (key == '2') terrain = 1;
    else if (key == '3') terrain = 2;
    else if (key == '4') terrain = 3;
    else if (key == '5') terrain = 4;
    else if (key == '6') terrain = 5;
    else if (key == 'A' || key == 'a'){
    }
    else if (key == 'S' || key == 's'){
    }
    else if (key == 'D' || key == 'd'){
    }
    else if (key == 'W' || key == 'w'){
    }
  }
  
  void display(){
    if (terrain == 0) a.display(true);
    else a.display(false);
  }
  
}