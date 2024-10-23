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


//--tweet0037 caliope on crack!
//play{a=LFCub;n=8;Splay.ar(a.ar({|i|pow(i+1,a.kr(1/n,i/n,1/n,1))}!n*150,0,a.kr({|i|pow(i+1,a.kr(i+0.5/n,i/n))}!n).max(0))/4)}//#SuperCollider

(
Ndef(\y).fadeTime = 5;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {
			a=LFCub;n=8;
			Splay.ar(a.ar({|i|pow(i+1,a.kr(1/n,i/n,1/n,1))}!n*150,0,a.kr({|i|pow(i+1,a.kr(i+0.5/n,i/n))}!n).max(0))/4) });
  });
});
b.start;
Ndef(\y).play;
)

//--tweet0028 another fibonacci tune (beeping)
//play{MoogFF.ar(LFTri.ar(CombN.ar(Duty.ar(1/8,0,Dseq(Dshuf(List.fib(16)%8*99,8),inf)),4,4,16))/4,LFTri.kr(1/16,0,2e3,3e3))!2}//#SuperCollider
(
Ndef(\y).fadeTime = 15;
b.stop;
b = Task({
    1.do({ arg i;
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


//--tweet0019 splat techno goes well with 20 times
//play{b=LocalBuf(1e4,2).clear;i=Sweep.ar(BufRd.ar(2,b,Saw.ar(1,2e3,5e3)),5e5);BufWr.ar(Saw.ar([8,50]),b,i);BufRd.ar(2,b,i)/3}//#SuperCollider

( // NICE with the one before 18!
Ndef(\y).fadeTime = 5;
Ndef(\y, { b=LocalBuf(1e4,2).clear;i=Sweep.ar(BufRd.ar(2,b,Saw.ar(1,2e3,5e3)),5e5);BufWr.ar(Saw.ar([8,50]),b,i);BufRd.ar(2,b,i)/3} );

)

//--tweet0020 arrpegios ahoi
//play{a=LFPulse;b=(1..4);Mix(a.ar(a.ar(a.ar(a.ar(b/32)+1/8)+1*b)+(Mix(a.ar(b/64))+a.ar(4/b)*(a.ar(a.ar(b/8))*2+b))*100))/8!2}//#SuperCollider
// sadly not as ndef

(
Ndef(\x).fadeTime = 15;
Ndef(\x, { a=LFPulse;b=(1..4);Mix(a.ar(a.ar(a.ar(a.ar(b/32)+1/8)+1*b)+(Mix(a.ar(b/64))+a.ar(4/b)*(a.ar(a.ar(b/8))*2+b))*100))/8!2} );

)

//--tweet0036 ohm song.
//play{Splay.ar({|i|SinOsc.ar(i+SinOsc.ar(0.01,a=pi/[2,4,8]@@i,0.1,1)*80+SinOsc.ar(i+1*1e-4+i),a,SinOsc.ar(i+1*1e-3,a)/4)}!9)}//#SuperCollider

(
Ndef(\y).fadeTime = 15;
b.stop;
b = Task({
    1.do({ arg i;
		Ndef(\y, {
			Splay.ar( {|i| SinOsc.ar(i+SinOsc.ar(0.01,a=pi/[2,4,8]@@i,0.1,1)*80+SinOsc.ar(i+1*1e-4+i),a,SinOsc.ar(i+1*1e-3,a)/4) }!9) });
  });
});
b.start;
Ndef(\y).play;
)

//--tweet0038 funky boing rythm pingpong play with ohm 36
//play{PingPong.ar(LocalBuf(3e4,2).clear,Ringz.ar(CuspN.ar*Impulse.kr([9,8]/12)/9,LFPar.kr(1/[3,2]).range(51,[99,17])*9),0.5)}//#SuperCollider
(
Ndef(\x).fadeTime = 15;

a = Task({
    1.do({ arg i;
		Ndef(\x, {
			PingPong.ar(LocalBuf(3e4,2).clear,Ringz.ar(CuspN.ar*Impulse.kr([9,8]/12)/9,LFPar.kr(1/[3,2]).range(51,[99,17])*9),0.5) });
  });
});
a.start;
Ndef(\x).play;
)






// SKIP for now
//--tweet0032 drone with ticks WATCH volume
//{Splay.ar({|i|l=LFTri.ar(1/6,i/1.5,2.5,3.5).round;SinOsc.ar(142.857*l,lag(l,i-3/6),1-poll(0.142857*l,10/6,"\t\t"))}!6)}.play//#SuperCollider
(
Ndef(\y).fadeTime = 9;
b.stop;
b = Task({
    1.do({ arg s;
		Ndef(\y).map(\i, s);
		Ndef(\y, { |i|
			Splay.ar({|i|l=LFTri.ar(1/6,i/1.5,2.5,3.5).round;
				SinOsc.ar(142.857*l,lag(l,i-3/6),1-poll(0.142857*l,10/6,"\t\t"))}!6)});
		9.wait;
  });
});
b.start;
Ndef(\y).play;
)


