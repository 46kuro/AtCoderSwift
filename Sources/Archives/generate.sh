#!/bin/sh

while getopts c:t:o:h: OPT
do
  case $OPT in
    "c" ) CONTEST="$OPTARG" ;;
    "t" ) TASK="$OPTARG" ;;
    "o" ) OUTPUT="$OPTARG" ;;
    "h" ) HTML="$OPTARG" ;;
  esac
done

if [[ -z "$CONTEST" ]]; then
  echo "-c option was required."
  exit 1
fi
if [[ -z "$TASK" ]]; then
  echo "-t option was required."
  exit 1
fi
if [[ -z "$OUTPUT" ]]; then
  OUTPUT="./Sources/AtcoderSwift/Contest/"
fi

if [[ -h "$HTML" ]]; then
  swift run AtCoderSwiftGenerator --contest $CONTEST --task $TASK --output $OUTPUT --html $HTML
else
  swift run AtCoderSwiftGenerator --contest $CONTEST --task $TASK --output $OUTPUT
fi

swift package generate-xcodeproj
open AtCoderSwift.xcodeproj
