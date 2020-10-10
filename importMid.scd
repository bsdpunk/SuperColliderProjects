/* Sébastien Clara - Janvier 2016


Import a midi file on 3 Arrays : notes, durations & dates


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Put or link this file in a specific directories
Typical user-specific extension directories :
OSX:	~/Library/Application Support/SuperCollider/Extensions/
Linux: 	~/.local/share/SuperCollider/Extensions/

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Dependence : wslib on Quarks

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
typeMidi => For noteOn & noteOff information.
But with MuseScore, we don't have. So put typeMidi to 1.
See the examples below.

*/

ImportMidiFile {
	*new {	arg file, typeMidi=0;

		var midiFile;
		var notes, durees, dates;
		var on, off, datesIndex;

		midiFile = SimpleMIDIFile.read(file);

		if (typeMidi == 0,{
			midiFile.noteEvents.do({ |i| if(i[2] == \noteOn,
				{on = on.add(i)},
				{off = off.add(i)})
			});
		},{
			midiFile.noteEvents.do({ |i| if(i[5] != 0,
				{on = on.add(i)},
				{off = off.add(i)})
			});
		});


		datesIndex = on.collect({|i| i[1]});

		datesIndex.asSet.asArray.sort.do({|date|
			var indices;
			indices =  datesIndex.indicesOfEqual(date);

			notes = notes.add( indices.collect({|i| on[i][4]}) );

			durees = durees.add( indices.collect({|i|
				var offIndice, duree;
				offIndice = off.collect({|j| j[4]}).detectIndex({|j| j == on[i][4]});
				duree = off[offIndice][1] - on[i][1];
				off.removeAt(offIndice);
				duree;
			}) );

			dates = dates.add( date );
		});



		^[notes, durees, dates];
	}
}

/*
//////////////////////////////////////////////////////////////////////////
//	Usage :

m = SimpleMIDIFile.read("~/Desktop/bwv772.mid");
m.noteEvents.collect({ |i| i.postln }); ""
/*
[ 1, 97, noteOn, 0, 60, 127 ]
[ 1, 265, noteOff, 0, 60, 127 ]
[ 1, 278, noteOn, 2, 62, 127 ]
[ 1, 446, noteOff, 2, 62, 127 ]
*/
// => typeMidi by default

// notes, durations, dates <=
# n, d, t = ImportMidiFile("~/Desktop/bwv772.mid");

n
d
t


m = SimpleMIDIFile.read("~/Desktop/cadence.mid");
m.noteEvents.collect({ |i| i.postln }); ""
/*
[ 0, 0, noteOn, 0, 72, 73 ]
[ 0, 479, noteOn, 0, 72, 0 ]
[ 0, 480, noteOn, 0, 69, 69 ]
[ 0, 959, noteOn, 0, 69, 0 ]
*/
// => typeMidi != 0 !!!!!!!!!!!!!!

// notes, durations, dates <=
# n, d, t = ImportMidiFile("~/Desktop/cadence.mid", 1);

n
d
t

*/