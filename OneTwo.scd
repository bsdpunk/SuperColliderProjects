s.boot;

(
var notes, on, off;

MIDIClient.init;
MIDIIn.connectAll;
//MIDIOut.disconnect("MidiEditor input", "RtMidi Input");
//for (0, 2, { arg i;  // prints values 3 through 7
notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
    notes[num] = Synth(\default, [\freq, num.midicps,
        \amp, veloc * 0.00315]);
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

q = { on.free; off.free; };
//});
)
// when done:
q.value;


b = NetAddr.new("127.0.0.1",NetAddr.8765);


b = NetAddr.new("127.0.0.1",NetAddr.langPort);

langPort = 8765
OSCFunc.trace;
//set the relevant IP and port - both arbitrary, but these will be sent to SuperCollider internally (assuming that NetAddr.langPort == 57120)
b = NetAddr.new("127.0.0.1", 8765);
//send the above message, and it should be shown in the post window
b.sendMsg("/hello", 1, 32.32, 'message')
// If this doesn't work, evaluate:
NetAddr.langPort


b = NetAddr.new("127.0.0.1", 8765);    // create the NetAddr
b.sendMsg("/hello", "there");    // send the application the message "hello" with the parameter "there"




(
OSCdef(\dinger,
    {
    // a simple function that triggers an envelope
        {Pulse.ar(1000,rrand(0.01,0.5),0.3)!2 * EnvGen.ar(Env.perc,doneAction:2)}.play
}, '/ding')
)
// Send a message with no parameters. It'll trigger the function within the OSCdef.
b.sendMsg("/ding")