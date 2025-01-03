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

//--tweet0080 xOr disco stereo sweep NICE!!! play with 0082
//play{a=SinOsc;b=a.ar(1/3);Duty.ar(SampleDur.ir,0,Dseq([0,1],inf)).bitXor(a.ar(b>0*30+60,0,a.ar(4,0,a.ar([3,2]/9,b*3,9))))/9}//#SuperCollider
//--tweet0082 grr, grrr, grrrrr, whip!
play{a=LFTri.ar(1/9)*0.07+0.0708;CombN.ar(Decay2.ar(Duty.ar(Dseq([1e-4,a/2],inf),0!2,Dseq([-1,0,1,0],inf)),a/9,a)/5,1,1,12)}//#SuperCollider
(
Ndef(\x).fadeTime = 20;
Ndef(\x).fadeTime = 5;
Ndef(\x, { a=SinOsc;b=a.ar(1/3);Duty.ar(SampleDur.ir,0,Dseq([0,1],inf)).bitXor(a.ar(b>0*30+60,0,a.ar(4,0,a.ar([3,2]/9,b*3,9))))/9} );
)

(
Ndef(\y, {a=LFTri.ar(1/9)*0.07+0.0708;CombN.ar(Decay2.ar(Duty.ar(Dseq([1e-4,a/2],inf),0!2,Dseq([-1,0,1,0],inf)),a/9,a)/5,1,1,12)} );
Ndef(\y).play;
Ndef(\y).play;
)

//--tweet0050 clonky percussion exploration. play with 51
//play{a=Saw;b=(2..12);c=0.015;GVerb.ar(Splay.ar(Klank.ar(`[b*50+b,c,c],Hasher.ar(a.ar(b/4pi,a.ar(c)*b+b).ceil)))/9,5.rand+1)}//#SuperCollider

(
Ndef(\y).fadeTime = 15;
b.stop;
b= Task({
    20.do({ arg i;
		Ndef(\y, {
			a=Saw;b=(2..12);c=0.015;GVerb.ar(Splay.ar(Klank.ar(`[b*50+b,c,c],Hasher.ar(a.ar(b/4pi,a.ar(c)*b+b).ceil)))/9,5.rand+1) });
  });
});
b.start;
Ndef(\y).play;
)
//--tweet0051 mix with 50 above
//play{a=Saw;GVerb.ar(Splay.ar(BBandPass.ar(a.ar("sunday".ascii),a.ar(9/"slow".ascii)*400+500,a.ar(7/"coding".ascii)+1.1)/5))}//#SuperCollider
(
Ndef(\x).fadeTime = 15;
a.stop;

a = Task({
    2.do({ arg i;
		Ndef(\x, {
			a=Saw; GVerb.ar(
				Splay.ar(BBandPass.ar(a.ar("sunday".ascii),a.ar(9/"slow".ascii)*400+500,a.ar(7/"coding".ascii)+1.1)/5))});
  });
});
a.start;
Ndef(\x).play;
)


//--tweet0004 whirring soundscape 4 & 5
//r{loop{ z=20.rand+6;x={y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}.play(s,0,z);wait(26-z);x.release}}.play//#SuperCollider
// this one needs another def to start.
(
Ndef(\y).fadeTime = 15;
b.stop;
b = Task({
    4.do({ arg i;
        Ndef(\y).map(\s, i);
		Ndef(\y, { z=20.rand+6;x={ y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}} );
        Ndef(\y).fadeTime = 26-20.rand+6;
    });
});
b.start;
Ndef(\y).play;
)
b.stop;
b.start;


//--tweet0007 nice room plucked instrument with strums and nice growing druming.
//r{loop{x={BPF.ar(Pluck.ar(Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)}.play(s,0,9);wait(9);x.release(69)}}.play
(
Ndef(\x).fadeTime = 25;
a.stop;
a = Task({
    20.do({ arg i;
        Ndef(\x).map(\s, i);
		Ndef(\x, { BPF.ar(Pluck.ar( Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)*5} );
		Ndef(\x).fadeTime = (9);
        9.wait;
    });
});
a.start;
Ndef(\x).play;
)

