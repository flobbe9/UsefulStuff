### Java 
- path of JAVA_HOME variable
    $> echo %JAVA_HOME%


### Docker
- build image (no capital letters)<br>
    $> docker build -t [name_of_image]:<version> .

- run container (no capital letters, -d is optional, -e only for postgres container)<br>
    $> docker run --name [name_of_container] -d -p 4001:4001 -e POSTGRES_PASSWORD=[password] [name_of_image]:[version]

- docker-compose<br>
    $> docker-compose up

- get ip adress of container<br>
    $> docker inspect [name_of_container] | grep IPAddress

- bash into docker<br>
    $> docker exec -it [containerId] /bin/bash

- rename docker target<br>
    $> docker tag [exampleProject]:[tag] [account]/[repo]:<tag>

- push docker image (first rename tag)<br>
    $> docker push [account]/[repo]:[tag]


### Jar
- create Jar with all files in folder (replace '.' with target files if you don't want all to be added)<br>
    $> jar cf [fileName].jar . 

- create Jar with specified path<br>
    $> jar cf [fileName].jar -C folderInWhichJarStarts/ .

- create Jar with mvn (classpath icluded automatically)<br>
    $> mvn package

- create Jar with gradle<br>
    $> gradle bootJar

- execute Jar file (works for war files as well, use exact same command but different file prefix)<br>
    $> java -jar [fileName].jar


### PostgreSQL
- access bash<br>
    $> psql -U username

- then connect to database<br>
    $> \connect [databaseName]


### MySQL
- access bash (with -p you will be asked to enter the password, with --password=[password] you wont)<br>
    $> mysql -h localhost -u [username] -p [mydatabase]

### Spring-boot
- run api (very first folder with src, pom.xml...) with maven<br>
    $> mvn spring-boot:run

- run tests (very first folder...) with maven<br>
    $> mvn test

- run api (very first folder with src, pom.xml...) with gradle<br>
    $> gradle bootRun

- run tests (very first folder...) with gradle<br>
    $> gradle test


### Node.js
- transpile typescript (remember to set "esModuleInterop": true in tsconfig.json for modules and name *.mts instead of *.ts)<br>
    $> tsc.cmd 
- or the almighty one:<br>
    $> ts-node-esm [fileName]
    

### React
- create react app<br>
    $> npx create-react-app [appName]

- start react app<br>
    $> cd [appName]
- then<br>
    $> npm start


### SSL
- create self signed certificate<br>
    $> keytool -genkeypair -alias [something] -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore [fileName].p12 -validity 3650


### Git
- generate ssh-key for git repo <br>
    $> ssh-keygen -t rsa -b 4096
- or just<br>
    $> ssh-keygen

- set username<br>
    $> git config --global user.name [username]

- set email<br>
    $> git config --global user.email [email]

- add ssh-key to agent (BitBucket), don't close bash in between<br>
    $> eval "$(ssh-agent -s)"
- then<br>
    $> ssh-add ~/.ssh/[ssh-keyName]
- then<br>
    $> git config core.sshCommand "ssh -i ~/.ssh/[ssh-keyName] -F /dev/null"


### ngrok
- make localhost port accessible from internet (e.g. localhost:8080: [portnumber]=8080)<br>
    $> ngrok http [portnumber]