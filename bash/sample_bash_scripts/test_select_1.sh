 #!/bin/bash

fruit_list=( apple banana grapes orange "pine apple"  )

select fruit in "${fruit_list[@]}"
do
  echo "Selected fruit: $fruit"
  echo "Selected number: $REPLY"
done