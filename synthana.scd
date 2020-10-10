{
var sine = 0;
for(1, 10, {| i |
sine = sine + SinOsc.ar(i * 440, 0, 0.2 / i);
});
Out.ar(0, sine);
}.play;


(
SynthDef('analog synthesizer',
{| gate=1, freq, amp, sustain |
var sig, env;
sig = LFSaw.ar(freq);
sig = LPF.ar(sig, 4000);
env = EnvGen.kr(Env.adsr(1, 0.3, 1=.02, 2.0),
gate, 1, sustain, 2);
sig = sig * env * amp;
Out.ar(0, sig);
}).add;
)


(
Pbind(
	\instrument, 'analog synthesizer',
\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1),
\dur, 0.5,
).play;
)


Env([0,1, ^0],[1,1],[1,-1]).plot;