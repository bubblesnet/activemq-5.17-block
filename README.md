# activemq-5.17-block
A balena block that allows dropping activemq into a balena project

This instance runs in its own container so it's run in console mode from the command line rather than as a service.  Thus, the start/stop/restart functionality of a service is not available.  Future versions maybe.

Configuration files:
The block copies all the files from a shared/persistent directory named /activemq_conf to the activemq configuration directory.
If you want to override any of the activemq defaults, put the entire configuration file in the shared directory.  To automate this,
have your own container copy the configuration file to the shared directory and have activemq DEPEND on that 
container in the dockercompose.yml file.  For example:

```services:
  mycontainer: # copies config files to /activemq_conf
    volumes:
      - 'resin-data:/activemq_conf'

  activemq:
    image: bh.cr/g_john_rodley1/activemq-5_17-block:aarch64
    volumes:
      - 'resin-data:/activemq_conf'
    depends-on:
      - mycontainer  # don't start activemq until mycontainer has copied the right files into activemq_conf
```

The files you might want to modify ..
* activemq.xml - Port number and IP and logging
* jetty_prod.xml - Port number and IP for admin console

Versions:
* Debian Buster
* OpenJDK 11
* activemq-5.17

I open three ports so I can put activemq on any of 3 ports for dev, test and production.  ActiveMQ will use only one of them.

Ports exposed internally:
* ActiveMQ: 61613,61612,61611
* Admin Console: 8161

Ports exposed externally:
* none

ENV variables required:
* none
