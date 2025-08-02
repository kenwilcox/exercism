/**
* Your implementation of the Acronym exercise
*/
component {
	
	/**
	* @returns 
	*/
	 function abbreviate( phrase ) {
		words = replace(phrase, "-", " ").split(' ');
		acro='';
		for(i = 1; i < len(words)+1; i++) {
			acro &= left(words[i], 1);
		}
		return uCase(acro);
	}
	
}