fprintf('start...\n');

fprintf('connecting to mongoDB...\n');


javaaddpath('C:\Users\%USER\Documents\MATLAB\JAR\mongo-java-driver-3.4.2.jar')
% import the library
import com.mongodb.*;

% To directly connect to a single MongoDB server (note that this will not auto-discover the primary even
% if it's a member of a replica set:
mongoClient = MongoClient();
% db object will be a connection to a MongoDB server for the specified database
db = mongoClient.getDB( 'mydb' );
% get the list of collections
colls = db.getCollectionNames();
% get a collection
coll = db.getCollection('testCollection');





conn = mongo("localhost",27017,"main");
isopen(conn);

x = [1; 2; 3];
y = [1; 2; 3];
z = [1; 2; 3];
scatter3(x,y,z,'filled')