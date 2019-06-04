Understanding `WALinuxAgent`
============================

Linux machines on Azure can make use of a Azure 'agent'
running inside the virtual machine, which provides useful functionality:

Provisioning
-
* Creation of a user account
* Configuring SSH public keys and key pairs
* Settings the host name

Diagnostics
-
* Console redirection to the serial port

Kernel
-
* Consume Hyper-V entropy for `/dev/random`

A full list of functionality is available here: https://github.com/Azure/WALinuxAgent.

Check that the agent is running;
-
Verify that the `WALinuxAgent` is running;

~~~~
ssh azureuser@publicip

$ sudo systemctl status waagent
● waagent.service - Azure Linux Agent
   Loaded: loaded (/usr/lib/systemd/system/waagent.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2019-06-04 08:53:46 UTC; 40min ago
 Main PID: 4671 (python)
   CGroup: /system.slice/waagent.service
           ├─4671 /usr/bin/python -u /usr/sbin/waagent -daemon
           └─4930 python -u bin/WALinuxAgent-2.2.40-py2.7.egg -run-exthandlers
~~~~

Whatever you do, you do not want to disable this service. Doing so would disable Azure's ability to access the VM, including *shutdown* functionality.

Notes 
=====
The `WALinuxAgent` is an open source project [available on
GitHub](https://github.com/Azure/WALinuxAgent).

What's next?
===

Once this lab is completed, go back to [the agenda](README.md).
