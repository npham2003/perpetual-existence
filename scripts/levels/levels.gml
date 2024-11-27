// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


global.levels = {
	test: {
		size: [10, 10],
		player: [0,0],
		wall: [[3,3], [2,2], [2,3]],
		warp: [[[4,5], [3,0]]],
		box_stasis: [[1,1], [6, 7]],
		box_normal: [[5,6]],
		hole:[[5,5]],
		switches: [[[6,6], [7,7]]]
	},
	
	mockup: {
		size: [7, 6],
		player: [0,5],
		wall: [[1,0], [1,1], [1,2], [2,2], [2,3], [2,5], [3,2], [3,1], [3,0], [4,2], [5,2], [6,2], [6,3], [6,4], [6,5]],
		warp: [[[0,0], [4,0]]],
		box_stasis: [[1,4]],
		box_normal: [],
		hole:[[2,4]],
		switches: [[[4,4], [0,2]]],
		stairs: [6,0]
	}
	
	
}


global.warp_colors = [c_fuchsia];

global.switch_colors = [c_yellow];