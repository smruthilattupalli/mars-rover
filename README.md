## INSTRUCTIONS TO RUN THE PROGRAM ::

1. Unzip the file.
2. Open a new terminal and go to the folder where you unzipped the file.
3. $ cd mars-rover
4. Provide the test input in the lib/input.txt file.
5. $ ruby mars_rover_program.rb
6. Check the lib/output.txt file for the final position of the rovers.

## INSTRUCTIONS TO RUN TESTS ::

1. $ cd mars-rover
2. $ rake (To run all the tests)
3. $ rspec spec/rover_spec.rb (To run tests specific to Rover object)
4. $ rspec spec/plateau_spec.rb (To run tests specific to Plateau object)

## MARS ROVER PROGRAM (SUMMARY)

# Assumptions ::

1. The instructions and the coordinates provided in the input file are valid.
2. The first line of input is the upper-right coordinates of the plateau, the lowerleft coordinates are assumed to be 0,0.
3. The rover will only turn 90 degree when instructed to move 'L' or 'R'.
4. The rover will only move one grid in the direction it is heading.
5. The rover will not move or issue a warning when movement is not possible.

## Test Input (input.txt) :
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM

## Expected Output (output.txt) :
1 3 N
5 1 E

## Main Interface (mars_rover_program.rb) ::

1. Parses the input file.
2. Uses first line to set plateau limits (Plateau Object).
3. Groups input into groups of 2 containing position and instructions respectively. Each group is associated to a rover.
4. Initializes rovers and executes instructions sequentially (Rover Object).


## Plateau Object (plateau.rb)::

1. Defines the dimensions of the plateau the rover can move.
2. Initializes the West and South limits as 0 (always).
3. Sets the North and East limits to the specified values in the input file (first line).

## Rover Object (rover.rb)::

1. Defines the rover characters like the its initial position and movements.
2. The <direction>_move_allowed? instance methods check if the move is possible in the particular direction.
3. The execute_instructions() instance method performs the series of instructions one by one.
4. The private methods (turn_left, turn_right and move) are used to execute instructions.
