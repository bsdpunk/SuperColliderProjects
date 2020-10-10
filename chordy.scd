( // open big block
Pbind(
\freq, Pn(Pseries(110, 111, 10)),
\dur, 1/2,
\legato, Pwhite(0.1, 1)
).play;
Pbind(
\freq, Pn(Pseries(220, 222, 10)),
\dur, 1/4,
\legato, Pwhite(0.1, 1)
).play;
Pbind(
\freq, Pn(Pseries(330, 333, 10)),
\dur, 1/6,
\legato, 0.1
).play;
) // close big block



(
p = Pbind(
    \degree, Pseries(7, Pwhite(1, 3, inf) * Prand(#[-1, 1], inf), inf).fold(0, 14)
        + Prand(#[[0, -2, -4], [0, -3, -5], [0, -2, -5], [0, -1, -4]], inf),
    \dur, Pwrand(#[1, 0.5], #[0.8, 0.2], inf)
).play;
)



(
~chords = Pbind(\instrument,\bpfsaw,
    \dur,Pwhite(4.5,7.0,inf),
    \scale,[Scale.minor,Scale.major].choose,
    \degree,Pwrand([[0,2,4],[3,5,7],[4,6,8]],[0.5,0.25,0.25],inf),
    \cfmin,100,
    \cfmax,1500,
    \rqmin,Pexprand(0.02,0.15,inf),
    \atk,Pwhite(2.0,4.5,inf),
    \rel,Pwhite(6.5,10.0,inf),
    \ldb,6,
    \lsf,1000,
    \octave,Pwrand([4,3,5],[0.6,0.3,0.1],inf),
    \amp,Pwhite(0.8,2.0),
    \out,0);
~chords.play;
);

(
Pbind(
\degree, Pseq([0, −1, 2, −3, 4, −3, 7, 11, 4, 2, 0, −3], 5),
\dur, Pseq([0.2, 0.1, 0.1], inf),
\amp, Pseq([0.7, 0.5, 0.3, 0.2], inf),
\legato, 0.4
).play;
)

(
Pbind(\degree, (-2)!2, \dur, 1,\out, 1).play;
Pbind(\degree, 0!2, \dur, 1,\out, 1).play;
Pbind(\degree, 2!2, \dur, 1,\out, 1).play;
)

(

Pbind(
	\degree, Pseq([(-1), 0, 1, 3],4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([2, 4, 5, 7], 4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([(4), 6, 7, 9],4),
	\dur, 1/4
).play;

)
	Pseq(\degree, Pseries(2)).play;
	Pseq(\degree, Pseries(4)).play;
)







(

Pbind(
	\degree, Pseq([0, 2, 4, 5],4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([4, 6, 8, 9], 4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([7, 9, 11, 12],4),
	\dur, 1/4
).play;
)




(

Pbind(
	\degree, Pseq([3, 1, -4, -1, ],4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([8, 6, -1, 4], 4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([11, 9, 3, 6],4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([Rest(1), Rest(1), 6, Rest(1)],4),
	\dur, 1/4
).play;
)










(

Pbind(
	\degree, Pseq([3, 1, -4, -1, ],4),
	\dur, 1/8
).play;
Pbind(
	\degree, Pseq([8, 6, -1, 4], 4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([11, 9, 3, 6],4),
	\dur, 1/4
).play;
Pbind(
	\degree, Pseq([Rest(1), Rest(1), 6, Rest(1)],4),
	\dur, 1/4
).play;
)


















(
Pbind(\midinote, Pseq([75,76,75,76,71,74,72,69,45,52,57,60,64,69]),
\dur, 1/4).play
)
























