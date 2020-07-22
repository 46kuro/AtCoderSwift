#!/bin/sh

while getopts c:t:o: OPT
do
  case $OPT in
    "c" ) CONTEST="$OPTARG" ;;
    "t" ) TASK="$OPTARG" ;;
    "o" ) OUTPUT="$OPTARG" ;;
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

swift run AtCoderSwiftGenerator --contest $CONTEST --task $TASK --output $OUTPUT
swift package generate-xcodeproj
open AtCoderSwift.xcodeproj
