---
tags: [ROOT, browser, phys-492/592]
---

![keyword search ROOT class reference in firefox]({{site.exa}}/keywordSearchInFirefox.png)

No one can remember detailed usage of all the functions provided by ROOT classes. And there is no need to do so. The [ROOT online class references](https://root.cern.ch/root/html/ClassIndex.html) is one of the best places to look for the usage of a particular function in a class. Search on Google "ROOT TF1" for example, you will find the proper web page in the top lists. There is a better way in Firefox to get to a class reference page much quicker as shown in the top screen shot. I hold <kbd>Ctrl</kbd> key and press <kbd>l</kbd> to move my cursor to the Firefox address bar and type `r tf1` and <kbd>Enter</kbd>, Hooray! I am on the [TF1][] reference page already.

This is achieved using the Firefox [smart keyword][] technique. General tutorials can be easily found on Google. To make this work for ROOT reference pages, you will have to add a *New Bookmark* to the *Quick Searches* folder in the Firefox bookmark manager, fill in the dialog as shown in the following screen shot (the appearance may vary with the Firefox version, but the idea is the same):

![fill in keyword in firefox]({{site.exa}}/AddKeywordInFirefox.png)

The string you should put in the *Location:* dialog is:

[http://www.google.com/search?q=site%3Aroot.cern.ch%2Fdoc%2Fmaster+%s&btnI=I%27m+Feeling+Lucky](http://www.google.com/search?q=site%3Aroot.cern.ch%2Fdoc%2Fmaster+%s&btnI=I%27m+Feeling+Lucky)

This technique is not unique to Firefox. All main stream web browsers should have something very similar.

[TF1]:https://root.cern.ch/doc/master/classTF1.html
[smart keyword]:http://johnbokma.com/firefox/keymarks-explained.html
