#!/bin/bash

echo "Running NAS with RL tests with different N_TRIALS values."

# Set timeformat to measure seconds according to docs
TIMEFORMAT=%R

# Init the array of times
TIMES_ARRAY=()

#for n in 1 5 10 15 20 25 30 50; do
for n in 1 5; do
    # Create the train and log filenames
    TRAIN_FILE="train${n}.py"
    LOG_FILE="train${n}.log"
    
    # Log the start time (just for info)
    START_TIME=$(date)
    echo "${START_TIME}"

    # Run the file and measure the time, but not printing int
    echo "Running ${TRAIN_FILE}"
    SPENT=$(TIMEFORMAT=%R; (time python3 ${TRAIN_FILE} >> ${LOG_FILE}) 2>&1 > /dev/null)

    # Add the spent time to the array of times for latter plotting
    TIMES_ARRAY+=(${SPENT})

    # Log the end time (just for info)
    END_TIME=$(date)
    echo "${END_TIME}"

    # Print final message
    echo "End of experiment with ${TRAIN_FILE}"
    echo "Reported time spent was: ${SPENT}"
    echo ""
done

# Print the array of times
echo "${TIMES_ARRAY[@]}"