#!/usr/bin/env bash

# "Migrate to AndroidX" converter in Android Studio doesn't work very

MAPPING_FILE=path/to/androidx-class-mapping.csv
PROJECT_DIR=path/to/android/project

replace=""
while IFS=, read -r from to
do
	replace+="; s/$from/$to/g"
done <<< "$(cat $MAPPING_FILE)"

find $PROJECT_DIR \( -name "*.kt" -o -name "*.java" -o -name "*.xml" \) -type f -not -path '*/\.git*' -print0 | xargs -0 gsed -i "$replace"
