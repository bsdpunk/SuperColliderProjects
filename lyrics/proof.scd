~chan = 4

(
~chan = 4;
	SynthDef.new(\playbuf_test, {
		arg amp=1, out=0, buf, rate=1, da=2, chan=2;
		var sig;
		sig = PlayBuf.ar(~chan.asInteger, buf, rate, doneAction:da);
		sig = sig * amp;
		Out.ar(out, sig);
	}).add;
)