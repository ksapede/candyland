package candyland;

public class Player {
	String name;
	int position;
	boolean stuck;

	public Player(String player_name) {
		this.name = player_name;
		this.position = -1;
		this.stuck = false;
	}

}