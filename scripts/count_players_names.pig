register ./../lib/elephant-bird-master/hadoop-compat/target/elephant-bird-hadoop-compat-4.6-SNAPSHOT.jar;
register ./../lib/elephant-bird-master/pig/target/elephant-bird-pig-4.6-SNAPSHOT.jar;
register ./../lib/json-simple-1.1.1.jar;

data = LOAD 'worldcup/part*.txt' USING com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') as MyMap;


james = FILTER data BY (LOWER($0#'text') matches '.*james.*') OR (LOWER($0#'text') matches '.*rodriguez.*') OR (LOWER($0#'text') matches '.*rodríguez.*');
james2 = FOREACH (GROUP james ALL) GENERATE 'James Rodriguez', COUNT(james);


thomas = FILTER data BY (LOWER($0#'text') matches '.*thomas.*') OR (LOWER($0#'text') matches '.*müller.*') OR (LOWER($0#'text') matches '.*muller.*');
thomas2 = FOREACH (GROUP thomas ALL) GENERATE 'Thomas Muller', COUNT(thomas);


neymar = FILTER data BY (LOWER($0#'text') matches '.*neymar.*');
neymar2 = FOREACH (GROUP neymar ALL) GENERATE 'Neymar Jr', COUNT(neymar);


messi = FILTER data BY (LOWER($0#'text') matches '.*messi.*') OR (LOWER($0#'text') matches '.*lionel.*');
messi2 = FOREACH (GROUP messi ALL) GENERATE 'Lionel Messi', COUNT(messi);


vanPersie = FILTER data BY (LOWER($0#'text') matches '.*robin.*') OR (LOWER($0#'text') matches '.*van persie.*') OR (LOWER($0#'text') matches '.*persie.*');
vanPersie2 = FOREACH (GROUP vanPersie ALL) GENERATE 'Robin van Persie', COUNT(vanPersie);


benzema = FILTER data BY (LOWER($0#'text') matches '.*karim.*') OR (LOWER($0#'text') matches '.*benzema.*');
benzema2 = FOREACH (GROUP benzema ALL) GENERATE 'Karim Benzema', COUNT(benzema);


shurrle = FILTER data BY (LOWER($0#'text') matches '.*schürrle.*') OR (LOWER($0#'text') matches '.*schuerrle.*');
shurrle2 = FOREACH (GROUP shurrle ALL) GENERATE 'Andre Schurrle', COUNT(shurrle);


robben = FILTER data BY (LOWER($0#'text') matches '.*arjen.*') OR (LOWER($0#'text') matches '.*robben.*');
robben2 = FOREACH (GROUP robben ALL) GENERATE 'Arjen Robben', COUNT(robben);


enner = FILTER data BY (LOWER($0#'text') matches '.*enner.*') OR (LOWER($0#'text') matches '.*valencia.*');
enner2 = FOREACH (GROUP enner ALL) GENERATE 'Enner Valencia', COUNT(enner);


xherdan = FILTER data BY (LOWER($0#'text') matches '.*xherdan.*') OR (LOWER($0#'text') matches '.*shaqiri.*') OR (LOWER($0#'text') matches '.*xs_11official.*');
xherdan2 = FOREACH (GROUP xherdan ALL) GENERATE 'Xherdan Shaqiri', COUNT(xherdan);


kroos = FILTER data BY (LOWER($0#'text') matches '.*kroos.*') OR (LOWER($0#'text') matches '.*tonikroos.*');
kroos2 = FOREACH (GROUP kroos ALL) GENERATE 'Toni Kroos', COUNT(kroos);


david = FILTER data BY (LOWER($0#'text') matches '.*david luiz.*') OR (LOWER($0#'text') matches '.*davidluiz.*');
david2 = FOREACH (GROUP david ALL) GENERATE 'David Luiz', COUNT(david);


A = union neymar2, james2, thomas2, messi2, vanPersie2, benzema2, shurrle2, robben2, enner2, xherdan2, kroos2, david2;

Store A INTO 'PLAYER';
