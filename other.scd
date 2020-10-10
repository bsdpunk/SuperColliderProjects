(
s.waitForBoot({

	// cello like sound
	SynthDef(\cello, {
		|
		freq=440, amp=1.0, out=0, pan=0.0, rq=0.1,
		atk=0.01, dcy=0.1, sus=0.5, rls=0.4,
		gate=1, dur=2,
		aux=0, auxsend=0.1
		|
		var sig, env,width;
		env = EnvGen.ar(Env.adsr(atk, dcy, sus, rls), gate, doneAction:2);
		width = LFNoise2.kr(1).range(0.001, 0.01);
		sig = VarSaw.ar(freq+ SinOsc.ar(6,mul:Line.kr(0.0, 1, dur,doneAction:2)), width:width);
		sig = RLPF.ar(sig, freq*1, rq);
		sig = Decimator.ar(sig, 22050,2);
		sig = sig *env* amp;
		Out.ar(out, Pan2.ar(sig, pan));
		Out.ar(aux, sig*auxsend);
	}).add;

	SynthDef.new(\kick, {
        arg freqA=1000, freqB=50, freqC=10, freqDur1=0.01, freqDur2=0.2, freqC1=1, freqC2=(-1), atk=0.01, rel=1, c1=1, c2=(-12), amp=0.8, pan=0, out=0;
        var sig, env, freqSweep;
        freqSweep= Env([freqA,freqB,freqC],[freqDur1,freqDur2],[freqC1,freqC2]).ar;
        env = Env([0,1,0],[atk,rel],[c1,c2]).kr(2);
        sig = SinOsc.ar(freqSweep, pi/2);
        sig = sig * env;
        sig = Pan2.ar(sig, pan, amp);
        Out.ar(out, sig);
}).add;

	// I also like to add some verb to make the sound more natural
	// like it is inside a real hall.
	// This reverb by Eli Fieldsteel (see his wavetable youtube tutorial)
	SynthDef(\reverb, {
		arg in=0, out=0, dec=4, lpf=1500;
		var sig;
		sig = In.ar(in, 2).sum;
		sig = DelayN.ar(sig, 0.03, 0.03);
		sig = CombN.ar(sig, 0.1, {Rand(0.01,0.099)}!32, dec);
		sig = SplayAz.ar(2, sig);
		sig = LPF.ar(sig, lpf);
		5.do{sig = AllpassN.ar(sig, 0.1, {Rand(0.01,0.099)}!2, 3)};
		sig = LPF.ar(sig, lpf);
		sig = LeakDC.ar(sig);
		Out.ar(out, sig);
	}).add;

	s.sync;

	~verbBus = Bus.audio(s,2);
	~verb = Synth(\reverb, [\in, ~verbBus]);
});
)

// let's define a simple melody lick
(
Pbindef(\cello_lick,
	\instrument, \cello,
	\scale, Scale.minor,
	\octave, Prand([3,4], inf),
	\degree, Prand([0,2,4,5,6,7], inf),
	\pan, 0.0,
	\dur, Pstutter(Prand([1,2,3,4], inf), Prand([0.25, 0.5, 1], inf)),
	\amp, 0.9,
	\atk, Pkey(\dur)*0.5,
	\dcy, Pkey(\dur)*0.05,
	\sus, Pwhite(0.4, 0.7, inf),
	\rls, Pkey(\dur)*0.4,
	\rq, Pwhite(1, 0.3,inf),
	\aux, ~verbBus,
	\auxsend, 0.1,
).add;
s.sync;
)
(
p = Pbind(
        // Use \harps0i, not \default
	\instrument, \cello,
	\degree, Pseq( [0, -2, -4, -5, -7, -9, -11]),
	\dur,1/4,
).play;
)
// let's play it
(
var durations;
durations = [1/4, 1/8, 1/8, 1/8, 3/4, 1/4, 1/2, 3/4, 1/4, 1/2];
p = Pbind(*[
        // Use \harps0i, not \default
	\instrument, \kick,
	\amp, 2,
	\freqA, 500,
	\dur, Pseq(durations, inf),
	\bend, Pfuncn({ |x| if(x < (1/2), 0.4, 1) }, inf) <> Pkey(\dur),
]).play;
Pbindef(\cello_lick).play;
)






(
SynthDef(\acid, { arg out, freq = 1000, gate = 1, pan = 1, cut = 4000, rez = 0.8, amp = 1;
    Out.ar(out,
        Pan2.ar(
            RLPF.ar(
                Pulse.ar(freq, 0.05),
            cut, rez),
        pan) * EnvGen.kr(Env.linen(0.01, 1, 0.3), gate, amp, doneAction: Done.freeSelf);
    )
}).add;
)

(
Pbind(\instrument, \acid, \dur, Pseq([0.25, 0.5, 0.25], inf), \root, -12,
    \degree, Pseq([0, 3, 5, 7, 9, 11, 5, 1], inf), \pan, Pfunc({1.0.rand2}),
    \cut, Pxrand([1000, 500, 2000, 300], inf), \rez, Pfunc({0.7.rand +0.3}), \amp, 0.2).play;
)



(freq: 761).play // play a default synth sound with 761 Hz




a = Harmonics.new(16);    // just returns an instance of Harmonics with size



a.ramp(1.0, 1.0);    // returns a harmonic series

b = Buffer.alloc(s, 512, 1);
// harmonic series for freqs, ramp down for amps
b.sine2(a.ramp(1.0, 1.0).postln, a.ramp(0.5, -0.025).postln, true, true, true);
(
z = SynthDef("help-Osc",{ arg out=0,bufnum=0;
    Out.ar(out,
        Osc.ar(bufnum, 200, 0, 0.5)
    )
});
)
y = z.play(s,[\out, 0, \bufnum, b]);






a = (x: 6, y: 7, play: { (~x * ~y)});
a.asEvent;



Pbindef(\cello_lick).stop;
