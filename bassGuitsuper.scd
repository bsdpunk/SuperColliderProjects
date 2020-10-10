SynthDef(\help_dwgplucked, { |out=9, freq=220, amp=1, gate=120, c3=9440,release=0.35, pan=0| var env = Env.new([0,0.0005, 0.1,-0.1,0],[0.0001,0.0017,0.0028, 0.0045,0.0058],[4,-4,4]); var inp = SinOscFB.ar(Buffer.read(s, "/pathtoplucksamplefile")) * EnvGen.ar(env,gate) ; var son = DWGPlucked.ar(freq, amp, gate,0.6,0,c3,inp,release); DetectSilence.ar(son, 0.001, doneAction:2); Out.ar(out, Pan2.ar(son * 0.4, pan)); }).add;

a = Scale.new( #[0, 1, 3, 5, 7, 8, 10], 12, Tuning.new([0, 0.75, 2, 3.5, 4, 5, 6, 7, 8, 9, 10, 11]), "Custom" );
Pbind( \instrument, \help_dwgplucked, \scale ,a,
	//\delta , Pseq([1,0.5]*0.37,inf),
	\dur , 1/4, \degree, Pseq([1,8,8,8,Prand([11],1),8]-8, inf), ).play;