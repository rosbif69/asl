state("fceux", "2.2.3")
{
	byte mikex: 0x3B1388, 0x19;
	byte mikey: 0x3B1388, 0x15;
	byte chapternow: 0x3B1388, 0x5;
	byte pacing: 0x3B1388, 0x11;
	byte scorecountdown: 0x3B1388, 0x197;
	byte zodahp: 0x3B1388, 0x330;
	byte zodareserve: 0x3B1388, 0x704;
	byte zodasprite: 0x3B1388, 0x144;
}

split
{
	return (settings["chapterchange"] && current.chapternow > old.chapternow && current.chapternow != 1) ||
	(settings["stageclear"] && current.scorecountdown == 0 && old.scorecountdown > current.scorecountdown) ||
	(settings["midstage"] && current.scorecountdown == 0 && old.scorecountdown > current.scorecountdown && ((current.chapternow == 3 && current.mikex != 24 && current.mikey != 232) || (current.chapternow == 6 && current.mikex == 152 && current.mikey == 56) || (current.chapternow == 7 && current.mikex == 152 && current.mikey == 72))) ||
	(settings["zodadeath"] && current.zodahp == 127 && current.zodareserve == 0 && current.zodasprite == 165);
}

start
{
	return settings["chap1start"] && current.mikex == 8 && old.pacing == 6 && current.pacing == 30 && current.chapternow == 1;
}

startup
{
	settings.Add("chapterchange", true, "Split on change of chapter");
	settings.SetToolTip("chapterchange", "Split on new chapter start");
	settings.Add("stageclear", true, "Split on score count finish");
	settings.SetToolTip("stageclear", "Split when the score stops counting up after Wow! You've Done It!");
	settings.Add("midstage", false, "Split on score count finish only if stage isn't last in chapter");
	settings.SetToolTip("midstage", "Split on score count finish only for 3-1, 3-2, 3-3, 3-4, 6-1, and 7-1");
	settings.Add("zodadeath", true, "Split on zoda death animation");
	settings.SetToolTip("zodadeath", "Split on zoda death animation");
	settings.Add("chap1start", true, "Start timer on Mikey control in Chapter 1");
	settings.SetToolTip("chap1start", "Start timer on Mikey control in Chapter 1");



	Action<string> DebugOutput = (text) => {
		print("[StarTropics Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
}
