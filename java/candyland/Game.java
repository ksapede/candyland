package candyland;
import candyland.*;
import java.util.*;

public class Game {
	List<Player> players;
	Board board;
	Deck deck;
	String winner;
	int player_count;
	public Game(int player_count) {
		this.player_count = player_count;
		this.winner = "None";

		players = new ArrayList<Player>();
		String[] game_peices = {"Red","Blue","Green","Yellow"};
		for (int i = 0; i < this.player_count;i++) {
			Player p = new Player(game_peices[i]);
			this.players.add(p);
		}

		this.board = new Board();
		this.deck = new Deck();

	}

	public int play_game() {
		int rounds = 0;
		while (this.winner.equals("None")) {
			rounds++;
			play_round();
		}
		System.out.println(this.winner + " wins after " + rounds + " rounds!");
		return rounds;

	}

	private void play_round() {
		for (Player p : this.players) {
			play_turn(p);
			if (p.position >= (this.board.board_length - 1)) {
				this.winner = p.name;
				break;
			}
		}

	}

	private void play_turn(Player p) {
		//System.out.println(p.stuck);
		if (!p.stuck) {
			Card card = this.deck.draw_card();
			move_token(p,card);
			int print_postion = p.position + 1;
			//System.out.println(print_postion);

			System.out.println(p.name + " drew " + card.to_string() + " and moves to space " + print_postion + " which is " + this.board.get_space_from_positon(p.position).color);
		}
		else {
			System.out.println(p.name + " is stuck! Skipping turn!");
			p.stuck = false;
		}


	}

	private void move_token(Player p, Card card) {
		boolean stuck = false;
		int current_postion = p.position;
		for (int m = 0; m < card.move_count;m++) {
			int next_space;

			if (card.color.equals("Pink")) {
				next_space = 0;
			}
			else if (current_postion == 0) {
				 next_space = 0;
			}
			else {
				next_space = current_postion + 1;
			}


			for (int i = next_space; i < this.board.board_length; i++) {
				Space current_space = this.board.get_space_from_positon(i);
				if (current_space.color.equals(card.color) || current_space.color.equals("All")) {
					if (current_space.color.equals("Pink") && current_space.label.equals(card.label)) {
						current_postion = i;
						break;
					}
					else if (current_space.label != null && current_space.label.equals("Rainbow Trail")) {
						current_postion = i + 55;
						break;
					}
					else if (current_space.label != null && current_space.label.equals("Gumdrop Pass")) {
						current_postion = i + 14;
					}
					else if (!(current_space.color.equals("Pink"))) {
						current_postion = i;
						if (current_space.label != null && current_space.label.equals("Sticky")) {
							stuck = true;
						}
						break;
					}
				}
			}
			p.position = current_postion;
			//System.out.println("Changing stuck to " + p.stuck);
			p.stuck = stuck;
		}

	}
}