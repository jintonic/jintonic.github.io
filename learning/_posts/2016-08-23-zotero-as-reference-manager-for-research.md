---
tags: [zotero, bibtex, phys-492/592]
---

![Zotero in Firefox as a reference manager]({{site.exa}}/zotero4firefox.png)

A local folder with some downloaded PDF files in it is how most of us manage 
our research references at the very beginning. When the number of files 
increases as your research progresses, we start to create sub folders and sub 
sub folders. It gets harder and harder to find a specific file. This is where a 
*reference manager* can help. It is basically a program to manage the meta data 
of reference files.

There are many *reference manager* programs out there, [Zotero][], 
[Mendeley][], [JabRef][], [CiteULike][], just to name a few. I've tried all of 
them and settled down eventually in [Zotero][]. The reasons are, first, I need 
both a cloud server and local copies of my references, so that I can work in a 
local machine and sync the updated reference collections with other machines or 
people; secondly, it must be able to pull meta data of a reference from a web 
page automatically so that I don't have to fill anything by hand; third, it 
should allow me to create public and private groups to collaborate with other 
people. [Zotero][] shines in all aspects. However, the [Zotero][] server 
provides very limited storage as a free service. I had to pay for larger 
storage so that I can use it for both teaching and research. [Mendeley][] can 
be a better choice if you mainly work alone since its free version provides 
more storage space.

[Zotero][] was developed originally as a *firefox* plugin. Now, it has 
standalone version and works for all mainstream operating systems and browsers. 
However, the firefox plugin version of it is still the best in terms of 
functionality. To install it for firefox, please go to 
<https://www.zotero.org/download> using firefox, click the *Install Zotero for 
Firefox* bottom as shown in the top screen shot and follow the instructions. 

The above steps would only give you a program that can be used to manage your 
local references. If you want to backup your collections on the cloud, you can 
register in <https://www.zotero.org> so that you can use their free cloud 
hosting of your references.

Once you have installed zotero plugin and restarted your firefox, press 
<kbd>Ctrl+Shift+z</kbd> to open the zotero user interface within firefox. Click 
on the gear icon on its top bar and select *Preferences...*, then go to the 
*Sync* tab, insert your zotero server username and password there so that you 
can sync your local copy of your reference collections with those in the 
server.

To save a reference paper to zotero, you need to press <kbd>Ctrl+Shift+z</kbd> 
first to open the zotero user interface, click into the collection fold that 
you want to add the new reference in, go to the web page of the reference paper 
in another tab, click on the small triangle beside the zotero icons in the 
firefox tool bar and select the right importing method from the drop down list 
as shown in the screen shot below. The firefox version of zotero provides the 
most complete list of the importing methods.

![import arXiv article to zotero from firefox]({{site.exa}}/zotero4arXiv.png)

Now, you can export the saved reference to a bibtex file as shown in the 
following screen shot:

![export reference in zotero to bibtex]({{site.exa}}/zoteroexport.png)

The bibtex file can be then uploaded to your [Overleaf][] project and ready to 
be used in LaTeX.

[Zotero]:https://www.zotero.org
[Mendeley]:https://www.mendeley.com
[JabRef]:https://www.jabref.org
[CiteULike]:http://www.citeulike.org
[Overleaf]:https://www.overleaf.com
