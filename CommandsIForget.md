### Java 
- path of JAVA_HOME variable
    > echo %JAVA_HOME%


### Docker
- build image (no capital letters)
    > docker build -t [name_of_image]:<version> .

- run container (no capital letters, -d is optional, -e only for postgres container)
    > docker run --name [name_of_container] -d -p 4001:4001 -e POSTGRES_PASSWORD=[password] [name_of_image]:[version]

- docker-compose
    > docker-compose up

- get ip adress of container
    > docker inspect [name_of_container] | grep IPAddress

- bash into docker
    > docker exec -it [containerId] /bin/bash

- rename docker target
    > docker tag [exampleProject]:[tag] [account]/[repo]:<tag>

- push docker image (first rename tag)
    > docker push [account]/[repo]:[tag]


### Jar
- create Jar with all files in folder (replace '.' with target files if you don't want all to be added)
    > jar cf [fileName].jar . 

- create Jar with specified path
    > jar cf [fileName].jar -C folderInWhichJarStarts/ .

- create Jar with mvn (classpath icluded automatically)
    > mvn package

- create Jar with gradle
    > gradle bootJar

- execute Jar file (works for .war files as well, use exact same command but different file prefix)
    > java -jar [fileName].jar

- extract Jar/War file
    > jar -xvf [fileName].jar
    or
    > jar -xvf [fileName].war

### PostgreSQL
- access bash
    > psql -U username

- then connect to database
    > \connect [databaseName]


### MySQL
- access bash (with -p you will be asked to enter the password, with --password=[password] you wont)
    > mysql -h localhost -u [username] -p [mydatabase]

### Spring-boot
- run api (very first folder with src, pom.xml...) with maven
    > mvn spring-boot:run

- run tests (very first folder...) with maven
    > mvn test

- run api (very first folder with src, pom.xml...) with gradle
    > gradle bootRun

- run tests (very first folder...) with gradle
    > gradle test


###
- create emtpy maven project
    > mvn archetype:generate


### Node.js
- transpile typescript (remember to set "esModuleInterop": true in tsconfig.json for modules and name *.mts instead of *.ts)
    > tsc.cmd 
    - or the almighty one:
    > ts-node-esm [fileName]
    

### React
- create react app
    > npx create-react-app [appName]

- start react app
    > cd [appName]<br> 
    > npm start


### SSL
- create self signed certificate
    > keytool -genkeypair -alias [something] -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore [fileName].p12 -validity 3650


### Git
- generate ssh-key for git repo
    > ssh-keygen -t rsa -b 4096
    - or just
    > ssh-keygen

- set username
    > git config user.name [username]

- set email
    > git config user.email [email]

- add ssh-key to agent (BitBucket), use gitBash, don't close bash in between
    > eval `ssh-agent -s`<br>
    > ssh-add ~/.ssh/[ssh-keyName]<br>
    > git config core.sshCommand "ssh -i ~/.ssh/[ssh-keyName] -F /dev/null"


### ngrok
- make localhost port accessible from internet (e.g. localhost:8080: [portnumber]=8080)
    > ngrok http [portnumber]


### Other
- compare two files in VSCode (use relative paths starting with ./src/...)
    > code --diff [path1] [path2]