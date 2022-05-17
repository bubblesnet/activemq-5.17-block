# activemq-5.17-block
A balena block that allows dropping activemq into a balena project

This instance runs in its own container so it's run in console mode from the command line rather than as a service.  Thus, the start/stop/restart functionality of a service is not available.  Future versions maybe.

Configuration files:
* activemq.xml - activemq_prod.xml is copied into activemq.xml on container restart. This allows users of the project to simply twiddle values there (e.g. port) and trust the project to put it in the right place.
* jetty_prod.xml - jetty_prod.xml is copied into jetty.xml on container restart. This allows users of the project to simply twiddle values there (e.g. port) and trust the project to put it in the right place.

Versions:
* Debian Buster
* OpenJDK 11
* activemq-5.17

Ports exposed internally:
* ActiveMQ: 61613
* Admin Console: 8161

Ports exposed externally:
* none

ENV variables required:
* none
