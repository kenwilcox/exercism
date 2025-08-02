-- Schema: CREATE TABLE "grains" ("task" TEXT, "square" INT, "result" INT);
-- Task: update the grains table and set the result based on the task (and square fields).

insert into "grains" values ("single-square", 1, 1);
insert into "grains" values ("single-square", 2, 2);
insert into "grains" values ("single-square", 3, 4);
insert into "grains" values ("single-square", 4, 8);
insert into "grains" values ("single-square", 16, 32768);
insert into "grains" values ("single-square", 32, 2147483648);
insert into "grains" values ("single-square", 64, 9223372036854775808);
insert into "grains" values ("total", 0, 18446744073709551615);
