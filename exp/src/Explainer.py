#!/usr/bin/env python

'''
Topic   :: The driver Script for the Explanation generation
Project :: Explanations for Multi-Model Planning
Date    :: 
'''

SEARCH_OPTIONS = ["me", "mce", "ee"]

import argparse, sys
from Problem import Problem

def main():
    
    parser = argparse.ArgumentParser(description='''The driver Script for the Explanation generation''',
                                     epilog="Usage >> ./Explainer.py -m ../domain/fetchworld-tuck-m.pddl -n" +
                                            " ../domain/fetchworld-base-m.pddl -f ../domain/problem1.pddl ")

    # Flags for the search
    parser.add_argument('--approx',   action='store_true',
                        help="Enable use of approximation (currently only supported for ME).")
    parser.add_argument('--heuristic', action='store_true',
                        help="Enable use of heuristic (currently only supported for ME)")
    parser.add_argument('--ground', action='store_true',
                        help="Consider model difference in grounded domain model")

    # Search option
    parser.add_argument('-s', '--search', type=str, help="Search to be use (ME, MCE or EE)")

    # Arguments for the explanation
    parser.add_argument('-m', '--model',   type=str, help="Domain file with real PDDL model of robot.", required=True)
    parser.add_argument('-n', '--nmodel',  type=str, help="Domain file with human model of the robot.", required=True)
    parser.add_argument('-t', '--tmodel', type=str, help="Domain file template for the problem.", required=True)
    parser.add_argument('-p', '--problem', type=str, help="Problem file for robot.", required=True)
    parser.add_argument('-q', '--hproblem', type=str, help="Problem file for human.")
    parser.add_argument('-r', '--tproblem', type=str, help="Problem file template.", required=True)
    parser.add_argument('-f', '--plan_file',    type=str, help="Plan file.")
    parser.add_argument('-a', '--alpha',    type=str, help="alpha value for EE")
 

    if not sys.argv[1:] or '-h' in sys.argv[1:]:
        print parser.print_help()
        sys.exit(1)
    args = parser.parse_args()


    if args.search.lower() not in SEARCH_OPTIONS:
        print "Unknown: Search option, please select ME, MCE or EE"
        sys.exit(1)

    import time
    curr_time = time.time()
    # define problem object and run the required search
    pr_obj = Problem(args.model, args.nmodel, args.problem, args.tmodel,
     args.ground, args.approx, args.heuristic,
     args.tproblem, args.hproblem, args.plan_file, float(args.alpha))

    if args.search.lower() == "me":
        plan = pr_obj.MeSearch()
    elif args.search.lower() == "mce":
        if args.approx and args.heuristic:
            print "MCE doesn't support heuristic or approx"
            exit(1)
        plan = pr_obj.MCESearch()
    else:
        plan = pr_obj.EESearch()
    explanation      = ''
    for item in plan:
        explanation += "Explanation >> {}\n".format(item)

    print explanation.strip()
    print "Explantion Size:",len(plan)
    print "Total Time ",time.time() - curr_time
    with open('exp.dat', 'w') as explanation_file:
        explanation_file.write(explanation.strip())


if __name__ == '__main__':
    main()
