play{BPF.ar(Mix(Pulse.ar(587.3*[1,1.5074]))*EnvGen.ar(Env([0,1,0.1,0],[0.0005, 0.015,0.283]),Impulse.ar(2)),2640,0.9)!2}
Quarks.install("FoxDot")


Quarks.install("https://github.com/ambisonictoolkit/atk-sc3.git");

{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;

{RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar([0.3, 0.2]).range(100, 3000), 0.02)}.play;

Pbind(\degree, Pseries(0, 1, 30), \dur, 0.5).play;

Pbind(\degree, 0).play;

Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1), \dur, 0.2).play;


Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 5), \dur, Pseq([0.2, 0.1, 0.1, 0.2, 0.2, 0.35], inf)).play;



(
Pbind(
\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 5),
\dur, Pseq([0.2, 0.1, 0.1, 0.2, 0.2, 0.35], inf)
).play;
)


Pbind(\degree, 5).play;
Pbind(\note, 9).play;

Pbind(\midinote, 69).play;

Pbind(\freq, 440).play;










(
Pbind(
\degree, Pseq([0, −1, 2, −3, 4, −3, 7, 11, 4, 2, 0, −3], 5),
\dur, Pseq([0.2, 0.1, 0.1], inf),
\amp, Pseq([0.7, 0.5, 0.3, 0.2], inf),
\legato, 1
).play;
)


(
Pbind(
\degree, Prand([2, 3, 4, 5, 6], inf),
\dur, 0.15,
\amp, 0.2,
\legato, 0.1
).play;
)



(
Pbind(
\freq, Pwhite(100, 500),
\dur, Prand([0.15, 0.25, 0.3], inf),
\amp, 0.2,
\legato, 0.3
).trace.play;
)

Quarks.checkForUpdates({Quarks.install("SuperDirt", "v1.1.3"); thisProcess.recompile()})


(
Pbind(
\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], 4),
\dur, 0.15;
).play;
)
// Pseq
(
Pbind(
\note, Prand([0, 2, 3, 5, 7, 8, 11, 12], 4),
\dur, 0.15;
).play;
)
// Pwhite
(
Pbind(
\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], 4),
\dur, Pwhite(0.15, 0.5);
).play;
)



(
Pbind(
\note, Pseq([[0, 3, 7], [2, 5, 8], [3, 7, 10], [5, 8, 12]], 3),
\dur, 0.15
).play;
)
// Fun with strum
(
Pbind(
\note, Pseq([[−7, 3, 7, 10], [0, 3, 5, 8]], 2),
\dur, 1,
\legato, 0.4,
\strum, 0.1 // try 0, 0.1, 0.2, etc
).play;
)



(
Pbind(
\scale, Scale.harmonicMinor,
\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1),
\dur, 0.15;
).play;
)
// Evaluate this line to see a list of all available scales:
Scale.directory;
// If you need a chromatic note in between scale degrees, do this:
(
Pbind(
\degree, Pseq([0, 1, 2, 3, 3.1, 4], 1),
).play;
)


(
Pbind(
\note, Pser([0, 2, 3, 5, 7, 8, 11, 12], 11),
\ctranspose, 12, // transpose an octave above (= 12 semitones)
\dur, 0.15;
).play;
)

Pbind(\note, Pseq([0, 0.5, 1, 1.5, 1.75, 2], 1)).play;
Pbind(\midinote, Pseq([60, 69, 68.5, 60.25, 70], 1)).play;

(
Pbind(\degree, Pseq([0, 0.1, 1, 2, 3, 4, 5, 6, 7]),
\dur, 1;
).play(TempoClock(120/60)); // 120 beats over 60 seconds: 120 BPM
)


(
Pbind(
\degree, Pwhite(0, 10),
\dur, Pseq([0.1, 0.1, 0.3, 0.6, Rest(0.3), 0.25], inf);
).play;
)


( // open big block
Pbind(
\freq, Pn(Pseries(110, 111, 10)),
\dur, 1/2,
\legato, Pwhite(0.1, 1)
).play;
Pbind(
\freq, Pn(Pseries(220, 222, 10)),
\dur, 1/4,
\legato, Pwhite(0.1, 1)
).play;
Pbind(
\freq, Pn(Pseries(330, 333, 10)),
\dur, 1/6,
\legato, 0.1
).play;
)