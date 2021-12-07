# CS185Assignment5

Description of Files and Questions
cmds.log contains all questions and answers, with the relevant commands shown
a5.txt is the console output, although its messy capturing "nano" command outputs
the bash scripts text_binary_classify takes a directory of two directories of data, and compares them
commonTweets is from assignment 4, and uses the tweet database file to add tweets with 2 or more common words with a given review

Questions:
1) Making two directories with 100 helpful reviews under REVIEWS; and 100 unhelpful reviews under REVIEWS_UNHELPFUL. 
Similar to my first 3 steps from assignment 4

mkdir {ALL_REVIEWS,ALL_REVIEWS/HELPFUL,ALL_REVIEWS/UNHELPFUL}

cut -f 3,9 amazon_reviews_us_Books_v1_02.tsv | sort -nk2 | head -n 100 | awk '{print $1}' > reviewIDs.txt
input="reviewIDs.txt"; while read -r line; do awk -F"\t" -v "ID=$line" '$3 == ID' amazon_reviews_us_Books_v1_02.tsv > "ALL_REVIEWS/HELPFUL/$line.txt"; done < "$input"
for FILE in ALL_REVIEWS/HELPFUL/*.txt; do cut -f 14 "$FILE" | sed -e 's/ing[[:blank:]]/ /g;s/ed[[:blank:]]/ /g;s/[Ss][[:blank:]]/ /g' > "$FILE.temp" ; mv "$FILE.temp" "$FILE" ;  done
for FILE in ALL_REVIEWS/HELPFUL/*.txt; do sed -e 's/,//g;s/\.//g;s/\;//g;s/\x27//g;s/\!//g;s/\://g;s/\"//g;s/\?//g;s/\///g;s/\\//g;s/'\{'//g;s/'\}'//g;s/\[//g;s/\]//g;s/\|//g;s/\<//g;s/\>//g;s/\~//g;s/\`//g;s/@//g;s/\#//g;s/\$//g;s/%//g;s/\^//g;s/\&//g;s/\*//g;s/(//g;s/)//g;s/-//g;s/_//g;s/=//g;s/+//g' "$FILE" > "$FILE.temp" ; mv "$FILE.temp" "$FILE" ;  done
for FILE in ALL_REVIEWS/HELPFUL/*.txt; do sed -e 's/\<.\>//g;s/\<..\>//g' "$FILE" | sed 's/\<about\>//g;s/\<actually\>//g;s/\<almost\>//g;s/\<also\>//g;s/\<although\>//g;s/\<always\>//g;s/\<and\>//g;s/\<any\>//g;s/\<are\>//g;s/\<became\>//g;s/\<become\>//g;s/\<but\>//g;s/\<can\>//g;s/\<could\>//g;s/\<did\>//g;s/\<does\>//g;s/\<each\>//g;s/\<either\>//g;s/\<else\>//g;s/\<for\>//g;s/\<from\>//g;s/\<had\>//g;s/\<has\>//g;s/\<have\>//g;s/\<hence\>//g;s/\<how\>//g;s/\<its\>//g;s/\<may\>//g;s/\<maybe\>//g;s/\<might\>//g;s/\<mine\>//g;s/\<must\>//g;s/\<neither\>//g;s/\<nor\>//g;s/\<not\>//g;s/\<when\>//g;s/\<where\>//g;s/\<wherea\>//g;s/\<wherever\>//g;s/\<whenever\>//g;s/\<whether\>//g;s/\<which\>//g;s/\<while\>//g;s/\<who\>//g;s/\<whom\>//g;s/\<whoever\>//g;s/\<whose\>//g;s/\<why\>//g;s/\<will\>//g;s/\<with\>//g;s/\<within\>//g;s/\<without\>//g;s/\<would\>//g;s/\<yes\>//g;s/\<yet\>//g;s/\<you\>//g;s/\<your\>//g;s/\<the\>//g;s/\<thi\>//g' > "$FILE.temp" ; mv "$FILE.temp" "$FILE" ; done

cut -f 3,9 amazon_reviews_us_Books_v1_02.tsv | sort -nk2 | tail -n 100 | awk '{print $1}' > reviewIDs.txt
input="reviewIDs.txt"; while read -r line; do awk -F"\t" -v "ID=$line" '$3 == ID' amazon_reviews_us_Books_v1_02.tsv > "ALL_REVIEWS/UNHELPFUL/$line.txt"; done < "$input"
for FILE in ALL_REVIEWS/UNHELPFUL/*.txt; do cut -f 14 "$FILE" | sed -e 's/ing[[:blank:]]/ /g;s/ed[[:blank:]]/ /g;s/[Ss][[:blank:]]/ /g' > "$FILE.temp" ; mv "$FILE.temp" "$FILE" ;  done
for FILE in ALL_REVIEWS/UNHELPFUL/*.txt; do sed -e 's/,//g;s/\.//g;s/\;//g;s/\x27//g;s/\!//g;s/\://g;s/\"//g;s/\?//g;s/\///g;s/\\//g;s/'\{'//g;s/'\}'//g;s/\[//g;s/\]//g;s/\|//g;s/\<//g;s/\>//g;s/\~//g;s/\`//g;s/@//g;s/\#//g;s/\$//g;s/%//g;s/\^//g;s/\&//g;s/\*//g;s/(//g;s/)//g;s/-//g;s/_//g;s/=//g;s/+//g' "$FILE" > "$FILE.temp" ; mv "$FILE.temp" "$FILE" ;  done
for FILE in ALL_REVIEWS/UNHELPFUL/*.txt; do sed -e 's/\<.\>//g;s/\<..\>//g' "$FILE" | sed 's/\<about\>//g;s/\<actually\>//g;s/\<almost\>//g;s/\<also\>//g;s/\<although\>//g;s/\<always\>//g;s/\<and\>//g;s/\<any\>//g;s/\<are\>//g;s/\<became\>//g;s/\<become\>//g;s/\<but\>//g;s/\<can\>//g;s/\<could\>//g;s/\<did\>//g;s/\<does\>//g;s/\<each\>//g;s/\<either\>//g;s/\<else\>//g;s/\<for\>//g;s/\<from\>//g;s/\<had\>//g;s/\<has\>//g;s/\<have\>//g;s/\<hence\>//g;s/\<how\>//g;s/\<its\>//g;s/\<may\>//g;s/\<maybe\>//g;s/\<might\>//g;s/\<mine\>//g;s/\<must\>//g;s/\<neither\>//g;s/\<nor\>//g;s/\<not\>//g;s/\<when\>//g;s/\<where\>//g;s/\<wherea\>//g;s/\<wherever\>//g;s/\<whenever\>//g;s/\<whether\>//g;s/\<which\>//g;s/\<while\>//g;s/\<who\>//g;s/\<whom\>//g;s/\<whoever\>//g;s/\<whose\>//g;s/\<why\>//g;s/\<will\>//g;s/\<with\>//g;s/\<within\>//g;s/\<without\>//g;s/\<would\>//g;s/\<yes\>//g;s/\<yet\>//g;s/\<you\>//g;s/\<your\>//g;s/\<the\>//g;s/\<thi\>//g' > "$FILE.temp" ; mv "$FILE.temp" "$FILE" ; done

2) put weka on CLASSPATH on .bashrc
These were used for installation:

wget https://prdownloads.sourceforge.net/weka/weka-3-8-5-azul-zulu-linux.zip
unzip weka-3-8-5-azul-zulu-linux.zip
./weka-3-8-5/weka.sh
export CLASSPATH=$CLASSPATH:`pwd`/weka.jar:`pwd`/libsvm.jar


3) Recreate first 3 steps of assignment 4 to obtain helpful and unhelpful files in their own directories

java weka.core.converters.TextDirectoryLoader -dir ALL_REVIEWS > all_reviews.arff

4) Check arrf file 

nano all_reviews.arff

5) Convert arff to training data

java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i all_reviews.arff -o all_reviews_training.arff -M 2

6) Check and describe training file

nano all_reviews_training.arff

Looking into the training file, I can see all of the words from the cleaned up review as "attributes"
Each word is desbribed as a numeric attribute on its own line
I also see a header file that describes the relation that the arff file describes
Weka describes the file as WordTokenizer with a very long list of specifications from how it turns words into WordTokens

Further down the file, there is a section labeled "@data"
On following lines, there are lists of numbers, and some of them describe the file the data is taken from, as "REVIEWS"

7) Instead of the default ClassificationViaRegression , I used the AdaBoostM1 classifier.
This classifier is known for its efficiency, with some loss of accuracy compared to ClassificationViaRegression

java -Xmx1024m  weka.classifiers.meta.AdaBoostM1 -W weka.classifiers.trees.DecisionStump   -t  all_reviews_training.arff -d all_reviews_training.model -c 1

8) Script to serialize file to machine learned model process from above
Two parameters for script: absolute path of weka installation, and absolute path of files to use in ML process
I was unsure how to incorporate the weka path into the file, since from my installation it seems weka is accessible as it is a part of the CLASSPATH

nano text_binary_classify.sh
chmod +x text_binary_classify.sh

#!/bin/bash
WEKA_PATH=$1
SOURCE_DIR=$2
java weka.core.converters.TextDirectoryLoader -dir "$SOURCE_DIR" > "$SOURCE_DIR.arff" 
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i "$SOURCE_DIR.arff"  -o "$SOURCE_DIR_training.arff"  -M 2
java -Xmx1024m  weka.classifiers.meta.AdaBoostM1 -W weka.classifiers.trees.DecisionStump   -t  "$SOURCE_DIR_training.arff" -d "$SOURCE_DIR_training.model" -c 1

./text_binary_classify.sh ./weka-3-8-5 ./ALL_REVIEWS

9)
Due to problems with my assigment 4 unable to run parallel command without crashing IGM server connection, I created the tweet-attached reviews serially.

mkdir {REVIEWS_WITH_TWEETS,REVIEWS_WITH_TWEETS/HELPFUL,REVIEWS_WITH_TWEETS/UNHELPFUL}
cp ALL_REVIEWS/HELPFUL/* REVIEWS_WITH_TWEETS/HELPFUL/
cp ALL_REVIEWS/UNHELPFUL/* REVIEWS_WITH_TWEETS/UNHELPFUL/

time for FILE in REVIEWS_WITH_TWEETS/HELPFUL/*.txt; do ./commonTweets.sh "$FILE" training.1600000.processed.noemoticon.csv ; done
time for FILE in REVIEWS_WITH_TWEETS/UNHELPFUL/*.txt; do ./commonTweets.sh "$FILE" training.1600000.processed.noemoticon.csv ; done

./text_binary_classify.sh ./weka-3-8-5 ./REVIEWS_WITH_TWEETS

10)
The AdaBoostM1 based classification was able to differenciate the reviews in a way that most helpful reviews were seen in the helpful category, and visa versa with the unhelpful reviews. 
This was entirely done by looking at the reviews themselves, and feeding them into the weka classifier. The end result is 82% accuracy for unhelpful reviews, and 84% for helpful reviews.
Looking at the version of the files with tweets, the accuracy is actually worse than this (with the same AdaBoostM1 metric).
Only 80% of unhelpful reviews are found as unhelpful, and 82% of helpful reviews are found helpful.
More accuracy is not obtained in this case considering the lack of context from any given tweet.
There is an unreliability to random tweets as a way to measure amazon review helpfulness. 
