register ./../lib/elephant-bird-hadoop-compat-4.6-SNAPSHOT.jar;
register ./../lib/elephant-bird-pig-4.6-SNAPSHOT.jar;
register ./../lib/json-simple-1.1.1.jar;

data = LOAD 'worldcup/part*.txt' USING com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') as MyMap;


grouped_data = GROUP data BY SUBSTRING($0#'created_at', 0, 16);

filtered_data_final = FILTER grouped_data BY ((SUBSTRING(group, 4, 7) == 'Jul') AND (SUBSTRING(group, 8, 10) == '13')
					AND ((int)SUBSTRING(group, 11, 13) <= 21) AND ((int)SUBSTRING(group, 11, 13) >= 18));
					
					
counted_data = FOREACH filtered_data_final GENERATE group, COUNT(data);

Store counted_data INTO 'counted_date_final_game';
