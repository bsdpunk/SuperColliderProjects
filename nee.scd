(
a = Pbind(\x, Pseq([1, 2, 3]), \y, Prand([100, 300, 200], inf), \zzz, 99);
x = a.asStream;
)
​
x.next(()); // pass in an event ()
x.next(());
x.next(());
x.next(()); // end: nil
// sound examples
​
// using the default synth def
Pbind(\freq, Prand([300, 500, 231.2, 399.2], inf), \dur, 0.1).play;
Pbind(\freq, Prand([300, 500, 231.2, 399.2], inf), \dur, Prand([0.1, 0.3], inf)).play;
​
Pbind(\freq, Prand([1, 1.2, 2, 2.5, 3, 4], inf) * 200, \dur, 0.1).play;
(

// a SynthDef
SynthDef(\test, { | out, freq = 440, amp = 0.1, nharms = 10, pan = 0, gate = 1 |
    var audio = Blip.ar(freq, nharms, amp);
    var env = Linen.kr(gate, doneAction: Done.freeSelf);
    OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

Pbind(\instrument, \test, \freq, Prand([1, 1.2, 2, 2.5, 3, 4], inf) * 200, \dur, 0.1).play;



// standard syntax, arguments alternate symbols and patterns
(
Pbind(
    \instrument,        \test,
    \nharms,             Pseq([4, 10, 40], inf),
    \dur,                Pseq([1, 1, 2, 1]/10, inf),
    #[freq, sustain],    Ptuple([ // assignment to multiple keys
                            Pseq( (1..16) * 50, 4),
                             Pseq([1/10, 0.5, 1, 2], inf)
                        ])
).play;
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