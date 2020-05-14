module G = Graphics

open Draw
open Game

let rec loop () = loop ()

let play_game =  
  print_endline("Welcome to tetris");
  print_endline("Press q to quit");

  G.open_graph "";
  G.resize_window 240 310;

  let game = Game.create_game () in
  Game.update_screen game

let get_time = 
  Unix.gettimeofday ()

let main () =
  (print_string
     "\n\nWelcome to the 3110 Tetris.\n");
  G.open_graph "" ;
  play_game  
let () = main ()