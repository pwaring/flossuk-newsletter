# Spring Conference 2016

## Quentin Wright

Everyone's conference is different. With multiple streams going on and time taken out to re-make old acquaintances or chat at one or other of the stands one can at best present a partial view of the goings-on. The venue was a great success and worked very well not just for the talks but for the dinner as well. Here follows a brief summary of all the talks that I attended. Some are proper write-ups, others are in the form of key-points. Enough I hope to give a flavour of the conference.

### Mandi Walls - Keynote

Mandi described the changes that have taken place in systems particularly in the role of operations in larger organisations. Cheap and powerful machines on the desktop had debased the operator's role. Now with the emergence of the cloud and sophisticated deployment tools we have the new field of "devops" which is quite different in its importance to large organisations. Our work isn't confined to responding to the the "Call Tech Support - my mouse is dead" events.

Mandi had entertaining cat and mouse graphics to illustrate her points!

Other changes have occurred outside organisations. The resources to support the use of opensource have blossomed, so for example the latest OScon has about 20 parallel streams.

There are more radical changes coming in the future, particularly with the Internet of Things. Now the idea that the smart toaster can talk to the weather forecast and display information or adjust its settings is becoming reality.

An aversion to risk and blame culture exists in large organisations and it's hard to change them. It's a bit like stopping the Titanic. This factor accompanied by the ever decrease in job security has meant that devops favours the young and childless.

These changes can be daunting but you can change yourself. You have to accept that continuous learning is required.

To succeed at learning, you should cultivate aspiration and curiosity, acknowledge your vulnerabilities and become self aware.

### Getting the Maximum out of systemd - Julien Pivetto

Julien has been using systemd since 2010. One of the advantages of systemd is that it starts more processes in parallel and makes better decisions during the process.  It uses inotify, cgroups and other linux features and is in most distributions.

There are alternatives to systemd: System V, Upstart in Ubuntu and OpenRC - which is mainly found in Gentoo.

Everything in systemd is a "unit". These are the base bricks of systemd.
Some examples are:
network.target
mariadb.service
home.mount
session-1.scope

Units can be configured through ini-style text files
List: systemctl list-units --all
Read: systemctl cat

Units can be found in
/etc/systemd/system/*
/run/systemd/system/*
/usr/lib/systemd/system/*

Packaged files go in /usr/lib

Units can be over-ridden. You can add, remove or change parameters and adapt them to your needs. It was hard to change services before systemd. You can use partial override, so just have commands in a file.

When implementing an over-ride use:
systemctl deamon-reload

and then verify that the unit has been loaded:
systemctl cat <service_name>

To control units use start, status, stop, kill, help, enable and disable.

Has a feature called "masking"
	rather than disabling it will prevent units being launched by hand or systemd

= Systemd Services =
uses cgroup to track processes
see the [Service] section in units

The service is defined by the commands to run that service
Have a "simple" type
a "forking" type
a "oneshot" type - it is a reliable way to run commands as it will be run in a cgroup and is unrelated to the current shell
	has interesting options RemainAfterExit, SuccessExitStatus

Other properties:
	Execstart=, ExecStop=
	ExecStartPre= ExecStartPost=
	ExecReload=
	TimeoutStart....

Execs
		Not only for services
		User= Group= Nice= OOMScoreAdjust=, LimitNOFILE/
		Environment= EnvironmentFile=

Isolation/Security

Dependencies

Problems solved by systemd
	Run service as a different user
	Java service wrapper
	Go service wrapper
	You can still use custom scripts

Can use systemd to manage temporary files, to manage mount points and manage journals.

Can replace cron jobs using the concept of timers.

Can use systemd for socket activation.

All-in-all Julien gave an excellent overview of systemd, something that's hard to find. Other references that I've come across in endeavouring to get to grips with it are:
Overview of systemd for RHEL 7 - Red Hat Customer Portal
https://access.redhat.com/articles/754933
Understanding and Using Systemd | Linux.com
http://www.linux.com/learn/tutorials/788613-understanding-and-using-systemd/


### Configuration Management with Ansible and Git (Paul Waring)

In the "Olden Days" we used to edit files on each server that we were maintaining. This was a manual task and boring, repetitive and error prone. Nowadays we write a playbook or manifest and let the software do the rest.

Ansible needs Python 2 and ssh and runs on many OS's and scales up and down.

Paul ran through the basics of ansible:

 * Configuration contains global options, that's to say options that apply to all nodes. The file has a format similar to that of a Windows ini file.
 * There is an inventory file. This lists individial managed nodes and allows global options to be overridden. Similar nodes can be grouped.
 * The are ansible modules. These are an abstraction of functionality, and as an example can be used to create accounts. Paul described the different typesof modules. There are core modules, extras and third party modules.

Playbooks are list of tasks to run on nodes. They are Ansible’s configuration, deployment, and orchestration language. They can describe a policy you want your remote systems to enforce, or a set of steps in a general IT process. If Ansible modules are the tools in your workshop, playbooks are your design plans.

Paul explained the differences between Imperative vs declarative code and the virtues of using list comprehensions rather than loops. For more information the use of playbooks see the project documentation:
http://docs.ansible.com/ansible/playbooks.html

Ansible can be used very effectively with git hooks. A hook script can be used to check playbook script syntax before running the script. If the syntax checking fails a nonzero exit status can be set and git doesn't proceed.

Monitoring - ????
Monitoring is usually an afterthought

Often it used to be that monitoring is when the customer calls with a problem!!

There was definitely a need to automate monitoring and in 2011 something better was needed.
There was famous debate in #monitoringsucks
	manual config with gui
	not in sync with reality
	hosts only
	services sometimes
	application never
	..

This was followed by #monitoringlove
	a new era of tooling
	had hacksessions

wanted :
	small components
	collect
	transport/mangle
	store
	analyse
	act/alert
	visualize

Sensu came along..  
It was awesome for non-static environments
!! But this is Europe, U no do cloud..

Talked about monitoring a service vs Monitoring a *service*

Slide showing use of Graphite to monitor these metrics..
get Graphite++
	API
	Dashboards:
		Grafana
		Gdash
	Engines:
		InfluxDB
		Cyanite

There is a whole ecosystem around Graphite

Graph-Explorer
	Vimeo produced graph-explorer
	seems to be dead

...but now we have Grafana
 which has a better display
 the ability to quickly make dashboards

3 years ago
Graphs to Knowledge:
	Skyline, Oculus .. but these were incomplete

Want to aggregate metrics
  and have Audience

Riemann
I still don't get it?
Distributed Top
Do you like Clojure?
Riemann Health plugin?
s/riemann-health/collectd/g
output to graphite

Now Prometheus
	Started 2012
	SoundCloud
	Metrics
	..

But I have log files
	Collect from anywhere
	Filter
	Send from anywhere
	logstash output
	keep patterns around
	selectively purge data

Start ups are all talking about:
Application Performance Monitoring
	eg Packetbeat

Checking for failure
	Icinga
	Sensu
	prometheus

Waking you up at night
	Flapjack
		notification routing
	Openduty
		never managed to work

Aggregating
	Thruk
	Grafana
	Dashing
		use to build dashboards

diagram with details of current stack

loves where monitoring is heading
we have fewer false positives these days

------------------------------------------------
nftables - Richard Melville
"The nascent Linux packet filtering framework"

The benefit of nftables is that it replaces and combines
{ip, ip6, arp eb}tables

Take a look at netfilter.org to see the differences..

nftables looks very different from its predecessor.
It has a different syntax and has done away with predefined tables and chains.
However there are now families:
	ip, arp, ip6, bridge, inet, netdev

If you link to the inet family this will do ip and ip6.

netdev allows packet inspection before prerouting.

Have base and non-base chains:
There are three types of base chain:
filter, route and nat

Hooks are:
prerouting, input, forward, output, postrouting.

Non-base chains are useful for arranging.

In one command multiple actions can be expressed.
Note that packet and bytes counters are turned off be default and have to be explicitly turned on.

Rules can be assigned handle numbers

* How is nftables better?
small code base
better syntax
simplified ipv4/ipv6 stack administration

See the source at git://git.netfilter.org

There are two new libraries: libmnl and libnftnl

* Getting started
$ nft
$ modprobe nftables
$ lsmod | grep nftables

$ modprobe nf_tables_ipv4
(also have arp inet netdev)
but should be in the kernel

New features
sets, dictionaries, intervals, maps, concatenations

# nft add table ip myfilter
# nft add table arp myfilter

# nft add chain ip myfilter input {type filter hook input priority 0 ;}

can have negative priorities

# nft add rule ip myfilter input tcp dport 80 drop

# nft list table ip myfilter

# nft -a list table ip filter
to see the handle of the rule

# nft delete rule ...

backing up rules:
# echo "nft flush ruleset" > backup.nft

restoring:
nft -f backup.nft

Further reading
watch out for updates
there's a wiki with a howto

Also see:
Why you will love nftables » To Linux and beyond !
https://home.regit.org/2014/01/why-you-will-love-nftables/

-----------------------------------------------------------------

Dave Cross - Writing Books - the Easy Stuff

We're more familiar with Dave as the giver of courses on all things Perl from introduction through to advanced and on to web. As a departure from this area he took time out to tell us about his experiences in self-publishing a book and getting it to market, or rather as he said "NOT publishing" his next book.

Dave identifed three stages in the process: Writing the book, publishing it and then doing the marketing.

One of the useful sources he found was "APE - How to Publish a Book" by Kawasaki and Webb. The first observation that Dave made is that publishing is the easy bit. Once you've produced your book in the right format the rest is easy.

Various sources say "Write a book in Word". So before you even contemplate this: No! No! No! Don't do it! As a geek you should use text formats. Then you have access to the full unix toolkit - grep, wc, revision control and the rest.

So having got that out of the way which text format should you use?
	Pod? He'd used it for the O'Reilly book..
	HTML? That's really a display format.
In the end he decided to use Markdown. Perhaps this is new to some, but is an excellent tool.

Having decided on the text format which output format should you use? There are three options that immediately come to mind:
	.mobi - format for Amazon eBooks
	.epub - most of the other places use it - it's an open standard
	.pdf
Well, yes maybe all of these! The Pandoc program will do the conversion from Markdown to ?????

Amazon has the Kindlegen tool which will do conversion to, obviously enough, Kindle format.

Calibre, although it has the worst UI in the Universe has excellent command line tools and will do the conversion from epub to pdf.

Other useful tools are ebook-convert and epub.css which changes the look and feel of an epub book from Amazon's standard layout.

Dave has documented the whole process on https://github.com/davorg/make-ebook.

So finally, does it work??
Dave took a look at some blogs and decided to sign up to KDP that's Kindle Direct Publishing and posted it on Amazon.

In addition Puppet have a document about the process and also see the Pandoc web site: http://pandoc.org/epub.html.

This was an excellent and interesting overview from Dave Cross of the process of preparing and publishing your own ebook. So now there can be no excuses. They say everyone has a book in them, so maybe now's the time to write it!!

---------------------------------------------------------------------------

Is Containerisation Management Still Relevant in a Containerised World?
Stephen Grier

Stephen is in the IS Division of UCL. Although his presentation was about Puppet everything is relevant to other CM Tools.

Mark Burgess wrote CFEngine in 1993.

Why CF? What does it give us.
- Automation of system configuration.
- Reproducibility
- Reliability
- Infrastructure as code
- Convergence towards a desired state. (Steve Burgess)

A good CF tool is declarative.
Puppet has a good sub-system of providers.
A good system should be idempotent

Containerisation - a brave new era
There has been steady progress with discrete stepts towards containerisation:
	chroot Unix v7 - 1979
	FreeBSD Jails - 2000
	Control groups - 2.6.24 - 2008 (Google - process containers)
	Linux namespaces - 2.6.24 - 2008
	LXC - 2008
	Docker - 2013
	Rocket - CoreOS - 2014

Docker adds tooling, so extends the capabilities of LXC.

We don't have a good specification around containerisation.

It's all about process isolation. Containers provide a new unit of deployment. You don't have to know about the libraries on the host and the application developers can use whatever language they want.

= Why Use Containers? =
- Process isolation
- Security
- Resource Limits
- Portable
- Self contained with all dependencies
- Very fast to deploy
- Unit of deployment
- Non repudiation - Docker 1.8

A new feature is image signing.

= Should you bake or should you fry? =
Docker images (or AMI or Vagrant boxes) are baked.
Typically we don't config manage a container.
Ideally you should have a single process running in a single container.

Images might be built using Jenkins..
You're interested in the final state of the image rather than using a script.

Docker has dockerfiles which allow you to define your image. Note that dockerfiles can be version controlled. This means that there is a repeatable way of building images.

= So CM tools are dead? =
We still need a way of managing the host. Well possibly not if the host is CoreOS or Red Hat's Atomic.

= Docker can be managed with Puppet =
The Puppet garethr-docker module is very good. It was written by Gareth Rushgrove. It can manage and install docker itself and can define containers. You can use docker::run to map ports etc..

You Can have hiera - sets of yaml files which define the containers.

With docker::compose applications can be defined as code and puppet apply will run the images from a dockerfile.

As well as version controlling a dockerfile, you can manage a manifest file.
Puppet will do the heavy lifting..

= Another neat tool =
Can pass environment variables to the virtual machine at run-time..

== Conclusion ==
Convergence is less important...
Declaring a defined state much more so.

------------------------------------------------------------------

Architecture Automation - Matt Trout
or as an alternative title:
"Alligators in the swamp - spending all your time fixing stuff!"

I felt like taking Matt to task because at the start of his talk he maintained that he had to use a Windows laptop because it was the only machine that would work first time with a projector! Oh well!

Matt described his accumulated experience as a consultant carrying out migration or consolidation activities in new organisations as they moved from theinitial start up to something more mature.

I took a few brief notes during Matt's talk. Apologies for the terseness, but for a talk of this nature bullet points are probably the most appropriate!

With early stage startups technical debt is everywhere! Priority has gone into making a product fit for the market rather than striving for elegance. Maybe the outfits that seek elegant solutions never make it anyway!

There are a number of steps in the process:

Step 0
	(Geeks always start at square zero instead of square one!)
	What servers do we have?
		Look for that key machine that has been forgotten!

Step 1
	You get bonus points if the guy who knew it all left - it's often the case!
	Don't trust the documentation
	what's installed?
		use dpkg
		other tools provided by the os
	what about custom code?
		seek it out, maybe destroy
	repositories
		locate .git
	is it the real thing?
		has development been done on the development machine?
		often development is done everywhere and production is for some unknown reason running on the development machine.
	use Dist::surveyor in Perl environment. It does checksums for files.
	what talks to what?

Step 2
	enumerate running services
		use daemontools
		ps aux every 5 minutes for 24 hours
		lsof
		netstat
	do cross-referencing
		put into a wiki format
			easy viewing
		dump the output into a git repo, maybe using JSON
		grep out things you recognise..

	grep everything for hard-code ip addresses
		there WILL be one somewhere

Step 3
	Go find a beer..
	"This is a swamp" rather than a technical debt

If possible use fresh machines..
	Your existing machines will be missing security fixes
Always assume the worst.

Firewalls aren't just for security. Use firewalls internally

Automation approaches
	pick something pull-based
	ansible is a choreography tool - avoid
	pull-based systems converge

	config generation
		if you already know TT just use TT
		don't try to be clever

DNS is a mess? Well dns is usually a mess..
	rsync /etc/hosts

Backup everything

Build new machines and restore backup data onto them
	(Now you've tested your backups)

Change something and check the slaves..

Think about migration strategies
	don't trust DNS timeouts
..
use rsync, change dns, rsync again

Step 4
Decide which service to tackle next.
Repeat

As ever Matt gave an entertaining and stimulating talk about how things really are at the coal-face rather than the way they should be.

------------------------------------------------------------
Open Source: A Job & An Adventure
by Dawn Foster

Dawn described herself as a "Geek, traveller and reader", with a
20 year tech career. She's currently a PhD student at the University of Greenwich researching communication amongst the Linux kernel developers. Previously she'd worked at Intel on a team looking at developer tools. She also spent time looking at the communities for these tools and discovered that there was lots of structure amongst the communities.

Why have a career in open source?
	- Meet amazing friends from around the world.
		Run across the same people on different project.
	- Travel
		Attend conferences and work with other companies
		Because it's open source it's possible to be open about the technical content
	- Visible work and connections to people

Working in open source is	awesome. You or free as in freedom, innovative, and the work is interesting and collaborative.

How do you get started in open source?
One way is to start a new project that you need. However this is probably one of the hardest ways to get into open source. It's maybe one of the most demanding, but then is perhaps the most rewarding.

Another way is to participate. This way you learn new skills, and become known within the project. This pathway does not just apply to developers. There are other ways to get involved for example by making blog posts  or getting involved in documentation.

Dawn had slides with a great set of points:

How: Join a company.
		 Red Hat, Intel ...

How: Bring OSS in

How: Get out there..
		 Write and speak about your work in open source

How: Consulting
		 Companies need help with implementation and open source contribution

How: Documentation
		 One of the most frequently suggested way to get into the project

There were a lot of mentions of examples of the way different now well-known individuals got started working in open source

How: Be Nice
		 Be nice and work well with others to improve your chances of getting work.

How: Network
		 Meet people and keep in touch
		 Every single job that Dawn has had apart from one has come from networking
		 You have to do networking all the time.
		 Don't think of it as being networking - think of it as talking to otherpeople who are interesting.

Time: Prioritize
			Everything seems urgent, but most things will wait.
			Try very hard to prioritize and be brutal on the things that are most important.
			Try to delegate. Wait to respond to requests so that someone else gets to contribute - this creates space for others to participate.

Time:	Document
			Document processes and write answers to common questions.
			Have lots of canned responses, email templates for common tasks

Time: OFF
			Take time off for hobbies or even a vacation.
			Disengage from work, engage with cool technology,
			get to a few meetups.

Finally: "Boldly Go"!!

Dawn's blog is at fastwonderblog.com and she can be contacted as dawn@fastwonder.com
