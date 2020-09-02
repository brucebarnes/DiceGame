
score = rand(25) * 1000
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
puts "  "
end



