# http://sourceware.org/gdb/wiki/FAQ: to disable the
# "---Type <return> to continue, or q <return> to quit---"
# in batch mode:
# gdb --batch --command=script.gdb --args ./cuMemory
set width 0
set height 0
set verbose off

# b mmap if $rsi==0x3ab000
# b cuInit
b cuDeviceGet
commands 1
  bt
  # i proc mappings
  continue
end

run
