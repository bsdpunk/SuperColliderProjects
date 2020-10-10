s.boot;
s.makeWindow;

a = Scale.chromatic;
a.degrees.postln;        // [ 0, 2, 4, 5, 7, 9, 11 ]
a.semitones.postln;        // [ 0, 2, 4, 5, 7, 9, 11 ]
a.cents.postln;        // [ 0, 200, 300, 500, 700, 900, 1100 ]
a.ratios.postln;        // [ 1, 1.1224620483089, 1.2599210498937, 1.3348398541685, etc. ]

Pbind(\scale, a, \degree, Pseq((0..7) ++ (6..0) ++ [\rest], 1), \dur, 0.25).play;
 //s.stopRecording;



// use non-standard tuning
a.tuning_(\just);
a.degrees;        // no change; degrees are independent of tuning
a.semitones;        // [ 0, 2.0391000173077, 3.1564128700055, 4.9804499913461, etc. ]
a.ratios.collect(_.round(0.001));    // [ 1, 1.125, 1.2, 1.333, 1.5, 1.667, 1.875 ]

Pbind(\scale, a, \degree, Pseq((0..7) ++ (6..0) ++ [\rest], 1), \dur, 0.25).play;