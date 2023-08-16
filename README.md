# project_home_sensor

the project consists in creating a network of home sensors all connected to a server that use all data to ml predictions.

for the moment the only program available is server.erl. 

command :
server:start() #to start the server 
server:store("sensore gas", 10). #to store data sensor to the server 
server:lookup("sensore gas"). #to see if the data is correctly installed 

