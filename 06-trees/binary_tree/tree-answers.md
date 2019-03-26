>1. Print both Trees to the console and compare the difference between your Binary Search Tree and your Heap.

*Tree:*
"The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"

*Heap:*
"Band of Brothers: 72\nSaving Private Ryan: 78\nWhat About Bob?: 80\nRogue One: 85\nDr. Strange: 87\nMy Blue Heaven: 86\nSolo: 90\nMy Name Is Nobody: 91\nLive, Die, Repeat: 92\nFantastic Beasts: 93\nBourne Identity: 94\nOceans 11: 98\n"

I used 2 different movie lists. Regardless, the `heap` implementation organized all the moves by rating and the `tree` implementation did not. If the tree implementation isn't kept balanced, it could get out of hand.

>2. Insert all numbers from 1 to 100000 into both Trees, then use Benchmark to compare performance:

>-How much time does an average insertion consume in the Binary Search Tree compared to the Heap?

 |user|system|total|real
-|----|------|-----|----
tree insert | 0.620000 | 0.010000 | 0.630000 (  0.629835)
heap insert | 1788.880000 | 15.450000 | 1804.330000 (1811.766664)

>-How much time does finding 50000 in the Binary Search Tree consume compared to the Heap?

 |user|system|total|real
-|----|------|-----|----
tree find | 0.050000 | 0.000000 | 0.050000 (  0.050541)
heap find | 0.040000 | 0.000000 | 0.040000 (  0.041499)

>-How much time does the average deletion consume in a Binary Search Tree compared to the Heap?

 |user|system|total|real
-|----|------|-----|----
tree delete | 0.050000 | 0.000000 | 0.050000 (  0.050011)
heap delete | 0.040000 | 0.000000 | 0.040000 (  0.041694)

>-When would you use a Binary Search Tree and why?

Seems like this would be the best implementation to use in an application where data is constantly being entered and leaving.  The only good binary tree though is one that is balanced.  This is a good illustration of how Morse code...

![Morse Code Binary tree](https://upload.wikimedia.org/wikipedia/commons/1/19/Morse-code-tree.svg)
![Morse Code chart](https://hrexach.files.wordpress.com/2015/07/morse.jpg)

...is an example of a binary tree.  Here

>-When would you use an Heap and why?

This would be the best implementation to use when needing to do a search.  It slightly out performs the binary tree method given that a min heap forces the concept of filling out a tree level by level and it stays more balanced than a binary tree. Useful for priority queues, schedulers
