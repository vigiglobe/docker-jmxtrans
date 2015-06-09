FROM java:java:8u45-jdk

MAINTAINER fvigotti

RUN echo "debconf debconf/frontend select noninteractive" | debconf-set-selections &&
    wget http://central.maven.org/maven2/org/jmxtrans/jmxtrans/250/jmxtrans-250.deb &&
    dpkg -i jmxtrans-250.deb


ADD run-jmxtrans.sh /usr/bin/run-jmxtrans.sh
RUN chmod +x /usr/bin/run-jmxtrans.sh

# default json confs dir
VOLUME ["/var/lib/jmxtrans"]

# default logs dir
VOLUME ["/var/log/jmxtrans"]

CMD /usr/bin/run-jmxtrans.sh

