-- Schema: CREATE TABLE "color_code" ("color1" TEXT, "color2" TEXT, "result" INT);
-- Task: update the color_code table and set the result based on the two colors.

with codes(color, code) as ( values 
  ('black',  0),
  ('brown',  1),
  ('red',    2),
  ('orange', 3),
  ('yellow', 4),
  ('green',  5),
  ('blue',   6),
  ('violet', 7),
  ('grey',   8),
  ('white',  9)
) 
update color_code set result = (c1.code * 10) + c2.code
from codes c1, codes c2
where c1.color = color_code.color1
and c2.color = color_code.color2
;
