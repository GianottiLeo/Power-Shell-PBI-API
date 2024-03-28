# Power-Shell-PBI-API

One day, I received a requirement from my leader to create a visualization that would show all the information (name, owner, lineage data, update, refreshs and so on) regarding everything published in our PowerBi Service, basically, all our reports, datasets, dataflows and metrics. Of course, it's possible to acomplish that by manually checking each file, but my idea was to create a code that would periodicly scan our workspaces and generate a csv file with all the requests. But before this project, I did not have any prior knowleadge of Rest APIs. So after doing some searching and talking with my colleagues, I came to the conclusion that this was the best way to approach the request. The code attached is a simplified version of the one we still use to scan our workspaces. The process to develop it was quite challenging, because even though Microsoft Rest APIs are well documented for reports and datasets, metrics had just been created at the point I worked on this, so finding the correct calls was not a simple job. Working thought this project I developed a lot of new skills, my powershell programming abilities grew a lot and discovering Rest APIs opened my eyes for a lot of new possibilities in data extration

##

The final result of the script created was multiple cvs files, being generated in our server, compiled and uploaded as a dataflow into our workspace. This dataflow is consumed by a PowerBi report to facilitate the visualization of the data, allowing the user to apply multiple filters to the report or download the database in excel to analyse the extration in any way necessary

##

Now, as I said, goals had just been created by the time I worked on this project, so I leave here some images to illustrate what we can do in goals and what type of parameters my script extrat from the tool

<p align="center">
<img width="12" />
<img src="https://github.com/GianottiLeo/Power-Shell-PBI-API/assets/164948682/6c2d7490-d5da-40e7-a4fc-1dc56038c699" height="300" alt="powerbi logo" width ="530"  />

So this is a Goals mockup I've created. We can see that the tool presents the user some cards and each of them is customizable. When creating a Goals, we can connect in each of these cards a PBI Report element, for example a card in a Report, a point in a graph, a cell from a table, etc. This way, the selected element value will always appear in the card and be updated over time. It's also possible to add targets, comments, status, due dates and owners for these cards (in my script, all these parameters are extracted). So this way, Goals is a great way to summarize Power Bi values and easily allowing the user to analyse just what they actually need to see on multiple Reports at once. This is a great tool for scrum meetings, for example 

##

For reference, these are the parameters extracted when I use the rest APIs in our datasets and dataflows

<p align="center">
<img width="12" />
<img src="https://github.com/GianottiLeo/Power-Shell-PBI-API/assets/164948682/8e331fab-b11c-4f76-8b04-abf5bde37397" height="260" alt="powerbi logo" width ="180"  />
