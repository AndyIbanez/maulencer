maulencer
=========

A friend of mine told me his iPhone's hardware ringer doesn't work. So I was asked to write an icon on SpringBoard that toggled it for him. This is the result.

I am aware there is a tweak that adds many of these toggles in SpringBoard, but my friend couldn't pay for it. As such, he asked me to write this.

I recognize this is a very small tweak, that maybe it's not worth having the source code for: But I made a promise with myself that every free piece of code I release to the public will also be open source. For this reason, I'm sharing the source code of a tweak that can be written in less than an hour if you know what you're doing.

Finally, there are probably infinitely better ways to write this: As a quick fix I wrote an app that never launches whose icon toggles the ringer. If you want to make this better, go ahead.

Oh, yeah, as a sidenote, this tweak really only calls the method that gets called when the physical ringer is toggled. Sideswitch hooks this method to do its job. As such, if your phone ringer is broken, and you want to use Sideswitch, this toggle is basically a software replacement for the ringer, meaning Sideswitch will work with it.
