event_inherited();

// Methods
// No winning in Dojo!
check_for_winner = function(){
	// Dummy guy has index -1 so gotta do some wierd looping here
	for(i = 0; i < instance_number(Parent_Character); i++){
		obj = instance_find(Parent_Character, i);
		obj.hearts = 3;
	}
}