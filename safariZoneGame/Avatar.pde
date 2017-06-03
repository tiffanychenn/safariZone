public class Avatar{
  
  private String name;
  private ArrayList<PImage> sprites;
  //private ArrayList<Pokemon> caught;

  public Avatar(String name){
    this(name, true);
  }

  public Avatar(String name, boolean gender){
    this.name = name;
    PImage original;
    if (gender){
      original = loadImage("avatars/male.png");
    }
    else {
      original = loadImage("avatars/female.png");
    }
    sprites = new ArrayList<PImage>();
    for (int i = 0; i < 16; i ++){
      sprites.add(original.get(64 * (i / 4), 64 * (i % 4), 64, 64)); 
    }
    //caught = new ArrayList<Pokemon>();
  }
  
  void display(){
     for (int i = 0; i < sprites.size(); i ++){
       image(sprites.get(i), 64 * (i / 4), 64 * (i % 4));
     }
  }
  
  /*void addPoke(Pokemon p){
    caught.add(p);
  }*/

}