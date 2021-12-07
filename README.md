# CS185Assignment5

Description of Files and Questions
cmds.log contains all questions and answers, with the relevant commands shown
a5.txt is the console output, although its messy capturing "nano" command outputs
the bash scripts text_binary_classify takes a directory of two directories of data, and compares them
commonTweets is from assignment 4, and uses the tweet database file to add tweets with 2 or more common words with a given review

Written Questions:
6) Check and describe training file

nano all_reviews_training.arff

Looking into the training file, I can see all of the words from the cleaned up review as "attributes"
Each word is desbribed as a numeric attribute on its own line
I also see a header file that describes the relation that the arff file describes
Weka describes the file as WordTokenizer with a very long list of specifications from how it turns words into WordTokens

Further down the file, there is a section labeled "@data"
On following lines, there are lists of numbers, and some of them describe the file the data is taken from, as "REVIEWS"

8) Script to serialize file to machine learned model process from above
Two parameters for script: absolute path of weka installation, and absolute path of files to use in ML process
I was unsure how to incorporate the weka path into the file, since from my installation it seems weka is accessible as it is a part of the CLASSPATH

#!/bin/bash
WEKA_PATH=$1
SOURCE_DIR=$2
java weka.core.converters.TextDirectoryLoader -dir "$SOURCE_DIR" > "$SOURCE_DIR.arff" 
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i "$SOURCE_DIR.arff"  -o "$SOURCE_DIR_training.arff"  -M 2
java -Xmx1024m  weka.classifiers.meta.AdaBoostM1 -W weka.classifiers.trees.DecisionStump   -t  "$SOURCE_DIR_training.arff" -d "$SOURCE_DIR_training.model" -c 1


EXAMPLE USAGE:
./text_binary_classify.sh ./weka-3-8-5 ./ALL_REVIEWS

10)
The AdaBoostM1 based classification was able to differenciate the reviews in a way that most helpful reviews were seen in the helpful category, and visa versa with the unhelpful reviews. 
This was entirely done by looking at the reviews themselves, and feeding them into the weka classifier. The end result is 82% accuracy for unhelpful reviews, and 84% for helpful reviews.
Looking at the version of the files with tweets, the accuracy is actually worse than this (with the same AdaBoostM1 metric).
Only 80% of unhelpful reviews are found as unhelpful, and 82% of helpful reviews are found helpful.
More accuracy is not obtained in this case considering the lack of context from any given tweet.
There is an unreliability to random tweets as a way to measure amazon review helpfulness. 
