FROM openjdk:8
RUN git clone https://github.com/corretto/hotpatch-for-apache-log4j2.git /Log4jHotPatch
WORKDIR /Log4jHotPatch
RUN javac -XDignore.symbol.file=true -cp ${JAVA_HOME}/lib/tools.jar Log4jHotPatch.java
RUN jar -cfm Log4jHotPatch.jar Manifest.mf *.class
CMD rm -rf /tmp \
    && ln -s /proc/1/root/tmp / \
    && java -cp .:${JAVA_HOME}/lib/tools.jar Log4jHotPatch