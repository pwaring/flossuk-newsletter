# Spring 2016 review

## Kenneth MacDonald

Mandy Walls (Chef) opened the conference with a stirring keynote to
reaffirm our enthusiasm of the sysadmin/DevOps field of endeavour.
She suggested many of us are driven by curiosity and we should rely
on that when "work stuff" doesn't appear cool - ask ourselves
questions about it and it can suddenly become cool.  As community
members progress through life, we hope their coporate employers
shoulder the risks of continuous learning as individuals' time is
filled with family demands.

I chaired the Lethaby room track over the two days and am grateful to
the speakers who all kept to time and to the attendees who engaged in
the question and answer sessions at the end of each talk.  The chair
should always have a good question ready as a standby and fortunately
none of mine were required.

Julien Pivotto (Inuits) supplied numerous hints and tips for getting
the most out of systemd, many of which I was unaware of: "patching"
vendor supplied units via additional configuration files, isolation
features, making journald's log persistent and the "systemd-run"
command.

Petr Jelinek (2ndQuadrant) reviewed the history of replication in
PostgreSQL and introduced the new, powerful and extensible logical
replication features currently under development.

Craig Gallen (OpenNMS developer) highlighted the problems of using RRD
files for large scale network monitoring systems - it's primary
function was to be efficient when reading, not writing data.  He
described the changes made in OpenNMS to enable the operator to choose
between RRD files or a Cassandra database without loosing any of the
reporting and graphing capabilities.  This work has also allowed
Grafana to pull data straight from OpenNMS core and measurement
filters to be written in R.

Colin Charles (MariaDB Corporation) gave a tour de force of best
practice for running your databases on your Linux infrastructure,
whether physical or hosted by a cloud provider.

Richard Melville (Cellularity Limited) introduced us to the next
generation packet filtering tools being developed on top of the Linux
netfilter framework.  His examples demonstrated its key differences
from our familiar iptables rules.

Dave Cross (Perl consultant) closed the track with an entertaining
report of his journey to publish his own book.  Although it was never
written, he did settle on an Open Source toolchain that started with
editing Markdown and ended with an e-book on a well known Internet
based shop, or a PDF.

A selection of excellent lightning talks rounded off the day.
Monitoring your own elderly mother was perhaps one of the most unusual
topics I've seen discussed at these conferences.  A five minute
trashing of almost every programming language you've heard of in
favour of PHP raised the most laughs of the day!

The second day started with Andrew Beverley introducing his simple
home-brew monitoring system - Admonitor, including a novel use of data
collection.  He appealed to the audience for ideas on how to progress
the tool, and the discussion afterwards was full of valuable and
friendly advice.

Jan-Piet Mens won the best talk of the conference with his
entertaining, insightful and comprehensive review of currently
available Open Source DNS servers.  He enlivened the talk with
anecdotes from his consulting work and some forthright personal
opinions.

Colin Charles returned to the floor for his second talk which was a
wide ranging review of options securing your databases, from the
historical poor defaults through to the latest developments of
encryption and authentication plugins.  Although he works for MariaDB,
he kept to the spirit of the conference by giving unbiased advice on
several competing products.

Dawn Foster (Community/Open Source Consultant) closed the track with
numerous short stories showing the different ways people became
involved in the Open Source communities they now lead or are well
known in.  The lowest barrier to entry - that of helping with
documentation was a pleasingly common way in.

The conference broke for an extended lunch which led into several
"birds of a feather" discussions.  I thoroughly enjoyed leading one on
Configuration Management where we shared frustrations, ideas,
practices, warnings, hopes and stories of our experiences of almost
all of the configuration management frameworks out there.

Lameck Amugongo closed the conference with an inspiring presentation
of Namibia's information and data access strategy to support its
aspiration to become a knowledge based economy.  This provoked much
discussion on data protection, the difference between "old" and "new"
legal systems and societies.

Chairing one track meant I only saw half of the talks, but if the
others were as good as those I sat through, then all the delegates
were treated to a wide ranging, entertaining and informative diet.

I am looking forward to meeting you all again in Manchester next year!

