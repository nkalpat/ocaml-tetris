(** Representation of the tetris game to be played.
    This module represents the data stored in the game and how this data is
    changed. It handles creating the tetris game with various
    blocks and changing data within the game, like the speed of the blocks
    and the score of the game. 
*)

(** The module that represents the Graphics library. *)
module G = Graphics

(** The type of the block colors. *)
type color = 
  | Red
  | Blue
  | Orange 
  | Green  
  | Cyan
  | Yellow
  | Magenta
  | Black


(** The type representing each tile in a shape. *)
type tile = {
  x: int;
  y: int;
}

(** The type representing the different shapes in the game. *)
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


(** The type representing the blocks in the game. *)
type block ={
  tile_list : tile list;
  color: color;
  shape: shape; 
}

(** The type representing the possible ways to move the block in the game. *)
type move =  
  | Left 
  | Right
  | Up
  | Down
  | Clockwise
  | Counterclockwise

(** The type representing our game. *)
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

(** [create_bomb z] is a block that consists of one tile that clears the screen
    whenever it is dropped. *)
val create_bomb :  unit -> block

(** [create_rand z] is a block with a randomly generated shape. *)
val create_rand : unit -> block

(** [create_game z] is a game with all values initialized. *)
val create_game: unit -> game

(** [tile_collides game tile] is true if [tile] collides with any part of 
    [game], like borders or other shapes, and false otherwise. *)
val tile_collides:  game -> tile -> bool

(** [block_collides game block] is true if any tile in [block]
    collides with any part of [game], like borders or other shapes,
    and false otherwise. *)
val block_collides:  game -> block -> bool

(** [stack_tile game tile c] is a game with a pattern such that the 
    position of the [tile] in the pattern is filled with [c]. *)
val stack_tile: game -> tile -> color -> game

(** [stack_block game block] is a game with a pattern such that the 
    position of every tile in [block] in the pattern is filled with 
    the color of [block]. *)
val stack_block: game -> block -> game

(** [update_tile_list shape x y] is a tile list such that the coordinates of 
    [shape] are updated to reflect a rotation. *)
val update_tile_list : shape -> int -> int -> tile list

(** [rotate_clockwise game block] is a game with the drop_block of the game 
    set to be the clockwise rotated version of [block]. *)
val rotate_clockwise : game -> block -> game

(** [rotate_counter game block] is a game with the drop_block of the game 
    set to be the counterclockwise rotated version of [block]. *)
val rotate_counter: game -> block -> game

(** [move_block game block move] is a game with the drop_block of the game 
    shifted to account for the direction given in [move]. *)
val move_block: game -> block -> move -> game

(** [check_filled_line game y x] is true if every tile in line [y] of the 
    pattern in [game] is filled with a color, and false otherwise. *)
val check_filled_line: game -> int -> int -> bool

(** [check_filled_line game y] is a list with the y positions of every 
    filled line in [game]. *)
val find_all_filled: game -> int -> int list -> int list

(** [drop_line game y] is a game pattern with every tile in each row filled 
    with the tile colors of the tiles in the row above, which is done when a 
    row is cleared. *)
(* val drop_line: game -> int -> unit *)

(** [move_lines_down game filled] is a game with the number of cleared rows 
    changed to account for the row that was cleared, as well as a score
    increase of 15. *)
val move_lines_down: game -> int -> game

(** [check_collisions game move] is a game with the drop_block moved in the 
    direction specified in [move] if a collision is not detected. *)
val check_collisions: game -> move -> game

(** [update game] is a game with the drop_block set to be a random block 
    shape or a bomb. *)
val update_game: game  -> game 

(** [check_stack game] is a game with the drop_block moved down until the block 
    dropped hits the top boundary of the game, at which the game ends. *)
val check_stack: game -> unit

(** [check_drop_block game] is a game with the drop_block moved down 
    until a collision at the bottom of the screen is detected. At this point,
    the score is incremented by 5. *)
val check_drop_block: game -> game 

(** [speed_level game] is a game with the speed increased when the score 
    gets to 200. *)
val speed_level : game -> game

(** [match_set_color game] sets the color of the Graphics window to be the 
    color of the drop_block of [game]. *)
val match_set_color: game -> unit

(** [draw_game_frame z] draws the border of the game in the Graphics
    window. *)
val draw_game_frame: unit -> unit

(** [draw_rules_frame z] draws the rules of the game in the Graphics
    window. *)
val draw_rules_frame: unit -> unit 

(** [print_title z] draws the title of the game in the Graphics
    window. *)
val print_title: unit -> unit

(** [print_score sc] draws the score of the game with [sc] in the Graphics
    window. *)
val print_score: int -> unit

(** [print_num_shapes game] draws the number of shapes that have been dropped 
    in [game] in the Graphics window. *)
val print_num_shapes: game -> unit

(** [print_rows_cleared game] draws the number of rows that have been cleared 
    in [game] in the Graphics window. *)
val print_rows_cleared: game -> unit

(** [match_draw_shape game] draws the shape associated with the drop_block
    of [game] with the coordinates of the first tile in the drop_block. *)
val match_draw_shape: game -> unit

(** [draw_tile x y color] draws a tile with coordinates [x] and [y],
    as well as color [color]. *)
val draw_tile: int -> int -> Draw.G.color -> unit

(** [match_opt_color option] is a Graphics color associated with the color
    of [option]. *)
val match_opt_color: color option -> Graphics.color

(** [draw_pattern pattern] draws a tile with the color of each position in  
    [pattern]. *)
val draw_pattern: color option array array ref -> unit

(** [draw_game game] draws the game set up, with the game border, title, score,
    and pattern. *)
val draw_game: game -> unit

(** [update game] is a game with drop_block moved or changed according to the
    key that the user presses. *)
val update: game -> game 

(** [reset_time game] is a game with the time set to be the current time of 
    day. *)
val reset_timer: game -> game

(** [drop_block game] is a game with the drop_block continuously moved 
    down with the speed of [game] until a collision is detected at the 
    bottom. *)
val drop_block: game -> game

(** [update_screen game] continuously updates the drop_block in [game]
    to account for key presses and moving the block down. *)
val update_screen: game -> unit




