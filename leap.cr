for i in 1900..2000 do
  if i%4 == 0 && i%100 == 0 && i%400 == 0
    puts i
  elsif i%4 == 0 && i%100 == 0
    puts "false #{i}"
  elsif i%4 == 0
    puts i
  end
end
