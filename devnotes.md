# Holybro CM4

I successfully got BlueOS on the compute module, needed  do this fix

But hit the wall because there is no follow-up on this https://discuss.bluerobotics.com/t/various-issues-running-blueos-on-pi-cm4/17595

# Current Setup

A pi is connected using the USB cable to the Flight Controller part of the MERV box.

BlueOS find the heartbeat nice and quickly and everything is good.

I then ssh (pi:raspberry) into blueos.local and from there I can do all my testing.  I have added my devtools so that I can easily fire-up the docker image for proper testing.
