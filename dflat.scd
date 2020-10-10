s.boot;

a = Scale.major;
a.degrees;        // [ 0, 2, 4, 5, 7, 9, 11 ]
a.semitones;        // [ 0, 2, 4, 5, 7, 9, 11 ]
a.cents;        // [ 0, 200, 300, 500, 700, 900, 1100 ]
a.ratios;        // [ 1, 1.1224620483089, 1.2599210498937, 1.3348398541685, etc. ]

Pbind(\scale, a, \degree, Pseq((0..7) ++ (6..0) ++ [\rest], 1), \dur, 0.25).play;

// use non-standard tuning
a.tuning_(\just);
a.degrees;        // no change; degrees are independent of tuning
a.semitones;        // [ 0, 2.0391000173077, 3.1564128700055, 4.9804499913461, etc. ]
a.ratios.collect(_.round(0.001));    // [ 1, 1.125, 1.2, 1.333, 1.5, 1.667, 1.875 ]

Pbind(\scale, a, \degree, Pseq((0..7) ++ (6..0) ++ [\rest], 1), \dur, 0.25).play;



g = PdefGui();            // make a PdefGui
g.object = Pdef(\a);        // show when a Pdef is put in
Pdef(\a, Pbind(\note, 12));     // show whether it has a source
Pdef(\a).play;             // show whether playing, stopped, or ended, and pausable
Pdef(\a).set(\dur, 0.25);     // show whether the Pdef has an envir
g.close;

g = PdefGui(Pdef(\a), 3);    // with an envirgui for 3 items
Pdef(\a).set(\lofreq, [1, 10], \str, "someString", \oops, \oneSymbolTooMany);
Pdef(\a).clear;
Pdef(\a).envir.clear;
g.close;

(                // put it in an existing window - margin is 0@0
w = Window("my win", Rect(200, 200, 300, 200)).front;
w.addFlowLayout;
PdefGui(Pdef(\a), 0, w);
PdefGui(Pdef(\a), 3, w);
)