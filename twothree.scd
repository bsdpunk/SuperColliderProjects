(
Tdef(\cheaptune,{
     var sig2,sig1,sig3,a,rel;
	sig1=[8,12,16,20];
	sig2=2/sig1.scramble;
	sig3=2*sig1.scramble;
	rel=Pxrand([0,0,0,0,0,0,0,1],inf).asStream;
	inf.do{
	        a=[0.125,0.25,0.5,0.5,0.25,0.125,1].choose;
		x=[60,67,75,79,94].scramble;
		play{EnvGen.ar(Env.perc(0.01,a+rel.next),doneAction:2)*
				AY.ar(x.midicps*a*sig1.choose,x*sig2.choose.midicps,a*sig3.choose.midicps,0.25,3,15,10,7)};
                play{EnvGen.ar(Env.perc(0.01,a/2),Duty.kr(Dseq([0.5,0.25],inf),0,Dxrand([0,1],inf)),doneAction:2)*
				BrownNoise.ar(0.6)!2};
                play{EnvGen.ar(Env.perc(0.01,a/4),Duty.kr(Dseq([0.25,0.5],inf),0,Dseq([0,1],inf)),doneAction:2)*
				LFNoise0.kr(16)*WhiteNoise.ar(0.2)!2};
		a.wait
	}
});
Tdef(\cheaptune).play;
)
s.record;
s.stopRecording;


s.boot;
(
SynthDef("help_mp3_01", { |bufnum = 0|
   var son, pitch, amp, wibble;
   son = DiskIn.ar(2, bufnum).mean;
   pitch = Tartini.kr(son)[0];
   amp = Amplitude.ar(son);
   pitch = Median.kr(5, pitch); // smooth
   pitch = pitch.min(10000).max(10); // limit
   pitch = pitch.cpsmidi.round.midicps; // coerce
   wibble = Pulse.ar(pitch, 0.2, amp * 2); // resynthesise
   wibble = FreeVerb.ar(wibble, 0.3, 0.1, 0.9); // bit of reverb just to taste
   Out.ar(0, wibble.dup);
}).memStore;
)

// Choose your MP3... some will work well and most will work badly.
// Oh and you'll need the MP3 Quark.
m = MP3("../mp3s/Gimme A Pig Foot And A Bottle Of Beer.mp3");
m.start;
b = Buffer.cueSoundFile(s, m.fifo, 0, 2);
// Off we go:
x = Synth("help_mp3_01", [\bufnum, b.bufnum], addAction:\addToTail);

// Please remember to tidy up after yourself:
x.free;
b.close; b.free;
m.finish;

(
a = {
	|freq = 40, wid = 0.5|
	Mix(LFPulse.ar(freq *((Array.fill(40, Pxrand((1, 2..20), inf).iter)/1000)+1),
		0, wid, 0.05)
	).dup
}.play;
)

//more distorsion
~widlfo = {Saw.kr(0.5).range(0,1)};
a.set(\wid, ~widlfo);

//stop
a.release;