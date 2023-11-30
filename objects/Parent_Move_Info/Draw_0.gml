draw_self();

stats_spaced = 0;

draw_text(x+128, y, info);
draw_text(x+256+stat_spacing*stats_spaced, y, startup);
stats_spaced++;
draw_text(x+256+stat_spacing*stats_spaced, y, recovery);
stats_spaced++;
draw_text(x+256+stat_spacing*stats_spaced, y, hit_stun);
stats_spaced++;
draw_text(x+256+stat_spacing*stats_spaced, y, block_stun);
stats_spaced++;

if(is_projectile){
	draw_sprite(Spr_Projectile_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(is_high){
	draw_sprite(Spr_High_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(is_low){
	draw_sprite(Spr_Low_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(is_high){
	draw_sprite(Spr_High_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(is_launcher){
	draw_sprite(Spr_Launcher_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(is_cancelable){
	draw_sprite(Spr_Cancelable_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(is_final){
	draw_sprite(Spr_Final_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(air_ok){
	draw_sprite(Spr_Air_Ok_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(meter_cost > 0){
	draw_text(x+256+stat_spacing*stats_spaced, y, meter_cost + "%");
	draw_sprite(Spr_Metercost_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
if(penetration > 0){
	draw_text(x+256+stat_spacing*stats_spaced, y, string(penetration*100) + "%");
	draw_sprite(Spr_Penetration_Symbol, 0, x+256+stat_spacing*stats_spaced, y);
	stats_spaced++;
}
