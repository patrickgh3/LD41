///scrDrawTextOutlineScale(x,y,string,textcolor,outlinecolor, scale)
// This script is from IWBT Studio engine YoYoYo Edition: http://iwannacommunity.com/forum/index.php?topic=1852.0
///draws any text with an outline
///argument0 - text X position
///argument1 - text Y position
///argument2 - text string
///argument3 - color of the text inside the outline
///argument4 - color of the text outline

var textX = argument0;
var textY = argument1;
var textStr = argument2;
var textColor = argument3;
var outlineColor = argument4;
var scale = argument5

//draw the text outline
draw_set_color(outlineColor);
draw_text_transformed(textX-scale,textY+scale,textStr, scale, scale, 0);
draw_text_transformed(textX-scale,textY,textStr, scale, scale, 0);
draw_text_transformed(textX-scale,textY-scale,textStr, scale, scale, 0);
draw_text_transformed(textX+scale,textY+scale,textStr, scale, scale, 0);
draw_text_transformed(textX+scale,textY,textStr, scale, scale, 0);
draw_text_transformed(textX+scale,textY-scale,textStr, scale, scale, 0);
draw_text_transformed(textX,textY+scale,textStr, scale, scale, 0);
draw_text_transformed(textX,textY-scale,textStr, scale, scale, 0);

//draw the text itself
draw_set_color(textColor);
draw_text_transformed(textX,textY,textStr, scale, scale, 0);

