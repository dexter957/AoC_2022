
# part 1 of the problem

rucksFile = "rucksacks.txt"
file = File.open(rucksFile,"r")
contents = file.readlines()
file.close()


# ---- All letters and their priority ----
priorities =   {:a => 1, :b => 2, :c => 3,
                :d => 4, :e => 5, :f => 6,
                :g => 7, :h => 8, :i => 9,
                :j => 10, :k => 11, :l => 12,
                :m => 13, :n => 14, :o => 15,
                :p => 16, :q => 17, :r => 18,
                :s => 19, :t => 20, :u => 21,
                :v => 22, :w => 23, :x => 24,
                :y => 25, :z => 26,
                :A => 27, :B => 28, :C => 29,
                :D => 30, :E => 31, :F => 32,
                :G => 33, :H => 34, :I => 35,
                :J => 36, :K => 37, :L => 38,
                :M => 39, :N => 40, :O => 41,
                :P => 42, :Q => 43, :R => 44,
                :S => 45, :T => 46, :U => 47,
                :V => 48, :W => 49, :X => 50,
                :Y => 51, :Z => 52}

priority = 0

contents.each do |content|
    len = content.size
    first = content[0,len/2]
    second = content[(len/2),len/2]
    first_sorted = first.chars.sort.join
    second_sorted = second.chars.sort.join

    i = 0
    common = ""
    loop do
        isCapital = first_sorted[i] == first_sorted[i].capitalize()

        if isCapital
            j = 0
            loop do
                if first_sorted[i] == second_sorted[j]
                    if !(common.include? second_sorted[j])
                        priority += priorities[second_sorted[j].to_sym]
                    end
                    common = common + second_sorted[j]
                end
                j += 1
            break if ((j == len/2) or (second_sorted[j].capitalize() != second_sorted[j]))
            end
        else
            j = (len/2) - 1
            loop do
                if first_sorted[i] == second_sorted[j]
                    if !(common.include? second_sorted[j])
                        priority += priorities[second_sorted[j].to_sym]
                    end
                    common = common + second_sorted[j]
                end
                j -= 1
            break if ((j < 0 ) or (second_sorted[j].capitalize() == second_sorted[j]))
            end
        end
        i += 1
        break if i == len/2
    end
end

puts "The priority is #{priority.to_s}"





