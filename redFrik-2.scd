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
//s.boot; // start the server
Server.default.options.memSize = 819200;
MIDIIn.connectAll;
r = Recorder(s);

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
		{ r.record(path:"~/Audio/supercollider/olofsson-triptychs/red-2.aiff"); },
		{ r.stopRecording } )} , 41); // match cc 41 is record onkontrol2

// pause resume via midi
t = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).resume}, {Ndef(\y).pause })} , 48); // match cc 48
u = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).resume}, {Ndef(\x).pause })} , 49);
v = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).play}, {Ndef(\y).stop })} , 64);
w = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).play}, {Ndef(\x).stop })} , 65);
)


//--tweet0078 combed noise,  note sequence.
//play{a=GrayNoise.ar;b=(1..9);CombL.ar(a,1,b/Duty.ar(3,0,Dseq([0.5,1,2,3,5,4,3]*99,99)).lag3(1)).mean/2+Ringz.ar(a/99,b*99).mean!2}//#SuperCollider

(
Ndef(\x).fadeTime = 25;
b = Task({
    5.do({ arg i;
        //Ndef(\y).map(\i, i);
		Ndef(\x, { a=GrayNoise.ar;b=(1..9);CombL.ar(a,1,b/Duty.ar(3,0,Dseq([0.5,1,2,3,5,4,3]*99,99)).lag3(1)).mean/2+Ringz.ar(a/99,b*99).mean!2 } );
        3.wait;
    });
});
Ndef(\x).play;
b.start;
)


//--tweet0033 Noise rock combine with the VarSaws in 030!
//play{f=LFPar.ar(1/14).round*20+80;Splay.ar(LFPar.ar({|i|[i+1*f,i*f+(i+1/3)]}!4)>BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35))/3)}//#SuperCollider

(
Ndef(\y).fadeTime = 10;

a.stop;
a = Task({
    5.do({ arg i;
		Ndef(\y, {
			f=LFPar.ar(1/14).round*20+80;Splay.ar(
				LFPar.ar({|i|[i+1*f,i*f+(i+1/3)]}!4)>BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35))/3) });
  });
});
a.start;
Ndef(\y).play;
)

//--tweet0054 hardcore techno.!!!
play{CombN.ar(SyncSaw.ar(Saw.ar([3,4],32,64),Saw.ar([4,3],99,Duty.kr(1,0,flop(Dseq(2!6++4++3,99)*(4**(0..4))))))/9,1,1/6,2)}//#SuperCollider
(
Ndef(\x).fadeTime = 10;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\x, {CombN.ar(SyncSaw.ar(Saw.ar([3,4],32,64),Saw.ar([4,3],99,Duty.kr(1,0,flop(Dseq(2!6++4++3,99)*(4**(0..4))))))/9,1,1/6,2)} );
    });
});
b.start;
)