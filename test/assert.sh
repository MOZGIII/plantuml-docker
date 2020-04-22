#!/bin/bash
set -xeuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

DATA_DIR="$(pwd)/data"
FORMAT="png"

EXPECT_FILE="$DATA_DIR/test.$FORMAT"

rm -f "$EXPECT_FILE"

docker build .. -t test
docker run --rm -v "$DATA_DIR:/data" test "-t$FORMAT" test.pu

if [[ ! -f "$EXPECT_FILE" ]]; then
  echo "File \"$EXPECT_FILE\" wasn't created" >&2
  exit 1
fi

echo "Success"
exit 0
