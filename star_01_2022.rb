 


calFile = "calories.txt"
file = File.open(calFile,"r")
contents = file.readlines()
file.close()



elfCals = {}
i = 1
sumCals = 0

contents.each do |content|
    if content == "\n"
        elfCals[i] = sumCals
        i += 1
        sumCals = 0
    else
        sumCals += content.to_i
    end
end
elfCals[i] = sumCals

#puts elfCals
elfClasSrt = elfCals.sort_by{|k,v| v}.to_h
#puts elfClasSrt

puts "Elf no. #{elfClasSrt.keys.last.to_s} is carrying the most calories (#{elfClasSrt.values.last.to_s})"












