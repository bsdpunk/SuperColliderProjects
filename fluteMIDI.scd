QuarksGui();

m = SimpleMIDIFile.read("~/Downloads/shine.mid");
m.play;
c = m.noteEvents.collect({ |item, i| i.postln; item.postln }); "";
c[233][4]

SynthDef(\ks_string, { arg note, pan, rand, delayTime;
    var x, y, env;
    env = Env.new(#[1, 1, 0],#[2, 0.001]);
    // A simple exciter x, with some randomness.
    x = Decay.ar(Impulse.ar(0, 0, rand), 0.1+rand, WhiteNoise.ar);
     x = CombL.ar(x, 0.05, note.reciprocal, delayTime, EnvGen.ar(env, doneAction:2));
    x = Pan2.ar(x, pan);
    Out.ar(0, LeakDC.ar(x));
}).add;

{ // and play the synthdef
    20.do({
        Synth(\ks_string,
            [\note, [48, 50, 53, 58].midicps.choose,
            \pan, 1.0.rand2,
            \rand, 0.1+0.1.rand,
            \delayTime, 2+1.0.rand]);
        [0.125, 0.25, 0.5].choose.wait;
    });
}.fork;

// here using patterns
Pdef(\kspattern,
    Pbind(\instrument, \ks_string, // using our sine synthdef
            \note, Pseq.new([60, 61, 63, 66], inf).midicps, // freq arg
            \dur, Pseq.new([0.25, 0.5, 0.25, 1], inf),  // dur arg
            \rand, Prand.new([0.2, 0.15, 0.15, 0.11], inf),  // dur arg
            \pan, 1.0.rand2,
            \delayTime, 2+1.0.rand;  // envdur arg
        )
).play;