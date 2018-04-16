#!/bin/bash

FILENAME=results_dragoon.csv
touch $FILENAME
echo "\# of students,plan_length" > $FILENAME

PLANNER_PATH="./../../../Metric-FF/ff"
#DOMAIN_PATH="../its-integration/moo/domains/dragoon/domains/"
DOMAIN_PATH=dragoon/domains/
for i in {1..20}
do
	echo "---------- iteration "$i
	python compile_jigsaw_domain.py -s $i;
	$PLANNER_PATH -p $DOMAIN_PATH -o domain-jigsaw.pddl -f problem-jigsaw.pddl | grep -E "[0-9]+:" > temp.txt;
	STEPS=($(wc -l temp.txt));
	
	echo "$i,${STEPS[0]}" >> $FILENAME
done
