 
 

#Part 1 of the problem

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

elfClasSrt = elfCals.sort_by{|k,v| v}.reverse.to_h

puts "Elf no. #{elfClasSrt.keys.first.to_s} is carrying the most calories (#{elfClasSrt.values.first.to_s})"




# Bonus part of the problem

puts "Top elfs in carrying calories are:"
i = 1
sum = 0
elfClasSrt.each do |key, value|
    puts "Elf no. #{key.to_s} is carrying #{value.to_s} calories"
    i += 1
    sum += value
    break if i > 3
end

puts "And they are carrying #{sum.to_s} calories in total"




