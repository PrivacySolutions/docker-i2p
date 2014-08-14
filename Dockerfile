FROM ubuntu
MAINTAINER Mikal "Meeh" Villa "mikal@privacysolutions.no"

# make sure the package repository is up to date
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 67ECE5605BCF1346
RUN echo "deb http://deb.i2p2.no/ trusty main" >> /etc/apt/sources.list.d/i2p.list
RUN apt-get update

RUN apt-get -y --force-yes install i2p
RUN sed -i s/RUN_DAEMON=\"false\"/RUN_DAEMON=\"true\"/ /etc/default/i2p
RUN /etc/init.d/i2p start
RUN echo "i2cp.tcp.bindAllInterfaces=true" >> /var/lib/i2p/i2p-config/router.config
# Allows docker to NAT the port
RUN sed -i s/::1,127.0.0.1/0.0.0.0/ /var/lib/i2p/i2p-config/clients.config

# Allow persistent config
VOLUME ["/var/lib/i2p/i2p-config"]

EXPOSE 7657
EXPOSE 4444
EXPOSE 4445
CMD /etc/init.d/i2p start && tail -f /var/log/i2p/wrapper.log
