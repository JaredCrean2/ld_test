# test calling code in a dynamic library

# prepend to LD_LIBRARY_PATH based on the file
# even after updating LD_LIBRARY_PATH, ccall can't find lib1
entries = readdlm("EVARS")
ld_path = get(ENV, "LD_LIBRARY_PATH", "")

for i=1:length(entries)
  ld_path = string(entries[i], ":", ld_path)
end
ENV["LD_LIBRARY_PATH"] = ld_path


function testfunc(i::Integer)

  ccall( ("testfunc", "lib1"), Void, (Cint,), i)

  return nothing
end

testfunc(2)
