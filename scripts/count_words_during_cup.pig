register ./../lib/elephant-bird-master/hadoop-compat/target/elephant-bird-hadoop-compat-4.6-SNAPSHOT.jar;
register ./../lib/elephant-bird-master/pig/target/elephant-bird-pig-4.6-SNAPSHOT.jar;
register ./../lib/json-simple-1.1.1.jar;

data = LOAD 'worldcup/part*.txt' USING com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') as MyMap;

filtered_data_jun = FILTER data BY ((SUBSTRING($0#'created_at', 4, 7) == 'Jun') AND ((int)SUBSTRING($0#'created_at', 8, 10) >= 12) AND ((int)SUBSTRING($0#'created_at', 8, 10) <= 26));

filtered_data_jul = FILTER data BY ((SUBSTRING($0#'created_at', 4, 7) == 'Jul') AND ((((int)SUBSTRING($0#'created_at', 8, 10) >= 4) AND ((int)SUBSTRING($0#'created_at', 8, 10) <= 5))
			OR (((int)SUBSTRING($0#'created_at', 8, 10) >= 8) AND ((int)SUBSTRING($0#'created_at', 8, 10) <= 9))
			OR ((int)SUBSTRING($0#'created_at', 8, 10) == 13)));

filtered_data = UNION filtered_data_jun, filtered_data_jul;

B = foreach filtered_data generate flatten(TOKENIZE((chararray)$0#'text')) as word;
C = group B by word;
D = foreach C generate COUNT(B) as count, group;
big_groups = FILTER D BY count > 2;
			

Store big_groups INTO 'word_count_during_cup';


--12 jun until 26 jun
--4 and 5 JUL
--8 and 9
--13 jul
