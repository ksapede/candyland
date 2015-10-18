package candyland.Deck;
import candyland.Card;

public class Deck {
	List<Card> deck;
	List<Card> discard;

	public Deck() {
		deck = new ArrayList<Card>();
		discard = new ArrayList<Card>();

		build_deck();
		shuffle_deck();
	}

	public Card draw_card() {

	}

	private void build_deck() {

	}

	private void shuffle_deck() {

	}

	private void reshuffle_deck() {

	}
}