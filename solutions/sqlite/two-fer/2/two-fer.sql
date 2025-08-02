-- Schema: CREATE TABLE "twofer" ("input" TEXT, "response" TEXT);
-- Task: update the twofer table and set the response based on the input.

update twofer set response = 'One for ' || coalesce(nullif(input,''), 'you') || ', one for me.'
;
