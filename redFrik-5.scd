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
)
(
MIDIIn.connectAll;
//setup
Ndef.clear;
m = NdefGui.new;
n = NdefGui.new;

m.object_(Ndef(\x));
n.object_(Ndef(\y));
i = MIDIFunc.cc({arg ...args; Ndef(\y).vol_(args[0]/127.0)}, 0); // match cc 0
j = MIDIFunc.cc({arg ...args; Ndef(\x).vol_(args[0]/127.0)}, 1); // match cc 1

Ndef(\x).play;
Ndef(\y).play;

)

//--tweet0070 like 69 without verb add them together.
//play{a=LocalIn.ar(2);LocalOut.ar(a=Hasher.ar(a.round(SinOsc.ar(3.3e-4,a*2pi).round(5e-4))));a/3+CombN.ar(a,1,[1,0.9],3,0.4)}//#SuperCollider

(
Ndef(\y).fadeTime = 20;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {
			a=LocalIn.ar(2);LocalOut.ar(a=Hasher.ar(a.round(SinOsc.ar(3.3e-4,a*2pi).round(5e-4))));a/3+CombN.ar(a,1,[1,0.9],3,0.4) });
  });
});
b.start;
Ndef(\y).play;
)

//--tweet0030 horns on VarSaws through verb.
//play{a=LFPar;GVerb.ar(VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80)}//#SuperCollider
// you can just cut in one while the others are running on loop
(
Ndef(\x).fadeTime = 20;
a.stop;
a = Task({
    1.do({ arg i;
		Ndef(\x, {a=LFPar;
			GVerb.ar(
				VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80)} );
    });
});
a.start;
Ndef(\x).play;
)



//--tweet0069 sequence of noise gates with verb increasing room size Dnynamic! moves to white NOISE! And back
//play{a=LocalIn.ar(2);LocalOut.ar(a=Hasher.ar(a.round(LFPar.ar(4e-3).round(3e-3)/3+a)));FreeVerb2.ar(a[0],a[1],0.33,1,1,0.4)}//#SuperCollider

(
Ndef(\y).fadeTime = 20;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {
			a=LocalIn.ar(2);LocalOut.ar(a=Hasher.ar(a.round(LFPar.ar(4e-3).round(3e-3)/3+a)));FreeVerb2.ar(a[0],a[1],0.33,1,1,0.4) });
  });
});
b.start;
Ndef(\y).play;
)




