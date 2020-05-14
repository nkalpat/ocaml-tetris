open OUnit2
open Draw
open Game

(*This test suite is designed to automatically be able to test
  moving, collisions, and scoring. As each of the functions 
  corresponding to those return either an int or a bool, we 
  were able to use OUnit tests. Since most of our other functions
  returned units, type games, or were I/O, we had to manually 
  test functionality using "make play" and play the game to make sure 
  that all features were working as they should. A lot of our features
  were able to be tested by playing the game. Since this is a game, we were
  able to see things like row clearing working when it should. 

  Since all of our draw.ml and main.ml functions and code were I/O,
  we only tested game.ml functions using OUnit. 

  We used black-box testing since only the results of the 
  functions we tested were of interest to us (as opposed to the 
  structure of them. This is because these functions are all
  integral to the game, as most of our other functionality heavily 
  relies and depends on these functions providing the right 
  results.

  The tests accurately reflect correctness as we test movement 
  functions by their relative coordinates in the grid. The collisions
  are also tested to their corresponding coordinates in the grid. Additionally,
  through our manual testing of playing the game, we were able to ensure that
  our code is functioning as expected by visually seeing it in action.
*)

let g1 = {
  drop_block = {color = Cyan; tile_list = {x = 70; y = 230}::
                                          { x = 85; y = 230}::
                                          { x = 100; y = 230}::
                                          {x = 115; y = 230}::
                                          []; shape = Shape1};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g2 = {
  drop_block = {color = Blue; tile_list = { x = 70; y = 245}::
                                          { x = 70; y = 230}::{x = 85; y = 230}
                                          ::{x = 100; y = 230}::
                                          []; shape = Shape2};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g3 = {
  drop_block = {color = Yellow; tile_list = {x = 70; y = 245}::
                                            { x = 85; y = 245}::
                                            { x = 70; y = 260}::
                                            {x = 85; y = 260}::
                                            []; shape = Shape4};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g4 = {
  drop_block = {color = Orange; tile_list = {x = 70; y = 245}::
                                            { x = 85; y = 245}::
                                            { x = 100; y = 245}::
                                            {x = 100; y = 260}::
                                            []; shape = Shape3};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g5 = {
  drop_block = {color = Green; tile_list = {x = 70; y = 245}::{ x = 85; y = 245}
                                           ::{ x = 85; y = 260}::
                                           {x = 100; y = 260}::[]; 
                shape = Shape5};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g6 = {
  drop_block = {color = Magenta; tile_list = {x = 70; y = 245}::
                                             { x = 85; y = 245}::
                                             { x = 85; y = 260}::
                                             {x = 100; y = 245}::
                                             []; shape = Shape6};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g7 = {
  drop_block = {color = Red; tile_list = {x = 70; y = 260}::
                                         { x = 85; y = 260}::
                                         { x = 85; y = 245}::
                                         {x = 100; y = 245}::
                                         []; shape = Shape7};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

let g8 = {
  drop_block = {color = Black; tile_list = {x = 70; y = 230}::[]; shape = Bomb};
  pattern = ref (Array.make_matrix 15 20 None);
  last_blocks = [];
  score = 0;
  speed = 0.5;
  old_speed = 0.5;
  cleared = 0;
  time = Unix.gettimeofday ();
}

(* Makes test to test for block collisions by x and y coordinates
   of block. Returns true if expected output and collision result 
   are equal
*)
let make_collisions_test
    (name: string)
    (g: Game.game)
    (b: Game.block)
    (expected_output: (bool)): test =
  name >:: (fun _ -> assert_equal (expected_output) (block_collides g b))


(* Makes test to test for score increases that should change after
   block collisions and bomb drops. Returns true if expected output 
   and score result are equal
*)
let make_score_test
    (name: string)
    (g: Game.game)
    (expected_output: (int)): test = 
  name >:: (fun _ -> assert_equal (expected_output) (g.score))

(* Makes test to test for x coordinate change of block after 
   move function is called on it. Returns true if expected output 
   and score result are equal
*)
let make_move_x_test
    (name: string)
    (g: Game.game)
    (b: Game.block)
    (m: move)
    (expected_output: (int)): test =
  name >:: (fun _ -> assert_equal (expected_output) 
               ((List.nth b.tile_list 0).x))

(* Makes test to test for y coordinate change of block after 
   move function is called on it. Returns true if expected output 
   and score result are equal
*)
let make_move_y_test
    (name: string)
    (g: Game.game)
    (b: Game.block)
    (m: move)
    (expected_output: (int)): test =
  name >:: (fun _ -> assert_equal (expected_output)
               ((List.nth b.tile_list 0).y))

let g1_1left = move_block g1 g1.drop_block Left
let g1_2left = move_block g1_1left g1_1left.drop_block Left
let g1_3left = move_block g1_2left g1_2left.drop_block Left
let g1_4left = move_block g1_3left g1_3left.drop_block Left
let g1_5left = move_block g1_4left g1_4left.drop_block Left

let g1_1right = move_block g1 g1.drop_block Right
let g1_2right = move_block g1_1right g1_1right.drop_block Right
let g1_3right = move_block g1_2right g1_2right.drop_block Right

let g1_1down = move_block g1 g1.drop_block Down
let g1_2down = move_block g1_1down g1_1down.drop_block Down
let g1_3down = move_block g1_2down g1_2down.drop_block Down
let g1_4down = move_block g1_3down g1_3down.drop_block Down
let g1_5down = move_block g1_4down g1_4down.drop_block Down
let g1_6down = move_block g1_5down g1_5down.drop_block Down
let g1_7down = move_block g1_6down g1_6down.drop_block Down
let g1_8down = move_block g1_7down g1_7down.drop_block Down
let g1_9down = move_block g1_8down g1_8down.drop_block Down
let g1_10down = move_block g1_9down g1_9down.drop_block Down
let g1_11down = move_block g1_10down g1_10down.drop_block Down
let g1_12down = move_block g1_11down g1_11down.drop_block Down
let g1_13down = move_block g1_12down g1_12down.drop_block Down
let g1_14down = move_block g1_13down g1_13down.drop_block Down

let g2_1left = move_block g2 g2.drop_block Left
let g2_2left = move_block g2_1left g2_1left.drop_block Left
let g2_3left = move_block g2_2left g2_2left.drop_block Left
let g2_4left = move_block g2_3left g2_3left.drop_block Left
let g2_5left = move_block g2_4left g2_4left.drop_block Left

let g2_1right = move_block g2 g2.drop_block Right
let g2_2right = move_block g2_1right g2_1right.drop_block Right
let g2_3right = move_block g2_2right g2_2right.drop_block Right
let g2_4right = move_block g2_3right g2_3right.drop_block Right

let g2_1down = move_block g2 g2.drop_block Down
let g2_2down = move_block g2_1down g2_1down.drop_block Down
let g2_3down = move_block g2_2down g2_2down.drop_block Down
let g2_4down = move_block g2_3down g2_3down.drop_block Down
let g2_5down = move_block g2_4down g2_4down.drop_block Down
let g2_6down = move_block g2_5down g2_5down.drop_block Down
let g2_7down = move_block g2_6down g2_6down.drop_block Down
let g2_8down = move_block g2_7down g2_7down.drop_block Down
let g2_9down = move_block g2_8down g2_8down.drop_block Down
let g2_10down = move_block g2_9down g2_9down.drop_block Down
let g2_11down = move_block g2_10down g2_10down.drop_block Down
let g2_12down = move_block g2_11down g2_11down.drop_block Down
let g2_13down = move_block g2_12down g2_12down.drop_block Down
let g2_14down = move_block g2_13down g2_13down.drop_block Down
let g2_15down = move_block g2_14down g2_14down.drop_block Down

let g3_1left = move_block g3 g3.drop_block Left
let g3_2left = move_block g3_1left g3_1left.drop_block Left
let g3_3left = move_block g3_2left g3_2left.drop_block Left
let g3_4left = move_block g3_3left g3_3left.drop_block Left
let g3_5left = move_block g3_4left g3_4left.drop_block Left

let g3_1right = move_block g3 g3.drop_block Right
let g3_2right = move_block g3_1right g3_1right.drop_block Right
let g3_3right = move_block g3_2right g3_2right.drop_block Right
let g3_4right = move_block g3_3right g3_3right.drop_block Right
let g3_5right = move_block g3_4left g3_4left.drop_block Left

let g3_1down = move_block g3 g3.drop_block Down
let g3_2down = move_block g3_1down g3_1down.drop_block Down
let g3_3down = move_block g3_2down g3_2down.drop_block Down
let g3_4down = move_block g3_3down g3_3down.drop_block Down
let g3_5down = move_block g3_4down g3_4down.drop_block Down
let g3_6down = move_block g3_5down g3_5down.drop_block Down
let g3_7down = move_block g3_6down g3_6down.drop_block Down
let g3_8down = move_block g3_7down g3_7down.drop_block Down
let g3_9down = move_block g3_8down g3_8down.drop_block Down
let g3_10down = move_block g3_9down g3_9down.drop_block Down
let g3_11down = move_block g3_10down g3_10down.drop_block Down
let g3_12down = move_block g3_11down g3_11down.drop_block Down
let g3_13down = move_block g3_12down g3_12down.drop_block Down
let g3_14down = move_block g3_13down g3_13down.drop_block Down
let g3_15down = move_block g3_14down g3_14down.drop_block Down

let g4_1down = move_block g4 g4.drop_block Down
let g4_2down = move_block g4_1down g4_1down.drop_block Down
let g4_3down = move_block g4_2down g4_2down.drop_block Down
let g4_4down = move_block g4_3down g4_3down.drop_block Down
let g4_5down = move_block g4_4down g4_4down.drop_block Down
let g4_6down = move_block g4_5down g4_5down.drop_block Down
let g4_7down = move_block g4_6down g4_6down.drop_block Down
let g4_8down = move_block g4_7down g4_7down.drop_block Down
let g4_9down = move_block g4_8down g4_8down.drop_block Down
let g4_10down = move_block g4_9down g4_9down.drop_block Down
let g4_11down = move_block g4_10down g4_10down.drop_block Down
let g4_12down = move_block g4_11down g4_11down.drop_block Down
let g4_13down = move_block g4_12down g4_12down.drop_block Down
let g4_14down = move_block g4_13down g4_13down.drop_block Down
let g4_15down = move_block g4_14down g4_14down.drop_block Down

let g5_1down = move_block g5 g5.drop_block Down
let g5_2down = move_block g5_1down g5_1down.drop_block Down
let g5_3down = move_block g5_2down g5_2down.drop_block Down
let g5_4down = move_block g5_3down g5_3down.drop_block Down
let g5_5down = move_block g5_4down g5_4down.drop_block Down
let g5_6down = move_block g5_5down g5_5down.drop_block Down
let g5_7down = move_block g5_6down g5_6down.drop_block Down
let g5_8down = move_block g5_7down g5_7down.drop_block Down
let g5_9down = move_block g5_8down g5_8down.drop_block Down
let g5_10down = move_block g5_9down g5_9down.drop_block Down
let g5_11down = move_block g5_10down g5_10down.drop_block Down
let g5_12down = move_block g5_11down g5_11down.drop_block Down
let g5_13down = move_block g5_12down g5_12down.drop_block Down
let g5_14down = move_block g5_13down g5_13down.drop_block Down
let g5_15down = move_block g5_14down g5_14down.drop_block Down

let g6_1down = move_block g6 g6.drop_block Down
let g6_2down = move_block g6_1down g6_1down.drop_block Down
let g6_3down = move_block g6_2down g6_2down.drop_block Down
let g6_4down = move_block g6_3down g6_3down.drop_block Down
let g6_5down = move_block g6_4down g6_4down.drop_block Down
let g6_6down = move_block g6_5down g6_5down.drop_block Down
let g6_7down = move_block g6_6down g6_6down.drop_block Down
let g6_8down = move_block g6_7down g6_7down.drop_block Down
let g6_9down = move_block g6_8down g6_8down.drop_block Down
let g6_10down = move_block g6_9down g6_9down.drop_block Down
let g6_11down = move_block g6_10down g6_10down.drop_block Down
let g6_12down = move_block g6_11down g6_11down.drop_block Down
let g6_13down = move_block g6_12down g6_12down.drop_block Down
let g6_14down = move_block g6_13down g6_13down.drop_block Down
let g6_15down = move_block g6_14down g6_14down.drop_block Down

let g7_1down = move_block g6 g6.drop_block Down
let g7_2down = move_block g6_1down g6_1down.drop_block Down
let g7_3down = move_block g6_2down g6_2down.drop_block Down
let g7_4down = move_block g6_3down g6_3down.drop_block Down
let g7_5down = move_block g6_4down g6_4down.drop_block Down
let g7_6down = move_block g6_5down g6_5down.drop_block Down
let g7_7down = move_block g6_6down g6_6down.drop_block Down
let g7_8down = move_block g6_7down g6_7down.drop_block Down
let g7_9down = move_block g6_8down g6_8down.drop_block Down
let g7_10down = move_block g6_9down g6_9down.drop_block Down
let g7_11down = move_block g6_10down g6_10down.drop_block Down
let g7_12down = move_block g6_11down g6_11down.drop_block Down
let g7_13down = move_block g6_12down g6_12down.drop_block Down
let g7_14down = move_block g6_13down g6_13down.drop_block Down
let g7_15down = move_block g6_14down g6_14down.drop_block Down

let g1_13down_1left = move_block g1_13down g1_13down.drop_block Left
let g1_13down_2left = move_block g1_13down_1left g1_13down_1left.drop_block Left
let g1_13down_3left = move_block g1_13down_2left g1_13down_2left.drop_block Left
let g1_13down_4left = move_block g1_13down_3left g1_13down_3left.drop_block Left

let g1_14down_1left = move_block g1_13down g1_13down.drop_block Left
let g1_13down_2left = move_block g1_13down_1left g1_13down_1left.drop_block Left
let g1_13down_3left = move_block g1_13down_2left g1_13down_2left.drop_block Left
let g1_13down_4left = move_block g1_13down_3left g1_13down_3left.drop_block Left

let tests = [
  make_collisions_test "testing left collision for cyan block" 
    g1_5left g1_5left.drop_block true;
  make_collisions_test "testing left non-collision for cyan block" 
    g1_4left g1_4left.drop_block false;
  make_collisions_test "testing right collision for cyan block" 
    g1_3right g1_3right.drop_block true;
  make_collisions_test "testing right non-collision for cyan block" 
    g1_2right g1_2right.drop_block false;
  make_collisions_test "testing down collision for cyan block" 
    g1_14down g1_14down.drop_block true;
  make_collisions_test "testing down non-collision for cyan block" 
    g1_12down g1_12down.drop_block false;

  make_collisions_test "testing left collision for blue block" 
    g2_5left g2_5left.drop_block true;
  make_collisions_test "testing left non-collision for blue block" 
    g2_4left g2_4left.drop_block false;
  make_collisions_test "testing right collision for blue block" 
    g2_4right g2_4right.drop_block true;
  make_collisions_test "testing right non-collision for blue block" 
    g2_3right g2_3right.drop_block false;
  make_collisions_test "testing down collision for blue block" 
    g2_14down g2_14down.drop_block true;
  make_collisions_test "testing down non-collision for blue block" 
    g2_12down g2_12down.drop_block false;

  make_collisions_test "testing left collision for yellow block" 
    g3_5left g3_5left.drop_block true;
  make_collisions_test "testing left non-collision for yellow block" 
    g3_4left g3_4left.drop_block false;
  make_collisions_test "testing right collision for yellow block" 
    g3_5right g3_5right.drop_block true;
  make_collisions_test "testing right non-collision for yellow block" 
    g3_4right g3_4right.drop_block false;
  make_collisions_test "testing down collision for yellow block" 
    g3_15down g3_15down.drop_block true;
  make_collisions_test "testing down non-collision for yellow block" 
    g3_13down g3_13down.drop_block false;

  make_move_x_test "testing x move left once for cyan block" 
    g1_1left g1_1left.drop_block Left 55; 
  make_move_x_test "testing x move right once for cyan block" 
    g1_1right g1_1right.drop_block Right 85; 
  make_move_x_test "testing x move down once for cyan block" 
    g1 g1.drop_block Down 70; 
  make_move_x_test "testing x move left collision for cyan block" 
    g1_4left g1_4left.drop_block Left 10; 
  make_move_x_test "testing x move right collision for cyan block" 
    g1_2right g1_2right.drop_block Right 100; 

  make_move_x_test "testing x move left once for blue block" 
    g2_1left g2_1left.drop_block Left 55; 
  make_move_x_test "testing x move right once for blue block" 
    g2_1right g2_1right.drop_block Right 85; 
  make_move_x_test "testing x move down once for blue block" 
    g2 g2.drop_block Down 70; 
  make_move_x_test "testing x move left collision for blue block" 
    g2_4left g2_4left.drop_block Left 10; 
  make_move_x_test "testing x move right collision for blue block" 
    g2_3right g2_3right.drop_block Left 115; 

  make_move_x_test "testing x move left once for yellow block" 
    g3_1left g3_1left.drop_block Left 55; 
  make_move_x_test "testing x move right once for yellow block" 
    g3_1right g3_1right.drop_block Right 85; 
  make_move_x_test "testing x move down once for yellow block" 
    g3 g3.drop_block Down 70;
  make_move_x_test "testing x move left collision for yellow block" 
    g3_4left g3_4left.drop_block Left 10; 
  make_move_x_test "testing x move right collision for yellow block" 
    g3_4right g3_4right.drop_block Right 130; 

  make_move_y_test "testing y move left once for cyan block" 
    g1_1left g1_1left.drop_block Left 230; 
  make_move_y_test "testing y move down once for cyan block" 
    g1_1down g1_1down.drop_block Down 215;
  make_move_y_test "testing y move down collision for cyan block" 
    g1_14down g1_14down.drop_block Down 20; 

  make_move_y_test "testing y move left once for blue block" 
    g2_1left g2_1left.drop_block Left 245; 
  make_move_y_test "testing y move down once for blue block" 
    g2_1down g2_1down.drop_block Down 230;
  make_move_y_test "testing y move down collision for blue block" 
    g2_14down g2_14down.drop_block Down 35; 

  make_move_y_test "testing y move left once for yellow block" 
    g3_3left g3_1left.drop_block Left 245; 
  make_move_y_test "testing y move down once for yellow block" 
    g3_1left g3_1left.drop_block Down 245;
  make_move_y_test "testing y move down collision for yellow block" 
    g3_15down g3_15down.drop_block Down 20; 

  make_score_test "testing score after cyan block collision" 
    (check_drop_block(g1_14down)) 5;
  make_score_test "testing score after blue block collision" 
    (check_drop_block(g2_14down))5;
  make_score_test "testing score after yellow block collision" 
    (check_drop_block(g3_15down)) 5;
  make_score_test "testing score after green block collision" 
    (check_drop_block(g5_15down)) 5;
  make_score_test "testing score after red block collision" 
    (check_drop_block(g7_15down)) 5;
  make_score_test "testing score after magenta block collision" 
    (check_drop_block(g6_15down)) 5;
  make_score_test "testing score after orange block collision" 
    (check_drop_block(g4_15down)) 5;
  make_score_test "testing score after bomb drop" (check_drop_block(g8))0;  
]


let suite = "search test suite" >::: List.flatten[tests]

let _ = run_test_tt_main suite
