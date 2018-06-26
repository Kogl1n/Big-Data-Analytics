# Minimizing kNN-POI API map requests

## Task: 
We have an app that utilizes a map API to aquire the coordinates
of the k-nearest (kNN) points of interest (POI), e.g. restaurants, around app users' current positions.
Requests to that API are expensive.
Since we expect to request POIs we already (partially) received for different users, we think about
a way to buffer the POIs and decide if an API request should be issued.

## Abstraction:
The k-th POI around a user describes a circle with the user as the center of it.
For another user we know that there exists a circle with the maximum radius that corresponds to the k-th known
POI around him or her.
If this circle is already covered by other circles with buffered POIs then we don't need to issue an API request.

##Solution:
We construct the union of buffered (appropriate) circles and check whether the union of that area with the circle in question
is actually bigger.
1987/88 Franz Auerkammer used generalized Voronoi diagrams, so called Power diagrams, for constructing the union in O(n log(n)) time with n the number of circles. He even showed that computing the actual area coverered is also an O(n log(n)) job.
In addition we even can save the circles within a tree-map using the Power diagram which is very cheap for getting the k-nearest POIs.

## Implementation:
Matlab: https://de.mathworks.com/matlabcentral/fileexchange/44385-power-diagrams
https://github.com/DanSanche/Power-Crust-MATLAB/tree/master/power%20diagrams

Java: https://github.com/ArlindNocaj/power-voronoi-diagram
