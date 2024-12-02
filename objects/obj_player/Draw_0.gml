/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x_draw=lerp(x_draw,obj_grid_manager.grid_start[0]+obj_grid_manager.tile_size*position[0],0.2)
y_draw=lerp(y_draw,obj_grid_manager.grid_start[1]+obj_grid_manager.tile_size*position[1],0.2)


draw_sprite_ext(sprite,image_index,x_draw,y_draw,1,1,0,draw_color,1);