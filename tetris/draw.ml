module G = Graphics

let tile_size = 15
let filled_size = 11
let padding = 2

let shape1 (z:unit) x y=  begin
  G.set_color G.cyan;
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 30) (y-30) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 45) (y-30) tile_size tile_size;
  G.fill_rect (x+45+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape1a (z:unit) x y=  begin
  G.set_color G.cyan;
  G.set_line_width 1;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-45) tile_size tile_size;
  G.fill_rect (x+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x) (y-60) tile_size tile_size;
  G.fill_rect (x+padding) (y-60+padding) filled_size filled_size;
  ()
end

let shape1b (z:unit) x y=  begin
  G.set_color G.cyan;
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 30) (y-30) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 45) (y-30) tile_size tile_size;
  G.fill_rect (x+45+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape1c (z:unit) x y=  begin
  G.set_color G.cyan;
  G.set_line_width 1;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-45) tile_size tile_size;
  G.fill_rect (x+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x) (y-60) tile_size tile_size;
  G.fill_rect (x+padding) (y-60+padding) filled_size filled_size;
  ()
end


let shape2 (z:unit) x y = begin
  G.set_color G.blue;
  G.set_line_width 1;

  G.draw_rect x (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x + 30) (y-30) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape2a (z:unit) x y = begin
  G.set_color G.blue;
  G.set_line_width 1;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-15) tile_size tile_size;
  G.fill_rect (x+padding-15) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-30) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-45) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-45+padding) filled_size filled_size;
  ()
end

let shape2b (z:unit) x y = begin
  G.set_color G.blue;
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-15) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-30) (y-15) tile_size tile_size;
  G.fill_rect (x-30+padding) (y-15+padding) filled_size filled_size;
  ()
end

let shape2c (z:unit) x y = begin
  G.set_color G.blue;
  G.set_line_width 1;

  G.draw_rect (x+15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-15) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x+15) (y) tile_size tile_size;
  G.fill_rect (x+15+padding) (y+padding) filled_size filled_size;
  ()
end

let shape3 (z:unit) x y = begin
  G.set_color (G.rgb 255 140 0);
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+30) (y-30) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+30) (y-15) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-15+padding) filled_size filled_size;
  ()
end

let shape3a (z:unit) x y = begin
  G.set_color (G.rgb 255 140 0);
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-45) tile_size tile_size;
  G.fill_rect (x+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x) (y-60) tile_size tile_size;
  G.fill_rect (x+padding) (y-60+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-60) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-60+padding) filled_size filled_size;
  ()
end

let shape3b (z:unit) x y = begin
  G.set_color (G.rgb 255 140 0);
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-30) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-30) (y-30) tile_size tile_size;
  G.fill_rect (x-30+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-30) (y-45) tile_size tile_size;
  G.fill_rect (x-30+padding) (y-45+padding) filled_size filled_size;
  ()
end

let shape3c (z:unit) x y = begin
  G.set_color (G.rgb 255 140 0);
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y) tile_size tile_size;
  G.fill_rect (x+padding) (y+padding) filled_size filled_size;

  G.draw_rect (x-15) (y) tile_size tile_size;
  G.fill_rect (x-15+padding) (y+padding) filled_size filled_size;
  ()
end

let shape4 (z:unit) x y = begin
  G.set_color (G.rgb 242 236 82);
  G.set_line_width 1;

  G.draw_rect x (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-15) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-15+padding) filled_size filled_size;
  ()
end

let shape5 (z:unit) x y = begin
  G.set_color G.green;
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-15) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x+30) (y-15) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-15+padding) filled_size filled_size;
  ()
end

let shape5a (z:unit) x y = begin
  G.set_color G.green;
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-45) tile_size tile_size;
  G.fill_rect (x+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-45) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-60) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-60+padding) filled_size filled_size;
  ()
end

let shape5b (z:unit) x y = begin
  G.set_color G.green;
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-30) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-45) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x-30) (y-45) tile_size tile_size;
  G.fill_rect (x-30+padding) (y-45+padding) filled_size filled_size;
  ()
end

let shape5c (z:unit) x y = begin
  G.set_color G.green;
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-15) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y) tile_size tile_size;
  G.fill_rect (x-15+padding) (y+padding) filled_size filled_size;
  ()
end

let shape6 (z:unit) x y = begin
  G.set_color G.magenta;
  G.set_line_width 1;

  G.draw_rect x (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-15) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x+30) (y-30) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape6a (z:unit) x y = begin
  G.set_color G.magenta;
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-45) tile_size tile_size;
  G.fill_rect (x+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x) (y-60) tile_size tile_size;
  G.fill_rect (x+padding) (y-60+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-45) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-45+padding) filled_size filled_size;
  ()
end

let shape6b (z:unit) x y = begin
  G.set_color G.magenta;
  G.set_line_width 1;

  G.draw_rect (x-30) (y-30) tile_size tile_size;
  G.fill_rect (x-30+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-30) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-45) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-45+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape6c (z:unit) x y = begin
  G.set_color G.magenta;
  G.set_line_width 1;

  G.draw_rect (x-15) (y-15) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y) tile_size tile_size;
  G.fill_rect (x+padding) (y+padding) filled_size filled_size;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape7 (z:unit) x y = begin
  G.set_color G.red;
  G.set_line_width 1;

  G.draw_rect x (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-15) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-30) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+30) (y-30) tile_size tile_size;
  G.fill_rect (x+30+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape7a (z:unit) x y = begin
  G.set_color G.red;
  G.set_line_width 1;

  G.draw_rect x (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-30) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-45) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-45+padding) filled_size filled_size;
  ()
end

let shape7b (z:unit) x y = begin
  G.set_color G.red;
  G.set_line_width 1;

  G.draw_rect (x-30) (y-15) tile_size tile_size;
  G.fill_rect (x-30+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-15) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x-15) (y-30) tile_size tile_size;
  G.fill_rect (x-15+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;
  ()
end

let shape7c (z:unit) x y = begin
  G.set_color G.red;
  G.set_line_width 1;

  G.draw_rect (x) (y-30) tile_size tile_size;
  G.fill_rect (x+padding) (y-30+padding) filled_size filled_size;

  G.draw_rect (x+15) (y-15) tile_size tile_size;
  G.fill_rect (x+15+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x) (y-15) tile_size tile_size;
  G.fill_rect (x+padding) (y-15+padding) filled_size filled_size;

  G.draw_rect (x+15) (y) tile_size tile_size;
  G.fill_rect (x+15+padding) (y+padding) filled_size filled_size;
  ()
end

let tile x y color = 
  G.set_color color;
  G.set_line_width 1;
  G.draw_rect x y tile_size tile_size;
  G.fill_rect (x+padding) (y+padding) filled_size filled_size




