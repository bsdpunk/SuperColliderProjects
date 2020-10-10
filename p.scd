(
z = {
arg freq = 440, amp = 1;
var sig;
sig = SinOsc.ar(freq) * amp;
}.play;


)

s.boot
z.set(\freq, 330);
z.free
s.boot