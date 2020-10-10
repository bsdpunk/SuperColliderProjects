{
var sine = 0;
for(1, 10, {| i |
sine = sine + SinOsc.ar(i * 440, 0, 0.2 / i);
});
Out.ar(0, sine);
}.play;