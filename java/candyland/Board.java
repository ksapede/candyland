package candyland;
import candyland.Space;
import java.util.*;

public class Board {
	int color_index;
	int board_length;
	List<Space> board;

	public Board() {
		this.board  = new ArrayList<Space>();
		this.board_length = 0;
		this.color_index = 0;		
		build();

	}

	public Space get_space_from_positon(int position) {
		return this.board.get(position);

	}

	private void build() {
		

		add_space(4,null,null);
		add_space(1,null,"Rainbow Trail");
		add_space(3,null,null);
		add_space(1,"Pink","Plumpy");
		add_space(8,null,null);
		add_space(1,"Pink","Mr Mint");
		add_space(15,null,null);
		add_space(1,null,"Gumdrop Pass");
		add_space(8,null,null);
		add_space(1,"Pink","Jolly");
		add_space(4,null,null);
		add_space(1,null,"Sticky");
		add_space(26,null,null);
		add_space(1,"Pink","Gramma Nutt");
		add_space(10,null,null);
		add_space(1,null,"Sticky");
		add_space(9,null,null); //95 spaces
		add_space(1,"Pink","Princess Lolly");
		add_space(7,null,null);
		add_space(1,"Pink","Queen Frostine");
		add_space(16,null,null);
		add_space(1,null,"Sticky");
		add_space(12,null,null);
		add_space(1,"All","End");

	}

	private void add_space(int space_count, String color, String label) {
		String[] colors = {"Red","Purple","Yellow","Blue","Orange","Green"};
		int start_color = this.color_index;
		for (int i = 0; i < space_count;i++) {
			int n = (i + start_color) % 6;
			Space space;
			if (color != null && label != null) {
				space = new Space(color,label);
				this.board.add(space);
			}
			else {
				space = new Space(colors[n],label);
				this.board.add(space);
			}
			System.out.println("Space " + this.board_length + " is " + space.color + " " + space.label);
			this.color_index = n;
			this.board_length++;
		}

	}


}