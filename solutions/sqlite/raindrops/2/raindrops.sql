-- Schema: CREATE TABLE "raindrops" ("number" INT, "sound" TEXT);
-- Task: update the raindrops table and set the sound based on the number.

update raindrops
set sound = iif(number % 3 = 0, "Pling", "") || iif(number % 5 = 0, "Plang", "") || iif(number % 7 = 0, "Plong", "")
;

update raindrops
set sound = iif(sound = "", number, sound)
;
