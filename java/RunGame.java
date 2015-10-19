import candyland.Game;

public class RunGame {
	public static void main(String[] args) {
		System.out.println("Hello");
		int players;
		do {
			System.out.println("Number of players (4 max)?");
			players = Integer.parseInt(System.console().readLine());
		} while (players > 4);

		Game mygame = new Game(players);
		mygame.play_game();

	}
}