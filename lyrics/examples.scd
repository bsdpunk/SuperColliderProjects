// Example 1 - hihat only
(
Pbind(
	\instrument, "hihat",
	\dur, Pseq([
		1/8,         1/8,          1/8,                  1/8, // beat 1
		1/8,         1/8,          1/16, 1/16,      1/8, // beat 2
		1/8,         1/8,          1/16, 1/16,      1/8, // beat 2
		1/8,         1/8,          1/16, 1/16,      1/32, 1/32, 1/32, 1/32, 1/8 // beat 2
	], inf),
	\att, 0.01,
	\rel, 0.05,
	\ffreq, 11000,
	\pan, 0,
	\amp, 0.3,
	\tempo, 50/60
).play;
)

// Example 2
(
Pbind(
	\instrument, "hihat",
	\dur, Pseq([Rest(1/4), 1/4], inf),
	\att, 0.01,
	\rel, 0.1,
	\ffreq, 11000,
	\pan, 0,
	\amp, 0.3
).play;

Pbind(
	\instrument, "snare",
	\dur, Pseq([Rest(1/2), 1/2], inf),
	\att, 0.01,
	\rel, 0.1,
	\sinfreq, 180,
	\ffreq, 2000,
	\amp, 0.25

).play;

Pbind(
	\instrument, "kick",
	\dur, 1/2,
	\att, 0.01,
	\rel, 0.22,
	\sinfreq, 60,
	\glissf, 0.9,
	\amp, 1,
).play;

Pbind(
    \instrument, "sawSynth",
    \midinote, Pseq([
        [50, 53, 55, 57],
        [53, 56, 58, 60],
		Prand([
			[56, 59, 61, 63],
            [49, 52, 54, 56],
		], 1)
		],
        inf
    ),
    \dur, Prand([1, 3, 4, 4.5], inf),
	\att, 0.1,
	\rel, Pkey(\dur) + 1,
	\hifreq, 5000,
    \amp, 0.2
).play;

Pbind(
	\instrument, "sawSynth",
	\midinote, Pseq([36, 32, 32, 37], inf),
	\dur, Pseq([1/4, 1/4, 1/2, Rest(3), 1/4], inf),
	\ctranspose, [0, -12],
	\att, 0.01,
	\rel, 0.2,
	\amp, 0.4,
	\lofreq, 100,
	\hifreq, 1000
).play;
)


// Example 1 - hihat only
(
Pbind(
	\instrument, "hihat",
	\dur, Pseq([
		1/8,         1/8,          1/8,                  1/8, // beat 1
		1/8,         1/8,          1/16, 1/16,      1/8, // beat 2
		1/8,         1/8,          1/16, 1/16,      1/8, // beat 2
		1/8,         1/8,          1/16, 1/16,      1/32, 1/32, 1/32, 1/32, 1/8 // beat 2
	], inf),
	\att, 0.01,
	\rel, 0.05,
	\ffreq, 11000,
	\pan, 0,
	\amp, 0.3,
	\tempo, 50/60
).play;
)

// Example 2
(
Pbind(
	\instrument, "hihat",
	\dur, Pseq([Rest(1/4), 1/4], inf),
	\att, 0.01,
	\rel, 0.1,
	\ffreq, 11000,
	\pan, 0,
	\amp, 0.3
).play;

Pbind(
	\instrument, "snare",
	\dur, Pseq([Rest(1/2), 1/2], inf),
	\att, 0.01,
	\rel, 0.1,
	\sinfreq, 180,
	\ffreq, 2000,
	\amp, 0.25

).play;

Pbind(
	\instrument, "kick",
	\dur, 1/2,
	\att, 0.01,
	\rel, 0.22,
	\sinfreq, 60,
	\glissf, 0.9,
	\amp, 1,
).play;

Pbind(
    \instrument, "sawSynth",
    \midinote, Pseq([
        [50, 53, 55, 57],
        [53, 56, 58, 60],
		Prand([
			[56, 59, 61, 63],
            [49, 52, 54, 56],
		], 1)
		],
        inf
    ),
    \dur, Prand([1, 3, 4, 4.5], inf),
	\att, 0.1,
	\rel, Pkey(\dur) + 1,
	\hifreq, 5000,
    \amp, 0.2
).play;

Pbind(
	\instrument, "sawSynth",
	\midinote, Pseq([36, 32, 32, 37], inf),
	\dur, Pseq([1/4, 1/4, 1/2, Rest(3), 1/4], inf),
	\ctranspose, [0, -12],
	\att, 0.01,
	\rel, 0.2,
	\amp, 0.4,
	\lofreq, 100,
	\hifreq, 1000
).play;
)
