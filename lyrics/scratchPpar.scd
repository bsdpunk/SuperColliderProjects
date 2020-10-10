//File.class('/Users/dusty/SimpleMIDIFile.scd'); //.load;
m = SimpleMIDIFile.read("~/Downloads/af.mid");
m.noteEvents.collect({ |i| i.postln }); ""
//var n,d,t;
//n, d, t = ImportMidiFile("~/Downloads/nigh.mid")

//m.play
m.p.play

m.midiEvents.dopostln; // all midi events
m.plot

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

QuarksGui()
