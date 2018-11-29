# Individual-Project-Task
Getting information from gitHub API to display on a site using Haskell:

Tutorial: https://github.com/jgaa/restc-cpp/blob/master/README.md

Haskell Turtorial consulted: https://github.com/phadej/github


This project was intially done in C++, but due to complications with the libraries, Haskell was attempted before swtiching back to C++. There has been errors in compiling the restc-cpp and boost libraries, as well as with configuring the restc-cpp.cmake files, delaying the visualizaiton process. All lab hours in the month of November were attended and an effort to resolve this connection issues were made. It was hard to proceed further past this point to take information from the Github API because I was unable to test the code and see what manipulations I could make to gather the data I wanted. 


The main goal of the visualization was to create a bar graph that showed the commits of a each repository a user has. To test this, I used my own gitHub repository lists and commits. The first attempt of this was done using data that was written in the code, because of the issue pulling information from the rest interface. The index.html and RepoBarGraph.js files have the code for the visualization. The visualization should show a bar graph, with one bar per repository, labeled with the number of commits per graph (A picture of the visualization is also in the repository)


For the visualization, the index.html and RepoBarGraph.js files were used. They were referenced from a youtube video, which showed how to use the d3.js library. On 29 November 2018, more code was added to the RepoBarGraph.js file in attempt to add a cursor scroll to the program, which would provide the name of the repository when the cursor was over the corresponding bar.

(Code for the visualization was tested on the Scrimba online programming platform)
