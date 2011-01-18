---
layout: default
title: Thoughts on building a feed reader
---

<h1>Thoughts on building a feed reader</h1>

During the winter semester of 2009, I convinced my school administration to let me skip a prerequisite course I considered beneath me and enroll directly into 'Web Applications'. Therein, with lots of help from an amazing friend of mine named John Sully, we put together a neat demo of an app that displayed news information to visitors and sorted them according to which categories of news they preferred over time.

That course turned into a freelance gig with the start-up that was sponsoring our project. I spent the summer of 2009 being the sole technical worker in a ten person online news startup. It was stressful, it was fun, I learned a lot about managing expectations and it enabled me to move downtown.

The academic year of 2009-2010 thus appeared on the horizon and I found myself hatching a plan. I was tired of taking courses that were relatively unchallenging and the slim pickings offered in the course calendar weren't encouraging. In what turned out to me a momentous decision, I convinced the professor of my 'Web Applications' course to let me expand the original idea into an undergraduate thesis. My schedule thus looked incredibly enticing, and the idea of rolling my own project was kind of intoxicating.

That decision turned out to be both great and terrible. Although I quickly put together a proof of concept, I soon found myself perilously behind schedule. I eventually poked at the problem long enough to find something vaguely interesting to say, which in turn yielded this video:

<iframe src="http://player.vimeo.com/video/17650044?byline=0&amp;portrait=0" width="540" height="405" frameborder="0"></iframe>

Allow me to share some of the lessons I have drawn from this period.

<h2>Work habits</h2>

* I have an immensely difficult time navigating the chasm between [my ability to discern good work and my ability to execute good work](http://www.youtube.com/watch?v=BI23U7U2aUY). When it comes to my own projects, it's very paralyzing – from writing code to writing blog posts like this one. It's crippling to be unable to say, "[good enough](http://twitter.com/#!/siracusa/status/25990719793528832)" and learn from my work. You only get better from doing, and this is something I need to solve.

* My biggest mistake was probably not putting measurement at the forefront of the project. Measure everything. Then graph it. It's hard to make any sort of decision without solid data. I spent the first half of the project hacking away to a semi functional state but I was then left without any way to to figure out what should I do next. I was shocked at the amount of time it took me to discover that my first stab at classification yielded useless results

* Motivation and the ability to 'give a shit', in yourself and especially in other people, is a replenishable yet very finite resource.

* Attachment in many ways acts like a blinder. You lose the ability to evaluate your work, and become insulated to your idiosyncrasies. As far as I can tell the best way out is to get other people to use your work. More on that later.

* Keep a sense of the future. Estimation is a crucial skill, and so is the ability to preserve a sense of perspective. Too many times I found myself hatching ridiculous work schedules that I managed to avoid by procrastination. I mustn't have wildly unrealistic expectations. Wildly unrealistic expectations are the mind-killer. Wildly unrealistic expectations are the little-death that bring total obliteration.

* Marketing turns out to be a vital skill. Here I possessed what was a functional yet completely undemoable project. Whenever someone asked me what was I up to these days, I would pause for a beat and respond with something completely asinine. The very best description was offered by my roommate Max, who put it thusly: "Readless seeks to predict what you'd like to read based on what you've read before". Being unable to sell your ideas to people who don't know what "supervised online text classification" or "rss feed" means is a big handicap.

<h2>Building your own feed reader</h2>

* The actual [code](http://github.com/phillmv/thesis) is a bit of a mess. I'm almost tempted to remove it from github. Reasons: lack of coworkers to mock my ineptitude, tight deadlines ("does it work? Great") and a high tolerance for bugs.

* That said, I think I put together one or two interesting things. I am heavily indebted to [Sau Sheong](http://blog.saush.com/2009/02/11/naive-bayesian-classifiers-and-ruby/)'s ruby naive\_bayes sample code [which I modified a bit](https://github.com/phillmv/thesis/blob/master/lib/errar/naive_bayes.rb). I also wrote a [very crude framework](https://github.com/phillmv/thesis/blob/master/lib/errar/errar.rb) for performing a [ten-fold cross validation](http://en.wikipedia.org/wiki/Cross-validation_(statistics\)) on ruby accessible classifiers. The [daemon](https://github.com/phillmv/thesis/tree/master/lib/updatr) code is finicky (see below) but a bit non trivial. Some of the [parsing code](https://github.com/phillmv/thesis/blob/master/app/models/entry.rb) might be [of interest](https://github.com/phillmv/thesis/blob/master/app/models/stream.rb). Starting today, I would change a lot of the design, of course. I guess I did learn a thing or two. 

* Apparently the internet consensus ([sample](http://groups.google.com/group/feedzirra/browse_thread/thread/1480785d4d9f62a0)) is that you shouldn't really write daemons in Ruby. It will leak memory like a sieve and, anecdotally, the toolset support for profiling it is poor. Considering my investment in the Ruby ecosystem this was kind of mind shattering; maybe I should start diversifying my portfolio here.

* Having real people use your product is humbling and fascinating. I managed to bamboozle a handful of friends to try it out for me, and the depth of my inattention to user workflow was staggering. There is nothing as motivating has having someone use something you wrote, and I think I'm going to seek to replicate that experience as often as possible.

* You're forced to adopt [Postel's Law](http://en.wikipedia.org/wiki/Robustness_principle) wholeheartedly. Most feeds work properly but a whole bunch of them are riddled with bugs and idiosyncrasies. After a while I identified three or four classes of CMS driven mistakes in feeds. Fixing some of them requires you to care about how the XML spec operates. Let me tell you, there is almost nothing interesting about the formal XML spec. Heuristics is king. Some feed authors actively work against you – Kottke for instance has a referrer whitelist on the images he includes in his blog.


* Having a relatively objective qualifier evaluate your reading produces strange yet enlightening results. It turns out I don't really like reading BoingBoing all that much and I don't miss about 30% of Kottke. On a personal level it confirmed my hypothesis that the 'inbox model' of feed reading is unsuitable to *my* needs. 

* There are two types of software documentation: non existent and worse than useless. There is a third kind, but it's so infrequently spotted in the wild it's asymptotically inexistent.

* It is incredibly non obvious how to convert academic math to code. More of a failing on my part. I also found the vocabulary mismatch between different academic communities to be interesting. Also worthy of note is the different ways different libraries sought about to implement the same concepts. Abstract ideas that are functionally isomorphic can be expressed in almost completely different ways.

* **Based purely on my own dataset and my own observations**, I would recommend that you **should not** use the classifier gem. Your mileage may vary of course. I haven't had the time to investigate what is going wrong within that library as the authors implemented it in a way that doesn't match up with my mental model of how a bayesian classifier might work. All I can really tell you is that based on my empirical observations and on my own quirky set of data the classifier gem performed worse than random chance. Here is the frustrating bit: I can't find a single example of anyone measuring the output of the gem in a statistically significant manner. This is easy to explain: no one has time to test anything other than the trivial case. If you have a large body of data and you've found classifier to be useful to you, I would love to test this out! Please [contact me](http://okayfail.com/about.html).

