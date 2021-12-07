#!/bin/bash
WEKA_PATH=$1
SOURCE_DIR=$2
java weka.core.converters.TextDirectoryLoader -dir "$SOURCE_DIR" > "$SOURCE_DIR.arff" 
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i "$SOURCE_DIR.arff"  -o "$SOURCE_DIR_training.arff"  -M 2
java -Xmx1024m  weka.classifiers.meta.AdaBoostM1 -W weka.classifiers.trees.DecisionStump   -t  "$SOURCE_DIR_training.arff" -d "$SOURCE_DIR_training.model" -c 1
