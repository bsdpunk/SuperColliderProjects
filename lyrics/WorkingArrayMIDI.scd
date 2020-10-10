MIDIClient.init;
MIDIIn.connectAll;
(
MIDIdef.noteOn(\noteOnTest, {
arg vel, nn, chan, src;
[vel, nn, chan, src].postln;
	~notes[nn] = Synth.new(
		\tone,
		[
		\freq, nn.midicps,
		\amp, vel.linexp(1,127,0.01,0.3),
		\gate, 1,
	]);
});


MIDIdef.noteOff(\noteOffTest, {
	arg vel, nn;
	[vel, nn].postln;
	~notes[nn].set(\gate, 0);
	~notes[nn] = nil;

})
)
s.boot;

(
SynthDef.new(\tone, {
	arg freq=440, amp=0.3, gate=0;
	var sig, env;
		sig = LFTri.ar(freq)!2;
		env = EnvGen.kr(Env.adsr, gate, doneAction:2);
		sig = sig * env * amp;
	Out.ar(0, sig)
}).add;
)
x =Synth.new(\tone, [\gate, 1]);


~notes = Array.newClear(128);