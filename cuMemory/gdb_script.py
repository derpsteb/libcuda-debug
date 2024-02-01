import gdb

# Set environment similar to the GDB script
gdb.execute("set width 0")
gdb.execute("set height 0")
gdb.execute("set verbose off")

# Function to be called when the breakpoint is hit
def breakpoint_handler(event):
    if isinstance(event, gdb.BreakpointEvent):
        # Check if condition $rsi == 0x3ab000 is met
        gdb.execute("bt")  # Print backtrace
        gdb.execute("continue")  # Continue execution

# Create a breakpoint at 'mmap' and attach the handler
# breakpoint = gdb.Breakpoint("mmap")
# breakpoint.condition = "$rsi == 0x3ab000"

# Start the program
gdb.execute("start")

mappings = gdb.execute("info proc mappings", to_string=True)  # Print process mappings
cudaline = [line for line in mappings.split("\n") if "libcuda.so.535.104.05" in line][0]
cudabase = int(cudaline.strip().split(" ")[0], 16)

gdb.Breakpoint(f"*{hex(cudabase + 0x3ee952)}") # 2 calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x3efb42)}") # 2 calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x2a3a34)}") # 2 calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x2a120d)}") # 2 calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x43e02a)}") # 2 calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x3c2830)}") # n calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x3c3989)}") # n calls
# gdb.Breakpoint(f"*{hex(cudabase + 0x3c9c01)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x3ce30d)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x3cf589)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x177552)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x29f111)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x2a2bfb)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x217799)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x20b7c1)}")
# gdb.Breakpoint(f"*{hex(cudabase + 0x2caa7b)}")

gdb.events.stop.connect(breakpoint_handler)

gdb.execute("continue")
gdb.execute("quit")
