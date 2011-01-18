---
layout: default
title: Post Mortem
---

<h1>Post Mortem</h1>

2010 may be aptly described as the 'year of the thesis'. 

It outlived an apartment, three semesters, two jobs, a relationship, a full conference planning and execution cycle, and spanned many countless weekend afternoons filled with dread and quiet procrastination over lattes and croissants.

What began as a sly attempt to avoid boring and easy courses slowly came to dominate my life in subtle ways. I knew I was wasting too much time reading crap on the internet, and I was fascinated in a deeply geeky way with the idea of writing my own feed reader. I approached my advisor Hossein, who promptly gave me an incredible amount of leeway and freedom and off I went. When I began, though, I only had a fuzzy idea of what I wanted to accomplish and as a result I attacked the problem lazily and haphazardly. By April I possessed a proof of concept, a functional sketch of what I wanted to achieve, but I had no idea of how to convert that effort into something worth *writing about*.

This soon began to consume me; the project was now overdue but I still had to perform a lot of basic research, which is a lot less fun than poking at a Rails project until something comes together. Research can be sickeningly open ended and it is remarkably difficult to estimate correctly. You simply won't know you've read enough until... you've read enough. With my graduation from university hanging in the balance and the enormity of my sunk costs yawning before me, it became ever more stressful and, perversely, easier to procrastinate.

Just as I began to fail at this in earnest, I also had to get a job. That happened. It's easy enough to put in a token effort when all you do all day is bum around, but performing more work after a full day of employment can become immensely frustrating. I eventually poked at the problem long enough to find something vaguely interesting to say, which in turn yielded this video:

<iframe src="http://player.vimeo.com/video/17650044?byline=0&amp;portrait=0" width="540" height="405" frameborder="0"></iframe>

In the end, I think I did OK. I'm terribly disappointed at the huge amount of time I've wasted, and there are many things that could be improved. Now that I've had some time to mull over it, I already want to redo the video and I have all sorts of ideas on how to better execute the product — if only I weren't exhausted of thinking about it. Despite this, it's just about respectable and I would say it's easily past two credits worth of effort. It's just an undergraduate thesis, after all.

What's most interesting to me is the emotional toll it exacted. For unrelated reasons, around October I relapsed into yet another major depressive episode, an emotional state that afflicts me more often than I like to admit. I'm still struggling to recover from this period. In the process I lost a good friend and undoubtedly damaged my relationship with the dozen or so amazing people I see on a regular basis. For a lack of better words, it sucks. If we hang out on a regular basis, I'm sorry.

When I finally finished describing the bulk of my work into the video you see above, I was overwhelmed with an immense wave of relief. I was also struck with the parallels between suffering from project purgatory and a good depression. Both seem to remove any concept of a future; you can't plan around it, and you begin to live on a day-to-day basis. I also haven't really enjoyed any time off for about a year now. Any kind of leisure time that didn't involve a social obligation was put aside.

When you're stuck, that kind of planning becomes inconceivable. I read very few books, went on zero trips, visited no museums, avoided shopping, I only played videogames that worked on my phone, I took on no side projects. As a rule of thumb, any idle time was consumed by a vague guilt. Lacking any direction and motivation to actually work on the project, as a consequence I spent many an evening and weekend furiously reading bullshit on the internet while avoiding work. Which is... ironic considering my thesis topic. Basically, I always had answer to the question, "Don't you have something better to do?"

This new found sense of freedom is still astonishing to me. I was considering signing up for a recreational sports league the other day and I was struck with how inconceivable this was only a few weeks ago. That kind of time commitment! Just crazy fucking bullshit. 

For the first time in my life, I now find myself with absolutely zero long term commitments and it is both terrifying and fascinating. I'm done school, my short-term freelance gig has come to an end and I'm going to be forced to move in April. 

Allow me to share some of the lessons I have drawn from this period.

<h2>Work habits</h2>

* I have an immensely difficult time navigating the chasm between [my ability to discern good work and my ability to execute good work](http://www.youtube.com/watch?v=BI23U7U2aUY). When it comes to my own projects, it's very paralyzing – from writing code to writing blog posts like this one. It's crippling to be unable to say, "[good enough](http://twitter.com/#!/siracusa/status/25990719793528832)" and learn from my work. You only get better from doing, and this is something I need to solve.

* My biggest mistake was probably not putting measurement at the forefront of the project. Measure everything. Then graph it. It's hard to make any sort of decision without solid data. I spent the first half of the project hacking away to a semi functional state but I was then left without any way to to figure out what should I do next. I was shocked at the amount of time it took me to discover that my first stab at classification yielded useless results

* Motivation and the ability to 'give a shit', in yourself and especially in other people, is a replenishable yet very finite resource.

* Attachment in many ways acts like a blinder. You lose the ability to evaluate your work, and become insulated to your idiosyncracies. As far as I can tell the best way out is to get other people to use your work. More on that later.

* Keep a sense of the future. Estimation is a crucial skill, and so is the ability to preserve a sense of perspective. Too many times I found myself hatching ridiculous work schedules that I managed to avoid by procrastination. I mustn't have wildly unrealistic expectations. Wildly unrealistic expectations are the mind-killer. Wildly unrealistic expectations are the little-death that bring total obliteration.


<h2>Building your own feed reader</h2>

* The actual [code](http://github.com/phillmv/thesis) is a bit of a mess. I'm almost tempted to remove it from github. Reasons: lack of coworkers to mock my ineptitude, tight deadlines ("does it work? great") and a high tolerance for bugs.

* That said, I think I put together one or two interesting things. I am heavily indebted to [Sau Sheong](http://blog.saush.com/2009/02/11/naive-bayesian-classifiers-and-ruby/)'s ruby naive\_bayes sample code [which I modified a bit](https://github.com/phillmv/thesis/blob/master/lib/errar/naive_bayes.rb). I also wrote a [very crude framework](https://github.com/phillmv/thesis/blob/master/lib/errar/errar.rb) for peforming a [ten-fold cross validation](http://en.wikipedia.org/wiki/Cross-validation_(statistics\)) on ruby accessible classifiers. The [daemon](https://github.com/phillmv/thesis/tree/master/lib/updatr) code is finicky (see below) but a bit non trivial. Some of the [parsing code](https://github.com/phillmv/thesis/blob/master/app/models/entry.rb) might be [of interest](https://github.com/phillmv/thesis/blob/master/app/models/stream.rb). Starting today, I would change a lot of the design, of course. I guess I did learn a thing or two. 

* Apparently the internet consensus ([sample](http://groups.google.com/group/feedzirra/browse_thread/thread/1480785d4d9f62a0)) is that you shouldn't really write daemons in Ruby. It will leak memory like a sieve and, anecdotally, the toolset support for profiling it is poor. Considering my investment in the Ruby ecosystem this was kind of mind shattering; maybe I should start diversifying my portoflio here.

* Having real people use your product is humbling and fascinating. I managed to bamboozle a handful of friends to try it out for me, and the depth of my innatention to user workflow was staggering. There is nothing as motivating has having someone use something you wrote, and I think I'm going to seek to replicate that experience as often as possible.

* You're forced to adopt [Postel's Law](http://en.wikipedia.org/wiki/Robustness_principle) wholeheartedly. Most feeds work properly but a whole bunch of them are riddled with bugs and idiosyncracies. After a while I identified three or four classes of CMS driven mistakes in feeds. Fixing some of them requires you to care about how the XML spec operates. Let me tell you, there is almost nothing interesting about the formal XML spec. Heuristics is king. Some feed authors actively work against you – Kottke for instance has a referrer whitelist on the images he includes in his blog.


* Having a relatively objective qualifier evaluate your reading produces strange yet enlightening results. It turns out I don't really like reading BoingBoing all that much and I don't miss about 30% of Kottke. On a personal level it confirmed my hypothesis that the 'inbox model' of feed reading is unsuitable to *my* needs. 

* There are two types of software documentation: non existent and worse than useless. There is a third kind, but it's so infrequently spotted in the wild it's asymptotically inexistent.

* It is incredibly non obvious how to convert academic math to code. More of a failing on my part. I also found the vocabulary mismatch between different academic communities to be interesting. Also worthy of note is the different ways different libraries sought about to implement the same concepts. Abstract ideas that are functionally isomorphic can be expressed in almost completely different ways.

* **Based purely on my own dataset and my own observations**, I would recommend that you **should not** use the classifier gem. Your mileage may vary of course. I haven't had the time to investigate what is going wrong within that library as the authors implemented it in a way that doesn't match up with my mental model of how a bayesian classifier might work. All I can really tell you is that based on my empirical observations and on my own quirky set of data the classifier gem performed worse than random chance. Here is the frustrating bit: I can't find a single example of anyone measuring the output of the gem in a statistically significant manner. This is easy to explain: no one has time to test anything other than the trivial case. If you have a large body of data and you've found classifier to be useful to you, I would love to test this out! Please [contact me](http://okayfail.com/about.html).

<h2>Now what?</h2>

I'm at a bit of a crossroads in life. I want to become as good at my work as I know I am capable of being. I want to keep meeting interesting people and working on interesting things. I'm going to try to enjoy my upcoming (hopefully brief) period of unemployment, as I haven't taken time off in about two years now. 

I don't know, but hopefully I'm going to enjoy it.
