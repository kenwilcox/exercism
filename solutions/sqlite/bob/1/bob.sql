-- Schema: CREATE TABLE "bob" ("input" TEXT, "reply" TEXT);
-- Task: update the bob table and set the reply based on the input.

with clean_bob as (
    select rowid, trim(trim(trim(trim(input, char(9)), char(10)), char(13)), char(32)) cleaned_input
    from bob
)
update bob
set reply = case
    when not length(cleaned_input) then "Fine. Be that way!"
    when upper(cleaned_input) = cleaned_input and
         cleaned_input glob '*[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]*'
        then iif(cleaned_input like "%?", 
                 "Calm down, I know what I'm doing!", 
                 "Whoa, chill out!")
    when cleaned_input like "%?" then "Sure."
    else "Whatever."
    end
from clean_bob
where bob.rowid = clean_bob.rowid;
