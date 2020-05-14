module G = Graphics

type color = 
  | Red
  | Blue
  | Orange 
  | Green  
  | Cyan
  | Yellow
  | Magenta
  | Black

type tile = {
  x: int;
  y: int;
}

type shape = 
  | Shape1 
  | Shape2
  | Shape3
  | Shape4
  | Shape5
  | Shape6
  | Shape7
  | Shape1a
  | Shape1b
  | Shape1c
  | Shape2a
  | Shape2b
  | Shape2c
  | Shape3a
  | Shape3b
  | Shape3c
  | Shape5a
  | Shape5b
  | Shape5c
  | Shape6a
  | Shape6b
  | Shape6c
  | Shape7a
  | Shape7b
  | Shape7c
  | Bomb

type block = {
  tile_list : tile list;
  color: color;
  shape: shape; 
}

type move =  
  | Left 
  | Right
  | Up
  | Down
  | Clockwise
  | Counterclockwise

type game = {
  drop_block: block;
  pattern: color option array array ref;
  last_blocks: block list;
  score: int;
  speed: float;
  old_speed: float;
  cleared: int;
  time: float;
}

let create_bomb (z:unit) =
  {color = Black; tile_list = {x = 70; y = 230}::[]; shape = Bomb}

let create_rand (z:unit)=
  Random.self_init ();

  let x = Random.int 7 in 
  match x with 
  | 0 -> {color = Cyan; tile_list = {x = 70; y = 230}::{ x = 85; y = 230}::
                                    { x = 100; y = 230}::{x = 115; y = 230}::
                                    []; shape = Shape1}

  | 1 -> {color = Blue; tile_list = { x = 70; y = 245}::{ x = 70; y = 230}::
                                    {x = 85; y = 230}::{x = 100; y = 230}::
                                    []; shape = Shape2}

  | 2 -> {color = Orange; tile_list = {x = 70; y = 245}::{ x = 85; y = 245}::
                                      { x = 100; y = 245}::{x = 100; y = 260}::
                                      []; shape = Shape3}

  | 3 -> {color = Yellow; tile_list = {x = 70; y = 245}::{ x = 85; y = 245}::
                                      { x = 70; y = 260}::{x = 85; y = 260}::
                                      []; shape = Shape4}

  | 4 -> {color = Green; tile_list = {x = 70; y = 245}::{ x = 85; y = 245}::
                                     { x = 85; y = 260}::{x = 100; y = 260}::
                                     []; shape = Shape5}

  | 5 -> {color = Magenta; tile_list = {x = 70; y = 245}::{ x = 85; y = 245}::
                                       { x = 85; y = 260}::{x = 100; y = 245}::
                                       []; shape = Shape6}

  | _ -> {color = Red; tile_list = {x = 70; y = 260}::{ x = 85; y = 260}::
                                   { x = 85; y = 245}::{x = 100; y = 245}::
                                   []; shape = Shape7}

let create_game () = {
  drop_block = create_rand ();
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let tile_collides game tile = 

  if tile.x < 10 || tile.x > 150 ||
     tile.y < 25 || tile.y > 270 then 
    true else 
    !(game.pattern).((tile.x - 10) /15).((tile.y -30)/15) != None

let block_collides game block =
  let tiles =
    List.map (function tile -> {x =tile.x ; y = tile.y})
      block.tile_list in
  let rec tiles_collide game tiles = 
    match tiles with 
      [] -> false
    | h :: t -> tile_collides game h || tiles_collide game t in
  tiles_collide game tiles


let stack_tile game tile c= 
  !(game.pattern).((tile.x - 10) /15).((tile.y - 30)/15) <- Some c; 
  game

let stack_block game block =
  let t_col = block.color in
  let block_tiles = 
    List.map (function tile -> {x =tile.x ; y = tile.y})
      block.tile_list in
  let rec stack_tiles game tiles c=
    match tiles with 
      [] -> game
    | h :: t -> stack_tiles (stack_tile game h c) t c in 
  stack_tiles game block_tiles t_col

let update_tile_list shape x' y' =
  match shape with
  | Shape1 -> {x = x'+30; y = y'+15}::{x = x'+30; y = y'}::
              {x = x'+30; y = y'-15}::{x = x'+30; y = y'-30}::[]

  | Shape2 -> {x = x'+30; y = y'}::{x = x'+15; y = y'}::
              {x = x'+15; y = y'-15}::{x = x'+15; y = y'-30}::[]

  | Shape3 -> {x = x'+15; y = y'+15}::{x = x'+15; y = y'}::
              {x = x'+15; y = y'-15}::{x = x'+30; y = y'-15}::[]

  | Shape4 -> []

  | Shape5 -> {x = x'+15; y = y'+15}::{x = x'+15; y = y'}::
              {x = x'+30; y = y'}::{x = x'+30; y = y'-15}::[]

  | Shape6 -> {x = x'+15; y = y'}::{x = x'+15; y = y'-15}::
              {x = x'+15; y = y'-30}::{x = x'+30; y = y'-15}::[]

  | Shape7 -> {x = x'+30; y = y'+15}::{x = x'+15; y = y'}::
              {x = x'+30; y = y'}::{x = x'+15; y = y'-15}::[]

  | Shape1a -> {x = x'-15; y = y'-30}::{x = x'; y = y'-30}::
               {x = x'+15; y = y'-30}::{x = x'+30; y = y'-30}::[]

  | Shape1b -> {x = x'+30; y = y'+15}::{x = x'+30; y = y'}::
               {x = x'+30; y = y'-15}::{x = x'+30; y = y'-30}::[]

  | Shape1c -> {x = x'-15; y = y'-15}::{x = x'; y = y'-15}::
               {x = x'+15; y = y'-15}::{x = x'+30; y = y'-15}::[]

  | Shape2a -> {x = x'; y = y'-30}::{x = x'; y = y'-15}::
               {x = x'-15; y = y'-15}::{x = x'-30; y = y'-15}::[]

  | Shape2b -> {x = x'-30; y = y'-30}::{x = x'-15; y = y'-30}::
               {x = x'-15; y = y'-15}::{x = x'-15; y = y'}::[]

  | Shape2c -> {x = x'; y = y'}::{x = x'; y = y'-15}::
               {x = x'+15; y = y'-15}::{x = x'+30; y = y'-15}::[]

  | Shape3a -> {x = x'+15; y = y'}::{x = x'; y = y'}::
               {x = x'-15; y = y'}::{x = x'-15; y = y'-15}::[]

  | Shape3b -> {x = x'-15; y = y'-15}::{x = x'-15; y = y'}::
               {x = x'-15; y = y'+15}::{x = x'-30; y = y'+15}::[]

  | Shape3c -> {x = x'-15; y = y'}::{x = x'; y = y'}::
               {x = x'+15; y = y'}::{x = x'+15; y = y'+15}::[]

  | Shape5a -> {x = x'+15; y = y'}::{x = x'; y = y'}::
               {x = x'; y = y'-15}::{x = x'-15; y = y'-15}::[]

  | Shape5b -> {x = x'-15; y = y'-30}::{x = x'-15; y = y'-15}::
               {x = x'-30; y = y'-15}::{x = x'-30; y = y'}::[]

  | Shape5c -> {x = x'-15; y = y'-15}::{x = x'; y = y'-15}::
               {x = x'; y = y'}::{x = x'+15; y = y'}::[]

  | Shape6a -> {x = x'+15; y = y'-15}::{x = x'; y = y'-15}::
               {x = x'-15; y = y'-15}::{x = x'; y = y'-30}::[]

  | Shape6b -> {x = x'-15; y = y'-30}::{x = x'-15; y = y'-15}::
               {x = x'-15; y = y'}::{x = x'-30; y = y'-15}::[]

  | Shape6c -> {x = x'-15; y = y'-15}::{x = x'; y = y'-15}::
               {x = x'+15; y = y'-15}::{x = x'; y = y'}::[]

  | Shape7a -> {x = x'; y = y'-15}::{x = x'-15; y = y'-15}::
               {x = x'-15; y = y'}::{x = x'-30; y = y'}::[]

  | Shape7b -> {x = x'-30; y = y'-15}::{x = x'-30; y = y'}::
               {x = x'-15; y = y'}::{x = x'-15; y = y'+15}::[]

  | Shape7c -> {x = x'; y = y'}::{x = x'+15; y = y'}::
               {x = x'+15; y = y'-15}::{x = x'+30; y = y'-15}::[]

  | Bomb -> []


let rotate_clockwise game block =
  match block.shape with
  | Shape1 -> {game with drop_block = {block with 
                                       shape = Shape1a; 
                                       tile_list = update_tile_list Shape1 
                                           (List.nth block.tile_list 0).x 
                                           (List.nth block.tile_list 0).y;}}

  | Shape2 -> {game with drop_block = {block with
                                       shape = Shape2a;
                                       tile_list = update_tile_list Shape2 
                                           (List.nth block.tile_list 0).x 
                                           (List.nth block.tile_list 0).y;}}

  | Shape3 -> {game with drop_block = {block with 
                                       shape = Shape3a;
                                       tile_list = update_tile_list Shape3 
                                           (List.nth block.tile_list 0).x 
                                           (List.nth block.tile_list 0).y;}}

  | Shape4 -> game

  | Shape5 -> {game with drop_block = {block with 
                                       shape = Shape5a;
                                       tile_list = update_tile_list Shape5 
                                           (List.nth block.tile_list 0).x 
                                           (List.nth block.tile_list 0).y;}}

  | Shape6 -> {game with drop_block = {block with 
                                       shape = Shape6a;
                                       tile_list = update_tile_list Shape6 
                                           (List.nth block.tile_list 0).x 
                                           (List.nth block.tile_list 0).y;}}

  | Shape7 -> {game with drop_block = {block with 
                                       shape = Shape7a;
                                       tile_list = update_tile_list Shape7 
                                           (List.nth block.tile_list 0).x 
                                           (List.nth block.tile_list 0).y;}}

  | Shape1a -> {game with drop_block = {block with 
                                        shape = Shape1b;
                                        tile_list = update_tile_list Shape1a 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape1b -> {game with drop_block = {block with 
                                        shape = Shape1c;
                                        tile_list = update_tile_list Shape1b
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape1c -> {game with drop_block = {block with 
                                        shape = Shape1;
                                        tile_list = update_tile_list Shape1c 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape2a -> {game with drop_block = {block with 
                                        shape = Shape2b;
                                        tile_list = update_tile_list Shape2a 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape2b -> {game with drop_block = {block with 
                                        shape = Shape2c;
                                        tile_list = update_tile_list Shape2b 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape2c -> {game with drop_block = {block with 
                                        shape = Shape2;
                                        tile_list = update_tile_list Shape2c 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape3a -> {game with drop_block = {block with 
                                        shape = Shape3b;
                                        tile_list = update_tile_list Shape3a 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape3b -> {game with drop_block = {block with 
                                        shape = Shape3c;
                                        tile_list = update_tile_list Shape3b 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape3c -> {game with drop_block = {block with 
                                        shape = Shape3;
                                        tile_list = update_tile_list Shape3c 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape5a -> {game with drop_block = {block with 
                                        shape = Shape5b;
                                        tile_list = update_tile_list Shape5a 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape5b -> {game with drop_block = {block with 
                                        shape = Shape5c;
                                        tile_list = update_tile_list Shape5b 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape5c -> {game with drop_block = {block with 
                                        shape = Shape5;
                                        tile_list = update_tile_list Shape5c 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape6a -> {game with drop_block = {block with 
                                        shape = Shape6b;
                                        tile_list = update_tile_list Shape6a 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape6b -> {game with drop_block = {block with 
                                        shape = Shape6c;
                                        tile_list = update_tile_list Shape6b 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape6c -> {game with drop_block = {block with 
                                        shape = Shape6;
                                        tile_list = update_tile_list Shape6c 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape7a -> {game with drop_block = {block with 
                                        shape = Shape7b;
                                        tile_list = update_tile_list Shape7a 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape7b -> {game with drop_block = {block with 
                                        shape = Shape7c;
                                        tile_list = update_tile_list Shape7b 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Shape7c -> {game with drop_block = {block with 
                                        shape = Shape7;
                                        tile_list = update_tile_list Shape7c 
                                            (List.nth block.tile_list 0).x 
                                            (List.nth block.tile_list 0).y;}}

  | Bomb -> game                                                                                             

let rotate_counter game block =
  match block.shape with
  | Shape1 -> {game with drop_block = {block with shape = Shape1c}}
  | Shape2 -> game
  | Shape3 -> game
  | Shape4 -> game
  | Shape5 -> game
  | Shape6 -> game
  | Shape7 -> game
  | Shape1a -> {game with drop_block = {block with shape = Shape1}}
  | Shape1b -> {game with drop_block = {block with shape = Shape1a}}
  | Shape1c -> {game with drop_block = {block with shape = Shape1b}}
  | Shape2a -> game
  | Shape2b -> game
  | Shape2c -> game
  | Shape3a -> game
  | Shape3b -> game
  | Shape3c -> game
  | Shape5a -> game
  | Shape5b -> game
  | Shape5c -> game
  | Shape6a -> game
  | Shape6b -> game
  | Shape6c -> game
  | Shape7a -> game
  | Shape7b -> game
  | Shape7c -> game
  | Bomb -> game

let move_block game block move =
  match move with
  | Left -> {game with drop_block = {block with 
                                     tile_list = List.map (function tile -> 
                                         {x = tile.x - 15; y = tile.y}) 
                                         block.tile_list}}

  | Right -> {game with drop_block = {block with 
                                      tile_list = List.map (function tile ->
                                          {x = tile.x + 15; y = tile.y}) 
                                          block.tile_list}}

  | Up ->  {game with drop_block = {block with 
                                    tile_list = List.map (function tile ->
                                        {x = tile.x; y = tile.y + 30}) 
                                        block.tile_list}}

  | Down -> {game with drop_block = {block with 
                                     tile_list = List.map (function tile ->
                                         {x = tile.x; y = tile.y - 15})
                                         block.tile_list}}
  | Clockwise -> rotate_clockwise game block
  | Counterclockwise -> rotate_counter game block


let rec check_filled_line game y x= 
  if (x == 10) then true 
  else if !(game.pattern).(x).(y) == None then false 
  else check_filled_line game y (x+1)

let rec find_all_filled game y lst=
  if y == 13 then lst else 
  if check_filled_line game y 0 == true then 
    find_all_filled game (y + 1)(y :: lst)
  else (find_all_filled game (y + 1) lst)

let move_lines_down game filled1 =
  let filled = find_all_filled game 0 [] in 
  let rec drop_line game y'=  
    if y' >= 0 then begin 
      for y =  y' to 13 do
        for i = 0 to 9 do 
          !(game.pattern).(i).(y) <- !(game.pattern).(i).(y+1);  
        done;
      done;
    end
    else () in
  ignore (List.map (fun x -> drop_line game x) filled);
  if List.length filled + game.cleared<> game.cleared then
    {game with cleared = List.length filled + game.cleared; 
               score = game.score +15}
  else game


let check_collisions game move =
  let check_move = move_block game game.drop_block move in
  if not (block_collides game check_move.drop_block) then 
    {game with drop_block = check_move.drop_block}
  else game

let update_game game = 
  Random.self_init ();
  if game.score mod 100 == 0 then
    {game with drop_block = create_bomb()}
  else 
    let bl = create_rand () in 
    {game with drop_block = bl}

let check_stack game = 
  let check_move = move_block game game.drop_block Down in
  if (block_collides game check_move.drop_block) 
  && ((List.nth (List.rev game.drop_block.tile_list) 0).y -50)/15 == 13 then 
    exit 0;
  ()

let check_drop_block game =
  Random.self_init ();
  let check_move = move_block game game.drop_block Down in
  if not (block_collides check_move check_move.drop_block) then begin
    {game with drop_block = check_move.drop_block}
  end
  else  
  if game.drop_block.shape = Bomb then 
    update_game {game with pattern = ref (Array.make_matrix 15 20 None); 
                           score = game.score + 15}
  else let intermediate = stack_block game game.drop_block in
    update_game {intermediate
                 with last_blocks = (intermediate.drop_block :: 
                                     intermediate.last_blocks); 
                      score = intermediate.score + 5; speed = 
                                                        intermediate.old_speed}


let speed_level game =
  if ((game.score + 5) mod 200) == 0 then {game with speed = game.speed -. 0.3; 
                                                     old_speed = game.speed -. 
                                                                 0.3;}
  else game

let match_set_color game= begin
  match game.drop_block.color with
  | Red -> G.set_color G.red
  | Blue -> G.set_color G.blue
  | Orange -> G.set_color (G.rgb 255 140 0)
  | Green -> G.set_color G.green
  | Cyan -> G.set_color G.cyan
  | Yellow -> G.set_color (G.rgb 242 236 82)
  | Magenta -> G.set_color G.magenta
  | Black -> G.set_color G.black
end


let draw_game_frame () = 
  G.set_color G.black;
  G.set_line_width 2;
  G.draw_poly [|(9, 3); (162, 3); (162, 282); (9, 282)|];
  G.set_color (G.rgb 230 255 255);
  G.fill_poly [|(9, 3); (162, 3); (162, 282); (9, 282)|]; 
  G.set_color (G.rgb 255 245 204);
  G.fill_rect 167 155 65 120


let draw_rules_frame () = 
  G.draw_poly [|(166, 20); (238, 20); (238, 107); (166, 107)|];
  G.set_color (G.rgb 255 230 255);
  G.fill_poly [|(166, 20); (238, 20); (238, 107); (166, 107)|];
  G.set_color G.black;
  G.set_line_width 1;
  G.moveto 169 87;
  G.set_text_size 75;
  G.draw_string ("A: LEFT");
  G.moveto 169 67;
  G.draw_string ("D: RIGHT");
  G.moveto 169 47;
  G.draw_string ("W: ROTATE");
  G.moveto 169 27;
  G.draw_string ("SPACE: DROP")

let print_title () = 
  G.moveto 50 290;
  G.set_color G.black;
  G.set_text_size 100;
  G.draw_string "OCAML TETRIS"

let print_score sc= 
  G.moveto 170 250;
  G.set_color G.black;
  let new_sc = string_of_int sc in 
  G.draw_string ("SCORE: " ^ new_sc);
  ()

let print_num_shapes game=
  G.moveto 170 210;
  G.set_color G.black;
  let num = List.length game.last_blocks in 
  G.draw_string ("SHAPES: " ^ (string_of_int num));
  ()

let print_rows_cleared game =
  G.moveto 170 170;
  G.set_color G.black;
  let num = game.cleared in 
  G.draw_string ("ROWS: " ^ (string_of_int num));
  ()


let match_draw_shape game= begin
  match game.drop_block.shape with
  | Shape1 -> Draw.shape1 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape2 -> Draw.shape2 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape3 -> Draw.shape3 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape4 -> Draw.shape4 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape5 -> Draw.shape5 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape6 -> Draw.shape6 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape7 -> Draw.shape7 () (List.nth game.drop_block.tile_list 0).x 
                (List.nth game.drop_block.tile_list 0).y;

  | Shape1a -> Draw.shape1a () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape1b -> Draw.shape1b () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape1c -> Draw.shape1c () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape2a -> Draw.shape2a () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape2b -> Draw.shape2b () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape2c -> Draw.shape2c () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape3a -> Draw.shape3a () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape3b -> Draw.shape3b () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape3c -> Draw.shape3c () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape5a -> Draw.shape5a () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape5b -> Draw.shape5b () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape5c -> Draw.shape5c () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape6a -> Draw.shape6a () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape6b -> Draw.shape6b () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape6c -> Draw.shape6c () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape7a -> Draw.shape7a () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape7b -> Draw.shape7b () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Shape7c -> Draw.shape7c () (List.nth game.drop_block.tile_list 0).x 
                 (List.nth game.drop_block.tile_list 0).y;

  | Bomb -> Draw.tile (List.nth game.drop_block.tile_list 0).x 
              (((List.nth game.drop_block.tile_list 0).y)-30) G.black;
    ()
end

let draw_tile x y color =
  Draw.tile x y color

let match_opt_color (option: color option)= begin
  match option with
  | Some Red -> G.red
  | Some Blue -> G.blue
  | Some Orange -> (G.rgb 255 140 0)
  | Some Green -> G.green
  | Some Cyan -> G.cyan
  | Some Yellow -> (G.rgb 242 236 82)
  | Some Magenta -> G.magenta
  | Some Black -> G.black
  | None -> failwith "failed"
end

let draw_pattern pattern = 
  for w = 0 to 9 do
    for h = 0 to 19 do 
      if ((!pattern).(w).(h)) != None 
      then draw_tile (w*15+10) (h*15+5) (match_opt_color((!pattern).(w).(h)))
    done
  done;
  ()


let draw_game game = begin
  G.clear_graph ();
  draw_game_frame ();
  draw_rules_frame (); 
  print_title ();
  print_score game.score;
  print_num_shapes game;
  print_rows_cleared game;
  match_set_color game;
  match_draw_shape game;
  draw_pattern game.pattern;
  ()
end

let update game: game= 
  let check = Graphics.key_pressed () in 
  if (check) then let (key : char) = G.read_key () in 
    match key with 
    | 'q' -> exit 0
    | 'a' -> check_collisions game Left
    | 'd' -> check_collisions game Right
    | 'w' -> check_collisions game Clockwise
    | 's' -> check_collisions game Counterclockwise
    | ' ' -> if game.speed <> 0.0 then {game with old_speed = game.speed; speed = 0.} else game
    | _ -> game
  else game

let reset_timer game = 
  {game with time = Unix.gettimeofday ()}

let drop_block game = 
  Random.self_init ();
  let curr_time = Unix.gettimeofday () in
  let new_game = speed_level game in 
  if curr_time >= new_game.speed +. game.time then
    check_drop_block (reset_timer game)
  else update new_game 

let rec update_screen game = 
  match_set_color game;
  match_draw_shape game;
  draw_pattern game.pattern;
  print_num_shapes game;
  print_rows_cleared game;
  let new_game = move_lines_down ((update game)) 0 in
  draw_game new_game;
  check_stack new_game;
  update_screen (drop_block (update new_game)); 
  ()
