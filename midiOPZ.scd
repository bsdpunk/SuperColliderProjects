s.boot;
MIDIClient.init;
MIDIIn.connectAll;


MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn, chan, src].postln;
});