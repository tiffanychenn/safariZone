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
			// import male pics
		}
		else {} // import female pics
		caught = new ArrayList<Pokemon>();
	}

}