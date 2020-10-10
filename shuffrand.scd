Ss.boot
(
Pbind(
\note, Pser([0, 2, 3, 5, 7, 8, 11, 12], 11),
\dur, 0.15;
).play;
)
// Pxrand
// Compare with Prand to hear the difference
(
p = Pbind(
\note, Pxrand([0, 2, 3, 5, 7, 8, 11, 12], inf),

\dur, 0.15;
).play;
)
// Pshuf
(
p = Pbind(
\note, Pshuf([0, 2, 3, 5, 7, 8, 11, 12], 6),
\dur, 0.15;
).play;
)
// Pslide
// Takes 4 arguments: list, repeats, length, step
(
Pbind(
\note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], 7, 3, 1),
\dur, 0.15;
).play;
)
// Pseries
// Takes three arguments: start, step, length
(
Pbind(
\note, Pseries(0, 2, 15),
\dur, 0.15;
).play;
)
// Pgeom
// Takes three arguments: start, grow, length
