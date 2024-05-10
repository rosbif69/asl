StarTropics Autosplitter for Livesplit
--------------------------------------

Script to start timer and split at appropriate times in Livesplit for
StarTropics speedruns. Currently only supports FCEUX 2.2.3.

Can be installed by adding "Scriptable Autosplitter" to your layout and
pointing the script path to a locally saved copy of startropics.asl.

NOTE: You probably want to use a new set of splits at first with the
autosplitter.
It is important to note that with the exception of initial timer start on
control of Mike and split on Zoda death, which are determined based on the
current speedrun timing rules, all other splits are based solely on my
personal preference and will almost certainly differ from common use at times,
so it may be best to use a new set of splits initially.

--------
Options:
--------
- Split on change of chapter:
  Will split between "now saving" and "Chapter X: Chapter Title" screens.
- Split on score count finish:
  Will split on "Wow! You've done it!" screen when the score counter has
  finished adding dungeon score to the overall score total.
- Split on score count finish only if stage isn't last in chapter:
  Will split on "Wow! You've done it!" screen when the score counter has
  finished adding dungeon score to the overall score total, but will not do
  this for the last dungeon in a chapter. This setting is meant to be used in
  combination with "Split on change of chapter"
- Split on zoda death animation:
  Will split when Zoda's sprite starts to appear afflicted with fatal nausea.
- Start timer on Mikey control in Chapter 1:
  Will start the timer on first frame player can control Mikey

-------------
Known issues:
-------------
- Split on change of chapter will split two frames before the "Chapter X"
  screen begins to display
- Split on score count finish will occasionally fail to split. Initially when
  comparing specific score counter values, specifically identifying the frame
  when score being added changes from "1" to "0", the split would be missed
  about 30% of the time. This now uses a non-exact "less than" check, which
  appears to have resolved the issue - I haven't received another failure to
  split, but if it returns or is just less common, it'll need to be revisited
- Zoda death split: the split for zoda's death will trigger every frame he is
  in that matches the start of the death animation, which it turns out is a
  large number of times, pretty much once per frame on-and-off until the
  animation is over. Zoda death is traditionally the last split of the run,
  so the additional splits may not cause issues if they're ignored after the
  timer is stopped, but ideally this should probably be fixed to prevent
  possible issues
- Start timer on Mikey control occasionally does not start the timer. I think
  this may be a similar issues as the initial issues with split on score count,
  but I haven't looked into it yet as it seems uncommon and restarting is quick
- Additional testing is needed to ensure the requirements for triggering a
  split are specific and unique to situations where we would want to split, and
  are not able to be caused by other gameplay actions and situations. I
  completed several runs without any issues, but I didn't deviate much from the
  regular speedrun route.

------
To-Do:
------
- Support for other emulators
- Other split settings and timings as needed
- Fixes for known issues

-----------------
Thanks and hello:
-----------------
- StarTropics Speedrunning Discord: https://discord.gg/G7nqhyQjVp
- specifically, NotSid for pointing out there wasn't an autosplitter for ST and
  causing me to wonder how to make one
- Nintendo: thanks for making ST, but also, when's ST3?
- Ramen chat, degen group, bounce house: hi!

----------------
Version History:
----------------
- 0.1 - Initial release (this version) 2024-05-10
  (is stated version history even needed? I don't know how github works)
