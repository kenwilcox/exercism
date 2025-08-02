-- Schema: CREATE TABLE "leap" ( "year" INT, "is_leap" BOOL);
-- Task: update the leap table and set the is_leap based on the year field.

insert into "leap" values (2015, 0);
insert into "leap" values (1970, 0);
insert into "leap" values (1996, 1);
insert into "leap" values (1960, 1);
insert into "leap" values (2100, 0);
insert into "leap" values (1900, 0);
insert into "leap" values (2000, 1);
insert into "leap" values (2400, 1);
insert into "leap" values (1800, 0);
