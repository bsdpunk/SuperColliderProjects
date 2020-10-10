"Hello World".postln;
//{SinOsc.ar}.play;
//{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;
//{RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar([0.3, 0.2]).range(100, 3000), 0.02)}.play;

// (
 // A little poem
 //"Today is Sunday".postln;
 //"Foot of pipe".postln;
 //"The pipe is made of gold".postln;
 //"It can beat the bull".postln;
// )

 //100.do({"Print this line over and over...".scramble.postln});
// QUICK RECORD
 // Start recording:
 s.record;
 // Make some cool sound
 {Saw.ar(LFNoise0.kr([2, 3]).range(100, 2000), LFPulse.kr([4, 5]) * 0.1)}.play;
 // Stop recording:
 s.stopRecording;
 // Optional: GUI with record button, volume control, mute button:
 s.makeWindow;



a = "Hello, World"; // a string of characters
 b = [0, 1, 2, 3, 5]; // a list
 c = Pbind(\note, Pwhite(0, 10), \dur, 0.1); // you'll learn all about Pbind later,don't worry

 // ...and now you can use them just like you would use the original data:
 a.postln; // post it
 b = b + 100; // do some math
 c.play; // play that Pbind
 d = b * 5; // take b, multiply by 5, and assign that to a new variable



 ~myFreqs = [415, 220, 440, 880, 220, 990];
 ~myDurs = [0.1, 0.2, 0.2, 0.5, 0.2, 0.1];

Pbind(\freq, Pseq(~myFreqs), \dur, Pseq(~myDurs)).play;

Pbind(\degree, Pseries(0, 1, 30), \dur, 0.05).play;
Pbind(\degree, 0).play;
Pbind(\degree, 0, \dur, 0.5).play;
Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 10), \dur, 0.2).play;


(
TempoClock.default.tempo = 84/60;

p = Pbind(
    \scale, #[0, 2, 3, 5, 7, 8, 10],
    \root, 2,
    \degree, Pseq(#[rest, 4, 3, 4, 2, 4, 1, 4, 0, 4, -0.9, 4, 0, 4, 1, 4, 2, 4,
        -3, 4, -1.9, 4, -0.9, 4, 0, 4, -0.9, 4, 0, 4, 1, 4, 2], 1),
    \dur, 0.25
).play;
)

(
p = Pbind(
    \scale, #[0, 2, 3, 5, 7, 8, 10],
    \root, 2,
    \degree, Place([#[rest, 3, 2, 1, 0, -0.9, 0, 1, 2, -3, -1.9, -0.9, 0, -0.9, 0, 1, 2],
        (4 ! 16) ++ \rest], 17),
    \dur, 0.25
).play;
)

(
p = Pbind(
    \scale, #[0, 2, 3, 5, 7, 8, 10],
    \root, 2,
    \degree, Ppatlace([Pseq(#[rest, 3, 2, 1, 0, -0.9, 0, 1, 2, -3, -1.9, -0.9, 0, -0.9, 0, 1, 2], 1),
        Pn(4, 16)], inf),
    \dur, 0.25
).play;
)