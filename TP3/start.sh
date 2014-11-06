#!/bin/sh

stop-dfs.sh
hadoop namenode -format
start-dfs.sh
hadoop fs -put author-small.txt hdfs:///author-small.txt
hadoop fs -put author-large.txt hdfs:///author-large.txt
