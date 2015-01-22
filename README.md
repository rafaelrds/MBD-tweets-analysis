# MBD-tweets-analysis

Intro
-----
  We created some scripts to perform the following tasks:
  * Create a bag of words during the world cup event
  * Create a bag of words when the world cup was not happening
  * Count how many times the top players appears at tweets
  * Count the frequency of tweets per minute during the world cup
  
Setup
-----
  Make sure that you have MapReduce and Hadoop installed.
  Make sure that you have [Elephant-Bird](https://github.com/twitter/elephant-bird) installed as well.
  
  Remember to have the input data at the folder specified at each script
  In our case, we used 'worldcup/part*.txt' in all of them.
  

Usage
---------
  Use Pig Latin to run each script

::

    pig <script.pig> --run from hdfs
    
or 

::

    pig -x local <script.pig> --run from local files
