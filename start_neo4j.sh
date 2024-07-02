#!/bin/bash

# 定义neo4j安装目录
NEO4J_HOME="/neo4j-community-3.5.17"

# 切换到neo4j安装目录
cd $NEO4J_HOME/bin

# 启动neo4j数据库
./neo4j start