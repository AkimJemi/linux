# Read from the file words.txt and output the word frequency list to stdout.
INPUT=`cat words.txt`
INPUT_SPLIT=(${INPUT// / })
declare -A associative_array;
for STR in ${INPUT_SPLIT[@]}; do
  associative_array["$STR"]=$(( ${associative_array["$STR"]} + 1 ))
done
for STR in "${!associative_array[@]}"; do
  echo "${STR} ${associative_array["$STR"]}"
done | sort -k2,2nr -k1,1
