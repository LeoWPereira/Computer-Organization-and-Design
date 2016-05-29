# NOPs serve several purposes:

#    - They allow the debugger to place a breakpoint on a line even if it is combined with others in the generated code.
#    - It allows the loader to patch a jump with a different-sized target offset.
#    - It allows a block of code to be aligned at a particular boundary, which can be good for caching.
#    - It allows for incremental linking to overwrite chunks of code with a call to a new section without having to worry about the overall function changing size.

