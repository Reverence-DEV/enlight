var MoveDIR = keyboard_check(val_KeyRight) - keyboard_check(val_KeyLeft)

val_Hspeed += MoveDIR * val_Mspeed

if val_Hspeed != 0
{
	image_xscale = sign(val_Hspeed)
}
/*
if keyboard_check(val_KeyRight) == true or keyboard_check(val_KeyLeft) == true
{
	object_set_sprite(Obj_Player, Spr_Player_Null_Move)	
}
else { object_set_sprite(Obj_Player, Spr_Player_Null) }*/
if place_meeting(x, y + 1, Obj_Platform)
{
	if keyboard_check(val_KeyJump)
	{
		val_Charge += val_CSpeed
		val_Charge = min(val_Charge, val_MaxCharge)
	}
	else if val_Charge != 0
	{
		val_Hspeed += val_Charge / val_MaxCharge * val_JHspeed * image_xscale
		val_Vspeed += val_Charge / val_MaxCharge * val_JVspeed
		
		val_Charge = 0
		audio_play_sound(Sound_Jump01, 0, 0)
	}
}

if place_meeting(x, y + 1, Obj_DangerObject)
{
	audio_pause_sound(NightOwl)
	audio_play_sound(Sound_GameOver, 0, 0)
	room_restart()
}

if place_meeting(x, y, Obj_Platform)
{
	audio_pause_sound(NightOwl)
	audio_play_sound(Sound_GameOver, 0, 0)
	room_restart()
}

if showmethemoney == true {
	if mouse_check_button(mb_left)
	{	
		alarm[0] = 15
		var MouseDIR = point_direction(x, y, mouse_x, mouse_y)
		instance_create_layer(x + lengthdir_x(32, MouseDIR), y + lengthdir_y(32, MouseDIR), layer, Obj_Attack)
		var Effect3 = instance_create_layer(x, y, layer, Obj_AttackEffect3)
		Effect3.image_angle = MouseDIR
		Effect3.direction = MouseDIR
	
	}
}
else
{
	if mouse_check_button(mb_left) and Attdelay == true
	{	
		alarm[0] = 15
		var MouseDIR = point_direction(x, y, mouse_x, mouse_y)
		instance_create_layer(x + lengthdir_x(32, MouseDIR), y + lengthdir_y(32, MouseDIR), layer, Obj_Attack)
		var Effect3 = instance_create_layer(x, y, layer, Obj_AttackEffect3)
		Effect3.image_angle = MouseDIR
		Effect3.direction = MouseDIR
	
		Attdelay = false
	}
}



if val_HP <= 0
{
	val_HP = val_MaxHP
	audio_pause_sound(NightOwl)
	audio_play_sound(Sound_GameOver, 0, 0)
	room_restart()
}

event_inherited();