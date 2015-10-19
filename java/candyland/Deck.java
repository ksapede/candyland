package candyland;
import candyland.Card;
import java.util.*;

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
		if (this.deck.size() == 0) {
			System.out.println("Reshuffling Deck");
			reshuffle_deck();
		}
		Card drawn_card = this.deck.remove(0);
		this.discard.add(drawn_card);
		return drawn_card;

	}

	private void build_deck() {
		for (int loopCount = 0; loopCount < 6;loopCount++) {
			String[] colors = {"Red","Purple","Yellow","Blue","Orange","Green"};
			for (String color : colors) {
				//add single colors
				this.deck.add(new Card(color,null,1));
			}
		}
		for (int loopCount = 0; loopCount < 4;loopCount++) {
			String[] colors = {"Red","Purple","Yellow","Blue"};
			for (String color : colors ) {
				// add double colors
				this.deck.add(new Card(color,null,2));
			}
		}
		for (int loopCount = 0; loopCount < 3;loopCount++) {
			String[] colors = {"Orange","Green"};
			for (String color : colors) {
				// add the rest of the double colors
				this.deck.add(new Card(color,null,2));
			}
		}

		// add character cards
		this.deck.add(new Card("Pink","Plumpy",1));
		this.deck.add(new Card("Pink","Mr Mint",1));
		this.deck.add(new Card("Pink","Jolly",1));
		this.deck.add(new Card("Pink","Gramma Nutt",1));
		this.deck.add(new Card("Pink","Princess Lolly",1));
		this.deck.add(new Card("Pink","Queen Frostine",1));

	}

	private void shuffle_deck() {
		Collections.shuffle(this.deck);
		
	}

	private void reshuffle_deck() {
		this.deck = new ArrayList<Card>(this.discard);
		this.discard.clear();
		shuffle_deck();

	}
}