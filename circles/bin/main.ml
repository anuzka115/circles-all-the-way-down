open Claudius

let tick t _s prev _i =
  let buffer = Framebuffer.map (fun pixel ->
    match pixel with
    | 0 -> 0
    | x -> x - 1
  ) prev in
  for i = 49 downto 0 do
    Framebuffer.draw_circle 320 240 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 160 120 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 160 360 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 480 360 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 480 120 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
  done;
  for i = 19 downto 0 do
    Framebuffer.draw_circle 320 120 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 320 360 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 160 240 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 480 240 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
  done;
  for i = 9 downto 0 do
    Framebuffer.draw_circle 320 60 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 320 440 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 80 240 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
    Framebuffer.draw_circle 560 240 (Float.of_int i) ((i + (t / 10)) mod 24) buffer;
  done;
    Framebuffer.draw_circle 160 120 50. ((50 + (t / 10)) mod 24) buffer;
  
    
  buffer

let () =
  Palette.generate_mono_palette 24 |>
  Screen.create 640 480 1 |>
  Base.run "Shapes test" None tick
