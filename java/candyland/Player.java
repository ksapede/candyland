package candyland.Game;

public class Player {
	String name;
	Int position;
	Bool stuck;

	public Player(String player_name) {
		this.name = player_name;
		this.position = -1;
		this.stuck = false;
	}

}