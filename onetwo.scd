s.boot;
Env([0,1,0],[1,1],[1,-1]).plot;

(
    SynthDef.new(\kick, {
        arg freqA=1000, freqB=50, freqC=10, freqDur1=0.01, freqDur2=0.2, freqC1=1, freqC2=(-1), atk=0.01, rel=1, c1=1, c2=(-12), amp=0.8, pan=0, out=0;
        var sig, env, freqSweep;
        freqSweep= Env([freqA,freqB,freqC],[freqDur1,freqDur2],[freqC1,freqC2]).ar;
        env = Env([0,1,0],[atk,rel],[c1,c2]).kr(2);
        sig = SinOsc.ar(freqSweep, pi/2);
        sig = sig * env;
        sig = Pan2.ar(sig, pan, amp);
        Out.ar(out, sig);
}).add;


SynthDef(\gabberkick, {
    var snd, freq, high, lfo;
    freq = \freq.kr(440) * (Env.perc(0.001, 0.08, curve: -1).ar * 48 * \bend.kr(1)).midiratio;
    snd = Saw.ar(freq);
    snd = (snd * 100).tanh + ((snd.sign - snd) * -8.dbamp);
    high = HPF.ar(snd, 300);
    lfo = SinOsc.ar(8, [0, 0.5pi]).range(0, 0.01);
    high = high.dup(2) + (DelayC.ar(high, 0.01, lfo) * -2.dbamp);
    snd = LPF.ar(snd, 100).dup(2) + high;
    snd = RLPF.ar(snd, 7000, 2);
    snd = BPeakEQ.ar(snd, \ffreq.kr(3000) * XLine.kr(1, 0.8, 0.3), 0.5, 15);
    snd = snd * Env.asr(0.001, 1, 0.05).ar(2, \gate.kr(1));
    Out.ar(\out.kr(0), snd * \amp.kr(0.1));
}).add;
)

x = Synth.new(\kick, [\freqA, 500, \amp, 1]);

y = Synth.new(\gabberkick);
Env([0,1,0],[1,1],[1,-1]).plot;
p = Pbind(
        // Use \harps0i, not \default
	\instrument, \kick,
	\freqA, 500,
	\dur,1/4,
).play;
