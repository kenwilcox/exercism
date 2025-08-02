-- Schema: CREATE TABLE "darts" ("x" REAL, "y" REAL, score INTEGER);
-- Task: update the darts table and set the score based on the x and y values.

update darts
set score = case
    when x * x + y * y > 100 then  0
    when x * x + y * y >  25 then  1
    when x * x + y * y >   1 then  5
    else                          10
end
;
