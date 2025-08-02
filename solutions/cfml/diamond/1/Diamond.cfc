component {
	
	A = Asc('A');
	
	/**
	* @returns a diamond shape based on the size and position of letter
	*/
	array function rows( letter ) {
		var diamond = [];
		var height = 1 + 2 * (Asc(letter) - A);
		for (var i = 0; i < height; i++) {
			var letterRow = (i < 1 + Asc(letter) - A) ? Chr(A + i) : Chr(A + height - i - 1);
			diamond.append(diamondRow( letter, letterRow ));
		}
		return diamond;
	}
		
	String function diamondRow(letter, letterRow) {
		var length = 1 + 2 * (Asc(letter) - A);
		var offset = Asc(letter) - Asc(letterRow);
		var line = "";
		for (var i = 0; i < length; i++) {
			line &= (i == offset) || (i == length - offset - 1) ? letterRow : " ";
		}
		return line;
	}
}