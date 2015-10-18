package candyland.Card;

public class Card {
	String color;
	String label;
	Int move_count;

	public Card(String card_color, String card_label, String card_move) {
		this.color = card_color;
		this.label = card_label;
		this.move_count = card_move;
	}

	public String to_string() {
		if (this.move_count == 1 && !(this.color.equals("Pink"))) {
			return "Single " + this.color;
		}
		else if (this.move_count == 2) {
			return "Double " + this.color;
		}
		else {
			return self.label;
		}
	}
}