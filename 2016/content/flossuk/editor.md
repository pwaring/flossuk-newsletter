# From the Editor

As reported in the September 2015 newsletter, FLOSS UK have moved to an annual
printed newsletter, supplemented by book reviews and event reports which will
be published on the website throughout the year. This is the first newsletter
to be published under the new format, which allows us to include photographs
and other images.

For those of you who are interested in such things, the newsletter is now
composed in Markdown and built using a fairly simple Bash script which pulls
all the content into a single file. Pandoc is then used to produce a PDF version
for online distribution and printing.

The big advantage of Markdown is that it removes the need to mark-up every
paragraph, list item etc. in SGML, which saves a huge amount of time. The new
process also uses filenames for sorting, so adding a new contributor biography
involves dropping a file with the relevant name (e.g. `waring-paul.md`) into a
directory and the build script will automatically pick it up. The same applies
to articles, event reports and other content.

All of the code and content is available on GitHub:

[https://github.com/pwaring/flossuk-newsletter](https://github.com/pwaring/flossuk-newsletter)

If you have any comments on the new format, please do get in touch via email:
[newsletter@flossuk.org](mailto:newsletter@flossuk.org).
