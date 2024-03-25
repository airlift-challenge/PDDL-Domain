PDPTW - A Simple Pickup and Delivery with Time Windows (PDPTW) Domain

This is compatible with PDDL2.1

To run planners, you can use planutils: https://github.com/AI-Planning/planutils/tree/main

1) Start docker with the planutils image, mounting the local folder where the pddl is located
   (so it can be accessed from within docker):
     docker run -v PATH_TO_LOCAL_FOLDER_CONTAINING_PDDL:/root/data -it --privileged aiplanning/planutils:latest bash

2) Activate planutils:
     planutils activate

3) Run the popf planner:
      popf data/domain.pddl data/probPDPTW-3-3-2.pddl
   Note: the first time you run the planner, you will be asked if it should be downloaded.
