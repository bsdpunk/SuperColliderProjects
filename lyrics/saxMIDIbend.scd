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

});

MIDIdef.bend(\bendTest, {
	arg val, chan, src;
	[val, chan, src].postln;
}, chan:5);

)


s.boot;
(
SynthDef(\sax, { |out, freq=440, amp=0.1, gate=1|
	var num = 16;
	var harms = Array.series(num, 1, 1) * Array.exprand(num, 0.995, 1.001);
	var snd = SinOsc.ar(freq * SinOsc.kr(Rand(2.0,5.0),0,Rand(0.001, 0.01),1) * harms, mul:Array.geom(num, 1, 0.63));
	snd = Splay.ar(snd);
	snd = BBandPass.ar(snd, freq * XLine.kr(0.1,4,0.01), 2);
	snd = snd * amp * EnvGen.ar(Env.adsr(0.001, 0.2, 0.7, 0.2), gate, doneAction:2);
	Out.ar(out, snd!2);
}).add;
)
(
SynthDef.new(\tone, {
	arg freq=440, amp=0.3, gate=0, bend=0;
	var sig, env;
		sig = LFSaw.ar(freq)!2;
		env = EnvGen.kr(Env.adsr, gate, doneAction:2);
		sig = sig * env * amp;
	Out.ar(0, sig)
}).add;
)
//x =Synth.new(\tone, [\gate, 1]);

~notes = Array.newClear(128);