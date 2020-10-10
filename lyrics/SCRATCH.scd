(
SynthDef.new("tutorial-SinOsc-stereo", { var outArray;
    outArray = [SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)];
    Out.ar(0, outArray)
}).play;
)

x = { SinOsc.ar(660, 0, 0.2) }.play;
y = SynthDef.new("tutorial-SinOsc", { Out.ar(0, SinOsc.ar(440, 0, 0.2)) }).play;
x.free;    // free just x
y.free;    // free just y

f = { SinOsc.ar(440 + 200.rand, 0, 0.2) };
x = f.play;
y = f.play;
z = f.play;
x.free; y.free; z.free;

// Now with a SynthDef. No randomness!
SynthDef("tutorial-NoRand", { Out.ar(0, SinOsc.ar(440 + 200.rand, 0, 0.2)) }).add;
x = Synth("tutorial-NoRand");
y = Synth("tutorial-NoRand");
z = Synth("tutorial-NoRand");
x.free; y.free; z.free;

play({SinOsc.ar(LFNoise0.kr(12, mul: 600, add: 1000), 0.3)})

play({RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar(1/[3, 4], 1500, 1600), 0.02)})


(
var notes, on, off;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
    notes[num] = Synth(\default, [\freq, num.midicps,
        \amp, veloc * 0.00315]);
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

//q = { on.free; off.free; };
)

// when done:
q.value;

MIDIClient.init;
MIDIIn.connectAll;
m = MIDIOut(0);  // Linux users: MIDIOut(0, MIDIClient.destinations[0].uid)
m.noteOn(16, 60, 60);
m.noteOn(16, 61, 60);
m.noteOff(16, 61, 60);
m.allNotesOff(16);
MIDIIn.connect; // 1 port midi interface
MIDIIn.sysex = { arg uid, packet; [uid,packet].postln };
MIDIIn.sysrt = { arg src, chan, val;  [src, chan, val].postln; };
MIDIIn.smpte = { arg src, chan, val;  [src, chan, val].postln; };

m.sysex(Int8Array[0xF0, 0, 0, 27, 11, 0, 0xF7])

m.smpte(24, 16)
m.midiClock
m.start
m.continue
m.stop