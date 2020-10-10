(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8, 500, 600)!2;
	sig = SinOsc.ar(freq);
}.play;
)