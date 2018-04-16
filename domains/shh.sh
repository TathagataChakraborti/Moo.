#!/bin/bash

touch results.csv
echo "iteration,4-students,1-student" > results.csv

PLANNER_PATH="./../../../Metric-FF/ff"
#DOMAIN_PATH="../its-integration/moo/domains/dragoon/domains/"
DOMAIN_PATH=dragoon/domains/
for i in {1..150}
do
	echo "---------- iteration "$i
	python compile_jigsaw_domain.py;
	$PLANNER_PATH -p $DOMAIN_PATH -o domain-jigsaw.pddl -f problem-jigsaw.pddl | grep -E "[0-9]+:" > temp.txt;
	STEPS=($(wc -l temp.txt));
	
	$PLANNER_PATH -p $DOMAIN_PATH -o domain-jigsaw.pddl -f problem-jigsaw-single.pddl | grep -E "[0-9]+:" > temp.txt
	STEPS_SINGLE=($(wc -l temp.txt))
	mv "$DOMAIN_PATH"domain-jigsaw.pddl "$DOMAIN_PATH"domain-jigsaw_$i.pddl
	mv "$DOMAIN_PATH"problem-jigsaw.pddl "$DOMAIN_PATH"problem-jigsaw_$i.pddl;

	echo "$i,${STEPS[0]},${STEPS_SINGLE[0]}" >> results.csv
done
