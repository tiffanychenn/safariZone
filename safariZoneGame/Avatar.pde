public class Avatar{
  
  private String name;
  private ArrayList<PImage> sprites;
  private ArrayList<Pokemon> caught;

  public Avatar(String name){
    this(name, true);
  }

  public Avatar(String name, boolean gender){
    this.name = name;
    if (gender){
      
    }
    else {
    
    }
    caught = new ArrayList<Pokemon>();
  }

}