register ./../lib/elephant-bird-master/hadoop-compat/target/elephant-bird-hadoop-compat-4.6-SNAPSHOT.jar;
register ./../lib/elephant-bird-master/pig/target/elephant-bird-pig-4.6-SNAPSHOT.jar;
register ./../lib/json-simple-1.1.1.jar;

data = LOAD 'worldcup/part*.txt' USING com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') as MyMap;

grouped_data = GROUP data BY SUBSTRING($0#'created_at', 0, 16);

counted_data = FOREACH grouped_data GENERATE group, COUNT(data);

Store counted_data INTO 'counted_date';
