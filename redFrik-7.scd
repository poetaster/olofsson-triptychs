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
//--tweet0020 arrpegios ahoi
//play{a=LFPulse;b=(1..4);Mix(a.ar(a.ar(a.ar(a.ar(b/32)+1/8)+1*b)+(Mix(a.ar(b/64))+a.ar(4/b)*(a.ar(a.ar(b/8))*2+b))*100))/8!2}//#SuperCollider
// sadly not as ndef

(
Ndef(\x).fadeTime = 10;
Ndef(\x, { a=LFPulse;b=(1..4);Mix(a.ar(a.ar(a.ar(a.ar(b/32)+1/8)+1*b)+(Mix(a.ar(b/64))+a.ar(4/b)*(a.ar(a.ar(b/8))*2+b))*100))/8!2} );
Ndef(\x).play

)


//--tweet0019 splat techno goes well with 20 times
//play{b=LocalBuf(1e4,2).clear;i=Sweep.ar(BufRd.ar(2,b,Saw.ar(1,2e3,5e3)),5e5);BufWr.ar(Saw.ar([8,50]),b,i);BufRd.ar(2,b,i)/3}//#SuperCollider

// NICE with the one before 18!
(
Ndef(\x).fadeTime = 15;
Ndef(\x, { b=LocalBuf(1e4,2).clear;i=Sweep.ar(BufRd.ar(2,b,Saw.ar(1,2e3,5e3)),5e5);BufWr.ar(Saw.ar([8,50]),b,i);BufRd.ar(2,b,i)/3} );
Ndef(\x).play;
)

(
Ndef(\y).fadeTime = 20;
Ndef(\y, { a=LFPulse;b=(1..4);Mix(a.ar(a.ar(a.ar(a.ar(b/32)+1/8)+1*b)+(Mix(a.ar(b/64))+a.ar(4/b)*(a.ar(a.ar(b/8))*2+b))*100))/8!2} );
Ndef(\y).play;
)


//--tweet0007 nice room plucked instrument with strums and nice growing druming.
//r{loop{x={BPF.ar(Pluck.ar(Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)}.play(s,0,9);wait(9);x.release(69)}}.play
(
Ndef(\x).fadeTime = 15;
a.stop;
a = Task({
    3.do({ arg i;
        Ndef(\x).map(\s, i);
		Ndef(\x, { BPF.ar(Pluck.ar( Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)*5} );
		Ndef(\x).fadeTime = (9);
        1.wait;
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
    2.do({ arg i;
        Ndef(\y).map(\s, i);
		Ndef(\y, { z=20.rand+6;x={ y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}} );
        Ndef(\y).fadeTime = 26-20.rand+6;
    });
});
b.start;
Ndef(\y).play;
)

