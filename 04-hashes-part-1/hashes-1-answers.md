>2. Explain why doubling the size of the underlying array of your HashClass may be a poor idea.

The first thing that comes to mind is memory. The bigger the hash has to grow the more memory it takes but on the other hand, the more times a hash needs to expand, the more processing power that would take.

If doubling the size of the hash each time a collision occurs, the hash could get pretty big pretty quick.
