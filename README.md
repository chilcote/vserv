vserv
-----
Service to monitor one or more vmx path[s] and restart the vmx[s] if necessary.

The idea here is to automate the spinning up or tearing down of VMware Fusion VMs. Support has been added to the [vfuse](https://github.com/chilcote/vfuse) script, allowing one to automate tests or perhaps, with some ingenuity, deploy VMs as a service.

This script was inspired by conversations wtih [Gilbert Wilson](https://twitter.com/boyonwheels) at our nascent Seattle [MacHackNight meetup](https://groups.google.com/forum/#!searchin/macenterprise/ctdawe$20red$20door/macenterprise/T2L2j8SnNWc/eUcghNez5sMJ), and is built upon the superior ideas illustrated [here](https://github.com/boyonwheels/vmrun.wrapper).

Requirements
------------

+ VMware Fusion 7.x Professional
+ OS X 10.10.2+
+ python 2.7.x

Usage
-----

    usage: vserv.py [-h] [--list] [--monitor] [--add ADD] [--remove REMOVE]
                    [--reset RESET] [--get-ip GET_IP]

    optional arguments:
      -h, --help       show this help message and exit
      --list           List monitored and running VMs
      --monitor        Service to monitor VMs
      --add ADD        Add monitoring for /path/to/vmx
      --remove REMOVE  Remove monitoring for /path/to/vmx
      --reset RESET    Reset /path/to/vmx
      --get-ip GET_IP  Get IP for /path/to/vmx

Monitoring VMs
--------------

To manually run the service, use the `--monitor` argument.

    ./vserv.py --monitor

Alternatively, you can copy the script to /usr/local/bin/ and the launchagent to /Library/LaunchAgents/ and initiate the service with:

    launchctl load /Library/LaunchAgents/com.github.vserv.monitor.plist

Logging uses syslog, so you can watch progress with:

    tail -f /var/log/syslog |grep vserv


Adding/Removing VMs
-------------------

To monitor a vmx file, use the `--add` argument.

    ./vserv.py --add /path/to/vmx

To stop monitoring a vmx file, use the `--remove` argument.

    ./vserv.py --remove /path/to/vmx

To reset a vm, use the `--reset` argument.

    ./vserv.py --reset /path/to/vmx

To list all monitored and running VMs, use the `--list` argument.

    ./vserv.py --list


License
-------

    Copyright 2015 Joseph Chilcote
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
