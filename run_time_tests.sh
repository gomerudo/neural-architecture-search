#!/bin/bash

echo "Running NAS with RL tests with different N_TRIALS values."

TIMEFORMAT=%R

TIMES_ARRAY=()

#for n in 1 5 10 15 20 25 30 50; do
for n in 1; do
    TRAIN_FILE="train${n}.py"
    LOG_FILE="train${n}.log"
    START_TIME=$(date)
    echo "Running ${TRAIN_FILE}"
    echo "${START_TIME}"
    #echo ${START_TIME} > ${LOG_FILE} ;
    SPENT=$(TIMEFORMAT=%R; (time python3 ${TRAIN_FILE} >> ${LOG_FILE}) 2>&1 > /dev/null)
    #$python3 train.py >> ${LOG_FILE} ;
    END_TIME=$(date)
    TIMES_ARRAY+=(${SPENT})
    #TIMES_ARRAY[${#TIMES_ARRAY[@]}] = ${SPENT}
    echo "${END_TIME}"
    echo "End of experiment with ${TRAIN_FILE}"
    echo ""
    #echo ${END_TIME} > ${LOG_FILE} ;
done

echo "${TIMES_ARRAY[@]}"