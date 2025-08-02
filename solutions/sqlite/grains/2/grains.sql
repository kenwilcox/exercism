-- Schema: CREATE TABLE "grains" ("task" TEXT, "square" INT, "result" INT);
-- Task: update the grains table and set the result based on the task (and square fields).

update grains set result = power(2, square - 1) where task = 'single-square';
update grains set result = power(2, 64) - 1 where task = 'total';
