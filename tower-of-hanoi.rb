# Hanoi tower version 3.0

puts
puts "### WELCOME TO TOWER OF HANOI ###"
puts
puts "Instructions:"
puts "The Towers of Hanoi is an ancient puzzle played with"
puts "three stacks and any number of differently-sized disks. At the start, all the disks are in the leftmost stack,"
puts "with the largest disk on the bottom and the smallest on the top. The object is to get all the disks over"
puts "to the rightmost stack."
puts "You can only move one disk per move, and you can only move the top disk on a stack."
puts "The top disk of any stack can be moved to the top disk of any other stack,"
puts "with the restriction that you can't move a larger disk on top of a smaller disk --"
puts "i.e., disks can only be moved to empty stacks or on top of larger disks."
puts

a = []
b = []
c = []
final_tower = []
towers = { a: a, b: b, c: c}


 # Check if the values inserted are correct
def right_answer?(letter)
    if letter == :a || letter == :b || letter == :c
      return true
    else
      return false
    end
end

puts "How many discs would you like to play?"
discs = gets.chomp.to_i
puts


 # Set up the numbers of discs you want to play!
while true
  if discs < 2
     puts "Please insert a number higher than one!"
     discs = gets.chomp.to_i
     puts
  else
      discs.times do |disc|
      a << disc + 1
      final_tower << disc + 1
      end
      break
  end
end


 # Calculate the mininum number of moves according with the number of discs
 # 2(discs) + 1
def minimum_moves(discs)
  2 * discs + 1
end


 # Where the game starts with its conditions and moves.
 your_moves = 0
 time_start = Time.now

while c != final_tower
  puts "Tower A = #{a}, Tower B = #{b}, Tower C = #{c}."
  puts "Your goal Tower C = #{final_tower}."
  puts

  puts "From which Tower would you like to move the disc?"
  origin_tower = (gets.chomp.downcase).to_sym
  puts "To which Tower?"
  to_tower = (gets.chomp.downcase).to_sym
  puts

  if right_answer?(origin_tower) && right_answer?(to_tower) && towers[origin_tower].first != nil
      if origin_tower == to_tower
         puts "It's the same as the origin."
         puts
      elsif towers[to_tower].first == nil || towers[to_tower].first > towers[origin_tower].first
         towers[to_tower].unshift(towers[origin_tower].shift)
         your_moves += 1
      elsif towers[to_tower].first < towers[origin_tower].first
         puts "You can't move bigger disc on top of a smaller one."
         puts
      end
  else
    puts "Please type 'a' or 'b' or 'c'; or choose a tower that contains a disc!"
    puts
  end

end

end_time = Time.now
difference = end_time - time_start

 # calculates time difference:
def time_calculation (difference)
 difference.to_i
   minutes = (difference / 60).to_i
   seconds = (difference % 60).round(2)
   puts "#{minutes} minute(s) and #{seconds} seconds"
end

puts "### CONGRATULATIONS!!! YOU FINISHED THE GAME!!!! ####"
puts
puts "The mininum number of moves for #{discs} discs are #{minimum_moves(discs)} moves."
puts "You made it in #{your_moves} moves in"
puts "#{time_calculation(difference)}"
