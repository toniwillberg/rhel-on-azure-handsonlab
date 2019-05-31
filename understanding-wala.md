Understanding `WALinuxAgent`
============================

Red Hat Enterprise Linux machines on azure can make use of a Azure 'agent'
running inside the virtual machine, which provides useful functionality. A
short list is; 

Provisioning; 
* Creation of a user account
* Configuring SSH public keys and key pairs
* Settings the host name

Diagnostics;
* Console redirection to the serial port

Kernel;
* Consume Hyper-V entropy for `/dev/random`

A full list of [functionality is available here](https://github.com/Azure/WALinuxAgent). 

Check that the agent is running;
===============================

Verify that the `WALinuxAgent` is running;

~~~~
root@workstation: systemctl status waagent 
~~~~

Which should look something like this;

~~~~
 ● waagent.service - Azure Linux Agent
Loaded: loaded (/usr/lib/systemd/system/waagent.service; enabled; vendor pre>
Active: active (running) since Fri 2019-05-03 16:30:30 EDT; 3h 44min left
 ...
~~~~

You may need to press **Q** to quit the service status view.

#  Custom Script Extension
# FIXME

Notes 
=====
The `WALinuxAgent` is an open source project [available on
GitHub](https://github.com/Azure/WALinuxAgent).
