
=begin

A, X: Rock
B, Y: Paper
C, Z: Scissors

=end

# Part 1 of the problem

puts "=========== Going for part one ==========="

# ---- All possible pairs and their value ----
pairs = {:AX => 3, :AY => 6, :AZ => 0,
         :BX => 0, :BY => 3, :BZ => 6,
         :CX => 6, :CY => 0, :CZ => 3}


# ---- Each choice's value ----
cVal = {:X => 1,
        :Y => 2,
        :Z => 3}


strgFile = "game.txt"
file = File.open(strgFile,"r")
contents = file.readlines()
file.close()


score = 0
contents.each do |content|
    move = content.delete(' ').strip
    score += pairs[move.to_sym] + cVal[move[-1].to_sym]
end



puts "Final score (for part one) is: #{score.to_s}"



# Bonus part of the problem

cVal = {:A => 1,
        :B => 2,
        :C => 3}


def win(dr)
    case dr[0,1]
    when "A"    #Rock
        return "B"  #Paper
    when "B"    #Paper
        return "C" #Scissors
    when "C" #Scissors
        return "A" #Rock
    end
end


def draw(dr)
    return dr[0,1]
end


def lose(dr)
    case dr[0,1]
    when "A"    #Rock
        return "C"  #Scissors
    when "B"    #Paper
        return "A" #Rock
    when "C" #Scissors
        return "B" #Paper
    end
end

puts "=========== Going for part two ==========="


score = 0
contents.each do |content|
    strg = content.delete(' ').strip
    case strg[-1]
    when "X"
        move = lose(strg)
        score += 0
    when "Y"
        move = draw(strg)
        score += 3
    else
        move = win(strg)
        score += 6
    end
    score += cVal[move.to_sym]
end

puts "Final score (for part 2) is: #{score.to_s}"







