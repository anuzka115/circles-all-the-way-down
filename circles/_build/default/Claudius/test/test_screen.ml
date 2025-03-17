open Claudius
open OUnit2

let test_basic_screen_creation _ =
  let palette = Palette.generate_mono_palette 2 in
  let screen = Screen.create 640 480 2 palette in
  assert_equal ~msg:"Dimensions" (640, 480) (Screen.dimensions screen);
  assert_equal ~msg:"Scale" 2 (Screen.scale screen);
  assert_equal ~msg:"Font" None (Screen.font screen);
  assert_equal ~msg:"Palette" palette (Screen.palette screen)

let test_fail_invalid_scale _ =
  let palette = Palette.generate_mono_palette 2 in
  assert_raises (Invalid_argument "Invalid scale") (fun _ -> Screen.create 640 480 (-1) palette)

let test_fail_invalid_dimensions _ =
  let palette = Palette.generate_mono_palette 2 in
  assert_raises (Invalid_argument "Invalid height") (fun _ -> Screen.create 10 0 2 palette);
  assert_raises (Invalid_argument "Invalid width") (fun _ -> Screen.create 0 10 2 palette);
  assert_raises (Invalid_argument "Invalid height") (fun _ -> Screen.create 10 (-10) 2 palette);
  assert_raises (Invalid_argument "Invalid width") (fun _ -> Screen.create (-10) 10 2 palette)

let suite =
  "Screen tests" >::: [
    "Test simple screen set up" >:: test_basic_screen_creation ;
    "Test fail with invalid scale" >:: test_fail_invalid_scale ;
    "Test fail with invalid dimensions" >:: test_fail_invalid_dimensions ;
  ]

let () =
  run_test_tt_main suite
