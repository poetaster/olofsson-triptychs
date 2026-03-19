/* from Fredrik Olofsson  https://sccode.org/1-4Qy
*  This is the first set of sc tweets converted to Ndefs to play them
*  The intent is to stick to triptychs
*  alternating between two Ndefs swapping voices.
*/
Ndef.clear;
(
//t.stop; //t.start; t.pause; t.resume;
Ndef.clear;
a.stop;
b.stop;
c.stop;
s.free;
t.free;
u.free;
v.free;
w.free;
)

(
s.boot; // start the server
MIDIIn.connectAll;
r = Recorder(s);
r.prepareForRecord(path:"~/Audio/supercollider/olofsson-triptychs/red-6.aiff");

//setup
Ndef.clear;
m = NdefGui.new;
n = NdefGui.new;

m.object_(Ndef(\x));
n.object_(Ndef(\y));
// volume control via midi
i = MIDIFunc.cc( {arg ...args; Ndef(\y).vol_(args[0]/127.0)}, 0); // match cc 0
j = MIDIFunc.cc( {arg ...args; Ndef(\x).vol_(args[0]/127.0)}, 1); // match cc 1

// record via midi
s = MIDIFunc.cc({arg ...args;
	if (args[0] > 0,
		{ r.record(path:"~/Audio/supercollider/olofsson-triptychs/red-6.aiff"); },
		{ r.stopRecording } )} , 41); // match cc 41 is record onkontrol2

// pause resume via midi
t = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).resume}, {Ndef(\y).pause })} , 48); // match cc 48
u = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).resume}, {Ndef(\x).pause })} , 49);
v = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).play}, {Ndef(\y).stop })} , 64);
w = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).play}, {Ndef(\x).stop })} , 65);
)

//--tweet0090 very nice with 89 above
play{FreeVerb.ar(Splay.ar(BBandPass.ar(Blip.ar(b=(1..8)+1,LFTri.ar(1/b)*9e3,LFTri.ar(3/4/b).max(0)),b*999,1/b),2,3),0.3,1)}// #SuperCollider
(
Ndef(\y).fadeTime = 20;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {FreeVerb.ar(Splay.ar(BBandPass.ar(Blip.ar(b=(1..8)+1,LFTri.ar(1/b)*9e3,LFTri.ar(3/4/b).max(0)),b*999,1/b),2,3),0.3,1)} );
    });
});
b.start;
Ndef(\y).play;
)

//--tweet0092 formant singing
play{Mix(Pan2.ar(Formlet.ar(Dust.ar(b=(1..8)),b*89,b/55,b/9),SinOsc.ar(b),LFSaw.ar(9.5-b,b/9,LFTri.ar(b/5)*4).max(0)).sin)}// #SuperCollider
(
Ndef(\x).fadeTime = 10;
//a.stop;
a = Task({
    5.do({ arg i;
		Ndef(\x, {
			Mix(Pan2.ar(Formlet.ar(Dust.ar(b=(1..8)),b*89,b/55,b/9),SinOsc.ar(b),LFSaw.ar(9.5-b,b/9,LFTri.ar(b/5)*4).max(0)).sin) });
  });
});
a.start;
Ndef(\x).play;
)


//--tweet0089 cave drop music very nice. try 77 or 99
play{GVerb.ar(Splay.ar(Ringz.ar(Blip.ar(a=[5,8,13,21,34,55,13],LFNoise0.ar(4/a)*144,LFNoise1.ar(4/a).max(0)),a*144,4/a))/6,144)}//#SuperCollider
(
Ndef(\y).fadeTime = 20;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {
			GVerb.ar(Splay.ar(Ringz.ar(Blip.ar(a=[5,8,13,21,34,55,13],LFNoise0.ar(4/a)*144,LFNoise1.ar(4/a).max(0)),a*144,4/a))/6,144) });
  });
});
b.start;
Ndef(\y).play;
)







