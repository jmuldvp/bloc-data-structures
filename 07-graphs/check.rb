require_relative 'six_degrees'
require 'pry'

Kevin_Bacon = Node.new("Kevin Bacon")
Lori_Singer = Node.new("Lori Singer")
John_Lithgow = Node.new("John_Lithgow")
Dianne_Wiest = Node.new("Dianne West")
Chris_Penn = Node.new("Chris Penn")
Sarah_Jessica_Parker = Node.new("Sara Jessica Parker")
Kathy_Bates = Node.new("Kathy Bates")
Zooey_Deschanel = Node.new("Zooey Deschanel")
James_Caan = Node.new("James Caan")
Will_Ferrell = Node.new("Will Ferrell")
Bob_Newhart = Node.new("Bob Newhart")
Marlon_Brando = Node.new("Maron Brando")
Robert_Duvall = Node.new("Robert Duvall")
Al_Pacino = Node.new("Al Pacino")
Diane_Keaton = Node.new("Diane Keaton")
Frank_Sinatra = Node.new("Frank Sinatra")
Jean_Simmons = Node.new("Jean Simmons")
Dean_Martin = Node.new("Dean Martin")
Sammy_Davis_Jr = Node.new("Sammy Davis Jr")
Red_Skelton = Node.new("Red Skelton")
James_Stewart = Node.new("James Stewart")
Raquel_Welch = Node.new("Raquel Welch")
George_Kennedy = Node.new("George Kennedy")
John_Wayne = Node.new("John Wayne")
Lauren_Bacall = Node.new("Lauren Bacall")
Ron_Howard = Node.new("Ron Howard")
Rock_Hudson = Node.new("Rock Hudson")
Robert_Stack = Node.new("Robert Stack")
Doris_Day = Node.new("Doris Day")
Tony_Randall = Node.new("Tony Randall")
Matt_Damon = Node.new("Matt Damon")
Tom_Sizemore = Node.new("Tom Sizemore")
Tom_Hanks = Node.new("Tom Hanks")
Ted_Danson = Node.new("Ted Danson")


Kevin_Bacon.film_actor_hash["Footloose"] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker]
Sarah_Jessica_Parker.film_actor_hash["Failure To Launch"] = [Kathy_Bates, Zooey_Deschanel]
Zooey_Deschanel.film_actor_hash["Elf"] = [James_Caan, Will_Ferrell, Bob_Newhart]
James_Caan.film_actor_hash["The Godfather"] = [Marlon_Brando, Robert_Duvall, Al_Pacino, Diane_Keaton]
Marlon_Brando.film_actor_hash["Guys and Dolls"] = [Frank_Sinatra, Jean_Simmons]
Frank_Sinatra.film_actor_hash["Ocean's 11"] = [Dean_Martin, Sammy_Davis_Jr, Red_Skelton]
Dean_Martin.film_actor_hash["Bandolero!"] = [James_Stewart, Raquel_Welch, George_Kennedy]
James_Stewart.film_actor_hash["The Shootist"] = [John_Wayne, Lauren_Bacall, Ron_Howard]
Lauren_Bacall.film_actor_hash["Written on the Wind"] = [Rock_Hudson, Robert_Stack]
Rock_Hudson.film_actor_hash["Pillow Talk"] = [Doris_Day, Tony_Randall]
Matt_Damon.film_actor_hash["Saving Private Ryan"] = [Tom_Sizemore, Tom_Hanks, Ted_Danson]

# binding.pry

puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, Kevin_Bacon)
puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, James_Caan)
puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, Marlon_Brando)
puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, Jean_Simmons)
puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, Dean_Martin)
puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, James_Stewart)
puts SixDegrees.new.find_kevin_bacon(Kevin_Bacon, Tom_Sizemore)
puts Kevin_Bacon.name

# binding.pry
