#!/bin/bash
REVIEW=$(sed 's/\s\+/\n/g' "$1" | sort )
echo "Tweet check started"
MINIMUM_COMMON_WORDS=2
TWEETS_USED=30
while IFS=, read -r c1 c2 c3 c4 c5 c6; do
      CLEAN_TWEET=$(echo "$c6" | cat | sed -e 's/ing[[:blank:]]/ /g;s/ed[[:blank:]]/ /g' | sed 's/[Ss][[:blank:]]/ /g;' | sed -e 's/,//g;s/\.//g;s/\;//g;s/\x27//g;s/\!//g;s/\://g;s/\"//g;s/\?//g;s/\///g;s/\\//g;s/'\{'//g;s/'\}'//g;s/\[//g;s/\]//g;s/\|//g;s/\<//g;s/\>//g;s/\~//g;s/\`//g;s/@//g;s/\#//g;s/\$//g;s/%//g;s/\^//g;s/\&//g;s/\*//g;s/(//g;s/)//g;s/-//g;s/_//g;s/=//g;s/+//g')
      FOUND=$( (comm -12 <(echo "$REVIEW")  <(echo "$CLEAN_TWEET" | sed 's/\s\+/\n/g' | sort | cat) )  | wc -l )
      if [ "$FOUND" -ge "$MINIMUM_COMMON_WORDS" ];
      then echo "$CLEAN_TWEET" | sed 's/\s\+/ /g' | sort -t' '| cat >> "$1"
      fi
done < <(head -n $TWEETS_USED "$2")
