/* from Fredrik Olofsson  https://sccode.org/1-4Qy
*  This is the first set of sc tweets converted to Ndefs to play them
*  The intent is to stick to triptychs
*  alternating between two Ndefs swapping voices.
*/

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
//s.boot; // start the server
MIDIIn.connectAll;
)

(
r = Recorder(s);
r.prepareForRecord(path:"~/Audio/supercollider/olofsson-triptychs/red-2-1.aiff",numChannels:2);
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
		{ r.record(path:"~/Audio/supercollider/olofsson-triptychs/red-2-1.aiff"); },
		{ r.stopRecording } )} , 41); // match cc 41 is record onkontrol2

// pause resume via midi
t = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).resume}, {Ndef(\y).pause })} , 48); // match cc 48
u = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).resume}, {Ndef(\x).pause })} , 49);
v = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).play}, {Ndef(\y).stop })} , 64);
w = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).play}, {Ndef(\x).stop })} , 65);
)

//--tweet0099 glass, phil
Pspawn(Pbind(\method,\par,\delta,1/8,\pattern,{Pbind(\dur,a=Pseq((1..9).sputter),\sustain,1/8/a,\degree,a,\detune,a)})).play//#SuperCollider

(
Ndef(\x).fadeTime = 30;
x = Pspawn(Pbind(\method,\par,\delta,1/8,\pattern,{Pbind(\dur,a=Pseq((1..9).sputter),\sustain,1/8/a,\degree,a,\detune,a)}));
Ndef(\x, x);
Ndef(\x).play;
)

//--tweet0100 mix with glass very nice!
r{loop{x=play{a=DelayN.ar(LPF.ar(InFeedback.ar(0,2),z=1.rrand(9)*99));SinOsc.ar(z+[0,3],a*pi)/2};6.wait;x.release(9)}}.play// #SuperCollider

(
Ndef(\y).fadeTime = 9;
a.stop;
a = Task({
    50.do({ arg i;
		Ndef(\y, {a=DelayN.ar(LPF.ar(InFeedback.ar(0,2),z=1.rrand(9)*99));SinOsc.ar(z+[0,3],a*pi)/2
		});
		6.wait;
  });
});
a.start;
Ndef(\y).play;

)