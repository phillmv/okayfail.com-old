---
layout: post
published: false
---


<h2>Technical details</h2>

The video is encoded at 30 frames per second, and for the majority of the video every single frame is 30 minutes apart from each other. I sped it up towards the end.

I used the phenomenal [webkit to pdf](http://code.google.com/p/wkhtmltopdf/) utility. It also allows you to store images directly as jpegs. The following flags did the trick for me:

<pre>/usr/local/bin/wkhtmltoimage --crop-h 768 http://nytimes.com /home/phillmv/screenshots/nytimes-`date +%Y%m%d-%H%M`.jpg</pre>

The beautiful thing about the [iso 8601 time format](http://en.wikipedia.org/wiki/ISO_8601) is that it provides a natural alphabetic sort.

Then, I braved the world of [ffmpeg](http://en.wikipedia.org/wiki/FFmpeg) documentation. I could have pirated some video editing software, but that felt a bit like cheating. Getting it installed is easy, if like me you've spent eight years of your life dealing with this kind of stuff.

To get it up and running I followed [this really good guide for Ubuntu](http://ubuntuforums.org/showthread.php?t=786095) though the version sitting in your package repository of choice will probably work just fine; compiling it is more effort than it is worth. Make sure you enable both [x264](http://en.wikipedia.org/wiki/X264) and [liblame](http://lame.sourceforge.net/) support, possibly by installing the corresponding `-dev` packages.

Mac OSX users: Install [homebrew](http://mxcl.github.com/homebrew/) then go `brew install ffmpeg`. That should do the trick.

The hardest part was getting youtube to accept the file output. After a huge quantity of experimentation I eventually discovered that [youtube has a problem](http://forums.creativecow.net/thread/291/423) with the mpeg4 container and that storing it in Matroska instead makes all my pain go away. Read the following [excellent guide to video encoding by Mark Pilgrim](http://diveintomark.org/archives/2008/12/18/give-part-1-container-formats) if you don't intuitively grasp the meaning of the previous sentence.

There are two dozen configuration options for [ffmpeg](http://ffmpeg.org/ffmpeg-doc.html) and another dozen for [x264](http://sites.google.com/site/linuxencoding/x264-ffmpeg-mapping). People spend a ludicrous amount of time trading these back and forth like magic incantations but if you truly care about quality you should be using [presets](http://juliensimon.blogspot.com/2009/01/howto-ffmpeg-x264-presets.html). I wanted the quality to be good, but I'm not extremely picky. Also worth noting: Youtube allows you to upload videos with arbitrary resolutions while vimeo restricts you to 720p specifically. 

Here is my magic ffmpeg incantation:

`ffmpeg -r 30 -i %d.jpg -vcodec libx264 -bf 0 -crf 12 -threads 2 -an -r 30 "filenamehere.mp4"`

(<b>`-r`</b> input frame rate, <b>`-i`</b> input file (in this case, delineated by numerically increasing .jpg filenames), <b>`-bf`</b> I read somewhere that Youtube doesn't like... bframes? No I don't know what that means, <b>`-crf`</b> something to do with a encoding quality preset, <b>`-threads`</b> please use my whole cpu, <b>`-an`</b> I forget, <b>`-r`</b> output framerate)

which is then followed by:

`ffmpeg -i filenamehere.mp4 -i justice.mp3 -map 0:0 -map 1:0 -r 30 -acodec copy -vcodec copy -threads 2 "foo.mkv"`

(<b>`-map` </b> allows you to map an input channel to an output channel. I don't really understand the syntax. <b>`-acodec copy`</b> is used because I'm already supplying it with an acceptable format, and I don't need to transcode the audio. <b>`-vcodec copy`</b> occurs because I just want it to convert the container format without reencoding the video)

I wrote the following script to help me edit the collection of files:

<script src="https://gist.github.com/1089931.js?file=reorder.rb"></script>


