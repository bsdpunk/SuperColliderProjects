MIDIClient.init;
MIDIIn.connectAll;
(
MIDIdef.noteOn(\noteOnTest, {
arg vel, nn, chan, src;
[vel, nn, chan, src].postln;
	{
		var sig, env;
		sig = LFTri.ar(nn.midicps)!2;
		env = EnvGen.kr(Env.perc, doneAction:2);
		sig = sig * env * vel.linexp(1,127,0.01,0.3);
	}.play
})
)
s.boot;