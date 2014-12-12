deis-spring-boot
================

Template to deploy a Spring Boot application (jar) in deis

**This template allows:**
- Use a spring boot far file
- Change the default JVM settings
- Use a [Procfile](https://devcenter.heroku.com/articles/procfile)

**Steps:**
- Download the [template](https://github.com/aledbf/deis-spring-java/archive/master.zip)
- Edit launch.sh and replace the content of JAR_FILE variable with the name of the jar file
- Place the jar file in the directory
- Create a new deis app following the [guide](http://docs.deis.io/en/latest/using_deis/deploy-application/)
- Initialize git `git init && git add * && git commit -m "<>"`
- Execute `git push deis master`
