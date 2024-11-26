/// @description Insert description here
// You can write your code in this editor

if(input_check_pressed("time") && time_turns_left>0){
	time_stop=!time_stop;
	layer_set_visible(layer_get_id("Effect_1"), time_stop)
	if(!time_stop){
		obj_grid_manager.force_update_switches();
		obj_player.release_boxes();
		obj_grid_manager.force_update_switches();
		with (obj_box_stasis){
				final_resume();
		}
		
	}
}

if(time_turns_left==0){
	time_stop=false;
	layer_set_visible(layer_get_id("Effect_1"), time_stop)
	obj_grid_manager.force_update_switches();
	obj_player.release_boxes();
	obj_grid_manager.force_update_switches();
	with (obj_box_stasis){
			final_resume();
	}
}

if(input_check_pressed("reset")){
	room_restart()	
}