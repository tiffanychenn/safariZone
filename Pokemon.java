public class Pokemon{

    String[][] data;

    public Pokemon(){
	ArrayList<String> lines = new ArrayList<String>();
	try{
	    Scanner in = new Scanner(new File(filename));
	    while(in.hasNext()){
		lines.add(in.nextLine());
	    }
	}catch(FileNotFoundException e){
	    System.out.println("File not found: "+filename);
	    System.exit(1);
	}
	data = new String[60][5];
	for(int i = 0; i < lines.size(); i++){
	    String[] temp = lines.get(i+1).split(",");
	    for(int j = 0; j < temp.length; j++){
		data[i][j] = temp[j];
	    }
	}
    }
    
    public String toString(){
	String s = "";
	for(int r = 0; r < data.length; r++){
	    for(int c = 0; c < data[0].length; c++){
		s = s "[" + maze[r][c] + "] ";
	    }
	    s += '\n';
	}
	return s;
    }

    public static void main(String[]args){
	P = new Pokemon("pokemon.txt");
	System.out.println(f);
    }
    
}
