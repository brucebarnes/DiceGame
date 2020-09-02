#instantiated the strings to be called up for various ASCII dice
dieTop =                "+-------+"
dieSide =                "|       |"
dieSideTwo =          "|*     *|"
dieSideOneRight =     "|      *|"
dieSideOneMid =      "|   *   |"
dieSideOneLeft =      "|*      |"
r = "Y"
#Money that player starts with
money = 5000
#Procedure that shows the High Scores from a text File
def highScore(score)
  a = 0
b =0

puts "Please enter Name:"
@name = gets.chomp

#initializes array of file contents
arr = IO.readlines("myfile.txt")
scores = Array.new(10)
names = Array.new(10)

#Splits File into Two arrays, one of scores, the other of Names
for i  in 0..20
  if i%2 == 1 then
    scores[a] = arr[i]
    a = a +1
  else
    names[b] = arr[i]
    b = b +1
  end
end

   #Sorting Algorithm of bothing Arrays at same time
   for i in 0..9
     for j in (i+1)..9
     if scores[i] < scores[j] then
       num = scores[i]
       name = names[i]
       scores[i] = scores[j]
       names[i] = names[j]
       scores[j] = num
       names[j] = name
     end
   end
 end
 
#Checks score of player to insert into array
if score > scores[9].to_i then
  scores[9] = score
  names[9] = @name
end

#Sorts one more time, just in case
   for i in 0..9
     for j in (i+1)..9
     if scores[i].to_i < scores[j].to_i then
       num = scores[i]
       name = names[i]
       scores[i] = scores[j]
       names[i] = names[j]
       scores[j] = num
       names[j] = name
     end
   end
 end
       
       
#Places array into file, replacing old data
f2 = File.new("myfile.txt", "r+")
for i in 0..9
  f2.puts names[i]
  f2.puts scores[i]
end
#Shows Current High Scores
f2.close
arr = IO.readlines("myfile.txt")

puts "*****Current High Scores*****"
k = 0
for i in 0..9
 
 print i+1
 print ")"
 print arr[k]
 print "     "
k=k+1
print arr[k]
k=k+1
end

end



#Procedure that shows the introduction and rules
def opening(money)
puts "Welcome to Super Dice Central!"
puts "Your task is to win as much as possible."
puts "Each round you can bet as much as you want below your total amount, "
puts "and if you get a 7 or 11 you double your bet!!!"

puts " "

print "Your current bank total is: "
print money
puts " "
end

opening(money)
while r == "Y" do
bet = 1000000000 #used because it needs to enter the loop below in order to handle an exception
 while bet > money do
puts "Please enter the amount you wish to bet:"
bet = gets.chomp.to_i
end
a = rand(6) +1
b = rand(6) + 1
diceTotal = a + b
#Loops Twice, one for each die and displays that die value
for i in 1..2
if i == 1 then
  x = a
else
    x = b
end
  
if x == 1 then
puts dieTop
puts dieSide
puts dieSideOneMid
puts dieSide
puts dieTop
end
if x== 2 then
puts dieTop
puts dieSideOneRight
puts dieSide
puts dieSideOneLeft
puts dieTop
end
if x == 3 then
puts dieTop
puts dieSideOneRight
puts dieSideOneMid
puts dieSideOneLeft
puts dieTop
end
if x == 4 then
puts dieTop
puts dieSideTwo
puts dieSide
puts dieSideTwo
puts dieTop
end
if x== 5 then
puts dieTop
puts dieSideTwo
puts dieSideOneMid
puts dieSideTwo
puts dieTop
end
if x == 6 then
puts dieTop
puts dieSideTwo
puts dieSideTwo
puts dieSideTwo
puts dieTop
end
end


#Betting If Statement. Also calculates winnings or losings
if diceTotal == 7 or diceTotal == 11 then
  money = money + (4 * bet)
  print "You Won!!!! You got a "
  print diceTotal
  print "."
  puts " "
  else
    money = money - bet
    print "I'm sorry, you Lost."
  end

puts " "
print "Your current bank total is: "
print money
puts " "
puts "Would you like to continue? (Y or N)"
r = gets.chomp
puts " "
end
if r != "Y" or r != "y" then
  highScore(money)
end

