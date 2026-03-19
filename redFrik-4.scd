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
r.prepareForRecord(path:"~/Audio/supercollider/olofsson-triptychs/red-4.aiff");
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
		{ r.record(path:"~/Audio/supercollider/olofsson-triptychs/red-4.aiff"); },
		{ r.stopRecording } )} , 41); // match cc 41 is record onkontrol2

// pause resume via midi
t = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).resume}, {Ndef(\y).pause })} , 48); // match cc 48
u = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).resume}, {Ndef(\x).pause })} , 49);
v = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).play}, {Ndef(\y).stop })} , 64);
w = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).play}, {Ndef(\x).stop })} , 65);
)

//--tweet0077 sine drone + tick/tock rythm
play{a=SinOsc;b=a.ar(a.ar(1/[5,6])+[798,912],a.ar(1/16)*19+99*a.ar([9,8]),a.ar(a.ar(6)*a.ar(0.009)));a.ar([201,301],b).tanh}//#SuperCollider
// modified the bass sines deeper
(
Ndef(\y).fadeTime = 15;
b.stop;
b = Task({
    1.do({ arg i;
        //Ndef(\y).map(\i, i);
		Ndef(\y, { a=SinOsc;b=a.ar(a.ar(1/[5,6])+[798,912],a.ar(1/16)*19+99*a.ar([9,8]),a.ar(a.ar(6)*a.ar(0.009)));a.ar([101,201],b).tanh } );
        3.wait;
    });
});
b.start;
Ndef(\y).play;
)

//--tweet0065 mix with 0064 wra, wra
//format(a="play{SinOsc.ar(%/[%,%],LPF.ar(LFSaw.ar(Duty.ar(16/%,0,Dseq("+($%!96)+",inf)),%),%,%))}",*a.ascii).postln.interpret//#SuperCollider

(
Ndef(\x).fadeTime = 15;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\x, {
			a=Saw; GVerb.ar(
				Splay.ar(BBandPass.ar(a.ar("sunday".ascii),a.ar(9/"slow".ascii)*400+500,a.ar(7/"coding".ascii)+1.1)/5))});
  });
});
b.start;
Ndef(\x).play;
)


//--tweet0060 (play with 0064?)
//a=LFSaw;play{FreeVerb.ar(CombN.ar(VarSaw.ar(a.ar([32,48],0,42*a.ar(1/[16,24]),8),0,a.ar([18,12],0,1/64,1/64)).sin/2,1,1,2))}//#SuperCollider

(
Ndef(\x).fadeTime = 15;
a.stop;
a = Task({
    1.do({ arg i;
		Ndef(\x, {
			a=LFSaw;FreeVerb.ar(
				CombN.ar(VarSaw.ar(a.ar([32,48],0,42*a.ar(1/[16,24]),8),0,a.ar([18,12],0,1/64,1/64)).sin/2,1,1,2)) });
  });
});
a.start;
Ndef(\x).play;
)









Ndef(\y, Ndef(\x));
