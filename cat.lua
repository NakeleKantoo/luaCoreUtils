#!/bin/lua
function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end
  
  -- get all lines from a file, returns an empty 
  -- list/table if the file does not exist
function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do 
      lines[#lines + 1] = line
    end
    return lines
end
  

fl = arg[1]

if file_exists(fl) then
    for index,value in ipairs(lines_from(fl)) do
        print(index..": "..value)
    end
else
    print("File does not exist!")
end