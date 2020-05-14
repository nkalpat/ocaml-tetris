(** Representation of the different shapes in the tetris game to be played.
    This module represents the drawing of the various shapes used in 
    tetris. Using the graphics library of Ocaml, this module creates and draws
    different block shapes to the graphics window. This module displays all
    the different shapes that are in the game, as well as the possible
    rotations of each of these shapes. 
*)

(** The module that represents the Graphics library. *)
module G = Graphics

(** [shape1 z x y] draws shape 1 with color cyan and coordinates
    [x] and [y]. *)
val shape1 : unit -> int ->int -> unit

(** [shape2 z x y] draws our shape 2 with color blue and coordinates
    [x] and [y]. *)
val shape2 : unit -> int ->int ->unit

(** [shape3 z x y] draws our shape 3 with color orange and coordinates
    [x] and [y]. *)
val shape3 : unit -> int ->int -> unit

(** [shape4 z x y] draws our shape 4 with color yellow and coordinates
    [x] and [y]. *)
val shape4 : unit -> int ->int ->unit

(** [shape5 z x y] draws our shape 5 with color green and coordinates
    [x] and [y]. *)
val shape5 : unit -> int ->int ->unit

(** [shape6 z x y] draws our shape 6 with color magenta and coordinates
    [x] and [y]. *)
val shape6 : unit -> int ->int ->unit

(** [shape7 z x y] draws our shape 7 with color red and coordinates
    [x] and [y]. *)
val shape7 : unit -> int ->int ->unit

(** [tile x y color] draws a tile with color [color] and coordinates
    [x] and [y]. *)
val tile : int -> int -> G.color -> unit

(** [shape1a z x y] draws our shape 1 with color cyan and coordinates
    [x] and [y] rotated 90 degrees clockwise. *)
val shape1a : unit -> int ->int -> unit

(** [shape1b z x y] draws our shape 1 with color cyan and coordinates
    [x] and [y] rotated 180 degrees clockwise. *)
val shape1b : unit -> int ->int -> unit

(** [shape1c z x y] draws our shape 1 with color cyan and coordinates
    [x] and [y] rotated 270 degrees clockwise. *)
val shape1c : unit -> int ->int -> unit

(** [shape2a z x y] draws our shape 2 with color blue and coordinates
    [x] and [y] rotated 90 degrees clockwise. *)
val shape2a : unit -> int ->int -> unit

(** [shape2b z x y] draws our shape 2 with color blue and coordinates
    [x] and [y] rotated 180 degrees clockwise. *)
val shape2b : unit -> int ->int -> unit

(** [shape2c z x y] draws our shape 2 with color blue and coordinates
    [x] and [y] rotated 270 degrees clockwise. *)
val shape2c : unit -> int ->int -> unit

(** [shape3a z x y] draws our shape 3 with color orange and coordinates
    [x] and [y] rotated 90 degrees clockwise. *)
val shape3a : unit -> int ->int -> unit

(** [shape3b z x y] draws our shape 3 with color orange and coordinates
    [x] and [y] rotated 180 degrees clockwise. *)
val shape3b : unit -> int ->int -> unit

(** [shape3c z x y] draws our shape 3 with color orange and coordinates
    [x] and [y] rotated 270 degrees clockwise. *)
val shape3c : unit -> int ->int -> unit

(** [shape5a z x y] draws our shape 5 with color green and coordinates
    [x] and [y] rotated 90 degrees clockwise. *)
val shape5a : unit -> int ->int -> unit

(** [shape5b z x y] draws our shape 5 with color green and coordinates
    [x] and [y] rotated 180 degrees clockwise. *)
val shape5b : unit -> int ->int -> unit

(** [shape5c z x y] draws our shape 5 with color green and coordinates
    [x] and [y] rotated 270 degrees clockwise. *)
val shape5c : unit -> int ->int -> unit

(** [shape6a z x y] draws our shape 6 with color magenta and coordinates
    [x] and [y] rotated 90 degrees clockwise. *)
val shape6a : unit -> int ->int -> unit

(** [shape6b z x y] draws our shape 6 with color magenta and coordinates
    [x] and [y] rotated 180 degrees clockwise. *)
val shape6b : unit -> int ->int -> unit

(** [shape6c z x y] draws our shape 6 with color magenta and coordinates
    [x] and [y] rotated 270 degrees clockwise. *)
val shape6c : unit -> int ->int -> unit

(** [shape7a z x y] draws our shape 7 with color red and coordinates
    [x] and [y] rotated 90 degrees clockwise. *)
val shape7a : unit -> int ->int -> unit

(** [shape7b z x y] draws our shape 7 with color red and coordinates
    [x] and [y] rotated 180 degrees clockwise. *)
val shape7b : unit -> int ->int -> unit

(** [shape7c z x y] draws our shape 7 with color red and coordinates
    [x] and [y] rotated 270 degrees clockwise. *)
val shape7c : unit -> int ->int -> unit