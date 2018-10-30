>Written Assignment
>- Describe three collision resolution strategies not mentioned here.

1. *Robin Hood Hashing* - A new key may displace or move a key in a given position depending on if it is bigger or not. This reduces worst case search times.

2. *2-Choice Hashing* - This uses 2 different hash functions and it places the new object in the table with the most room.

3. *Coalesced Hashing* - This is like separate chaining and open addressing. Instead of creating a linked list in a bucket, it uses the buckets in the table as storage for the linked list.


>- Create your own collision resolution strategy and describe how it works.

I like the ideas from all strategies I've read about but what sticks out in my mind most isn't that far off from idea's already documented and this probably has already been thought about.  The idea I have would mix *2-Choice* and *Coalesced* hashing together where basically the logic of the 2 are combined. Start out with 2 functions and 2 tables and the one that is has the most amount of buckets available get's used where buckets are used as part of linked lists instead of a one bucket containing multiple linked lists.
