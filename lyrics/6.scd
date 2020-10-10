~n = [1,2,3,4,5,6]
~n.do{arg item; item.postln}
~n.postln

(
SynthDef.new(\toil, {
	arg freq=200, dev=1.02, num=#[1,2,10,20];
	var temp, sum;
	sum = 0;
	sum.postln;
	//num.postln;
	num.do{
		arg count, i;
		i.postln;
		temp = SinOsc.ar(
			freq *
			(i + 1) *
			LFNoise1.kr({Rand(0.05, 0.2)}!2).range(dev.reciprocal, dev)
		);
		temp = temp * LFNoise1.kr({Rand(0.5, 8)}!2).exprange(0.01,1);
		sum = sum + temp;
	};
	sum = sum * 0.05;
	Out.ar(0, sum);

	}).add;
)
(
SynthDef(\sax, { |out, freq=440, amp=0.1, gate=1|
	var num = 16;
	var harms = Array.series(num, 1, 1) * Array.exprand(num, 0.995, 1.001);
	var snd = SinOsc.ar(freq * SinOsc.kr(Rand(2.0,5.0),0,Rand(0.001, 0.01),1) * harms, mul:Array.geom(num, 1, 0.63));
	snd = Splay.ar(snd);
	snd = BBandPass.ar(snd, freq * XLine.kr(0.1,4,0.01), 2);
	snd = snd * amp * EnvGen.ar(Env.adsr(0.001, 0.2, 0.7, 0.2), gate, doneAction:2);
	Out.ar(out, snd!2);
}).add;
)
20.do{arg item; item.postln;}
Synth.new(\toil)
x = Synth.new(\toil, [\num, [1,2,3,4,5]]);
Server.default.options.inDevice_("Built-in Microph");
Server.default.options.outDevice_("Built-in Output");
x.free;

s.options.numBuffers

