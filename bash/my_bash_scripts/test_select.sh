 #!/bin/bash

select animal in cat dog bird frog turtle
do
  echo "Selected animal: $animal"
  echo "Selected number: $REPLY"
done
# 