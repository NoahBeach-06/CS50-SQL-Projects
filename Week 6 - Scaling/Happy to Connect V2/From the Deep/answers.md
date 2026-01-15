# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random partitioning would mean that more data could be brought to the boats at once, and neither of the three boats would become a hotspot. However, this also means the data cannot be organized in a meaningful way, because there would be no organization, and any information you wanted could be on any of the three boats.

## Partitioning by Hour

Partitioning by hour would mean that, while the load would be distributed, and data would be organized in a more meaningful way, hotspots would be created, and some boats would be used a lot more than others. Because the scanner is more active during certain hours of day, there would be a systematic difference between the data being sent to the boats during more active hours, as opposed to ones operating during relative downtime.

## Partitioning by Hash Value

Partitioning by hash value would mean that, as with random partitioning, no hotspots would be created, and it would effectively distribute the load across all three boats. However, it would also mean that, while individual lookups would be easy, to select a range of values across a range of times, one would have to scan all three boats. 
