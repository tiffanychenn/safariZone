public class Avatar{
  
  private String name;
  private ArrayList<PImage> sprites;
  private int x, y, direction;
  private int[] pics = {0, 0, 0, 0};
  private ArrayList<Pokemon> caught;

  public Avatar(String name){
    this(name, true);
  }

  public Avatar(String name, boolean gender){
    this.name = name;
    x = 0;
    y = 0;
    direction = 0;
    PImage original;
    if (gender){
      original = loadImage("avatars/male.png");
    }
    else {
      original = loadImage("avatars/female.png");
    }
    sprites = new ArrayList<PImage>();
    for (int i = 0; i < 16; i ++){
      sprites.add(original.get(64 * (i % 4), 64 * (i / 4), 64, 64)); 
    }
    //caught = new ArrayList<Pokemon>();
  }
  
  void display(boolean b){
    if (b) image(sprites.get(direction * 4 + pics[direction]).get(0, 0, 64, 43), x, y);
    else image(sprites.get(direction * 4 + pics[direction]), x, y);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  int getPicNumber(int i){
    return pics[i];
  }
  
  void setX(int i){
    x = i;
  }
  
  void setY(int i){
    y = i;
  }
  
  void setPic(int index, int i){
    pics[index] = i;
  }
  
  void setDirection(int i){
    direction = i;
  }
  
  void addPoke(Pokemon p){
    caught.add(p);
  }

}