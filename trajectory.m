fprintf('start...\n');
fprintf('connecting to mongoDB...\n');
javaaddpath('C:\Users\Axel\Documents\MATLAB\JAR\mongo-java-driver-3.8.2.jar')
import com.mongodb.*;

mongoClient = MongoClient();
db = mongoClient.getDB( 'main' );
fprintf('find collections...\n');
colls = db.getCollectionNames().toArray();
disp(colls);

currColl = "_70101100019-1/15/15";
disp("currColl="+currColl);

coll = db.getCollection(currColl).findOne().toString().toCharArray;
fprintf('coll=\n');
disp(size(coll))

data = reshape(coll,[1,size(coll)]);

fprintf('json decode...\n');
json = jsondecode(data);
fprintf('json=\n');
disp(json);

fprintf('json ok\n');

fprintf('start parsing...\n');

animalArray = json.animals;

xmin = [];
ymin = [];
zmin = [];
xmax = [];
ymax = [];
zmax = [];
for i = 1:size(animalArray)
   tagDataArray = animalArray(i).tagData;
   for j = 1:size(tagDataArray)
        tag = tagDataArray(j);
        raw = tag.second_sensor_values_xyz;
        split = strsplit(raw,':');
        xmin = [xmin,str2double(split(1))];
        ymin = [ymin,str2double(split(3))];
        zmin = [zmin,str2double(split(5))];
        xmax = [xmax,str2double(split(2))];
        ymax = [ymax,str2double(split(4))];
        zmax = [zmax,str2double(split(6))];
   end
end
fprintf('finished parsing...\n');
fprintf('scatter3...\n');
scatter3(xmin,ymin,zmin,'filled')
%scatter3(xmax,ymax,zmax,'filled')