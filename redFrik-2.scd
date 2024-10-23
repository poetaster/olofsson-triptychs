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
//setup
Ndef.clear;
m = NdefGui.new;
n = NdefGui.new;

m.object_(Ndef(\x));
n.object_(Ndef(\y));

Ndef(\x).play;
Ndef(\y).play;

)



//--tweet0028 another fibonacci tune (beeping)
//play{MoogFF.ar(LFTri.ar(CombN.ar(Duty.ar(1/8,0,Dseq(Dshuf(List.fib(16)%8*99,8),inf)),4,4,16))/4,LFTri.kr(1/16,0,2e3,3e3))!2}//#SuperCollider
(
Ndef(\y).fadeTime = 10;
b.stop;
b = Task({
    20.do({ arg i;
       Ndef(\y, {MoogFF.ar(LFTri.ar(
			CombN.ar(
				Duty.ar(1/8,0,Dseq(Dshuf(
					List.fib(16)%8*99,8),inf)),4,4,16))/4,LFTri.kr(1/16,0,2e3,3e3))!2} );
		9.wait;
    });
});
b.start;
Ndef(\y).play;
)
b.stop;
b.start;

//--tweet0037 caliope on crack!
//play{a=LFCub;n=8;Splay.ar(a.ar({|i|pow(i+1,a.kr(1/n,i/n,1/n,1))}!n*150,0,a.kr({|i|pow(i+1,a.kr(i+0.5/n,i/n))}!n).max(0))/4)}//#SuperCollider

(
Ndef(\x).fadeTime = 3;
Ndef(\x).play;
m = Task({
    1.do({ arg i;
		Ndef(\x, {
			a=LFCub;n=8;
			Splay.ar(a.ar({|i|pow(i+1,a.kr(1/n,i/n,1/n,1))}!n*150,0,a.kr({|i|pow(i+1,a.kr(i+0.5/n,i/n))}!n).max(0))/4) });
  });
});
m.start;
)
m.stop;
m.start;


//--tweet0030 horns on VarSaws through verb.
//play{a=LFPar;GVerb.ar(VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80)}//#SuperCollider

// you can just cut in one while the others are running on loop
(
Ndef(\y).fadeTime = 9;
b.stop;
b = Task({
    5.do({ arg i;
		Ndef(\y, {a=LFPar;
			GVerb.ar(
				VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80)} );
    });
});
b.start;
)


//--tweet0033 Noise rock combine with the VarSaws in 030!
//play{f=LFPar.ar(1/14).round*20+80;Splay.ar(LFPar.ar({|i|[i+1*f,i*f+(i+1/3)]}!4)>BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35))/3)}//#SuperCollider

(
Ndef(\x).fadeTime = 3;
Ndef(\x).play;
a.stop;
a = Task({
    5.do({ arg i;
		Ndef(\x, {
			f=LFPar.ar(1/14).round*20+80;Splay.ar(
				LFPar.ar({|i|[i+1*f,i*f+(i+1/3)]}!4)>BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35))/3) });
  });
});
a.start;
)

//--tweet0054 hardcore techno.!!!
play{CombN.ar(SyncSaw.ar(Saw.ar([3,4],32,64),Saw.ar([4,3],99,Duty.kr(1,0,flop(Dseq(2!6++4++3,99)*(4**(0..4))))))/9,1,1/6,2)}//#SuperCollider
(
Ndef(\y).fadeTime = 9;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {CombN.ar(SyncSaw.ar(Saw.ar([3,4],32,64),Saw.ar([4,3],99,Duty.kr(1,0,flop(Dseq(2!6++4++3,99)*(4**(0..4))))))/9,1,1/6,2)} );
    });
});
b.start;
)