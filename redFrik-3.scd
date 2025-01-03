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

//--tweet0087 funny wobbly arpeggio (play with 82 grrrr) play against crack caliope
play{BLowPass4.ar(Splay.ar(VarSaw.ar(200*Duty.kr(1/(1..5),0,Dseq(flat({|x|{|y|y+1/(x+1)}!8}!8),inf)))),5e3,LFTri.kr(9)+1.1)}//#SuperCollider

//--tweet0036 ohm song.
//play{Splay.ar({|i|SinOsc.ar(i+SinOsc.ar(0.01,a=pi/[2,4,8]@@i,0.1,1)*80+SinOsc.ar(i+1*1e-4+i),a,SinOsc.ar(i+1*1e-3,a)/4)}!9)}//#SuperCollider

(
Ndef(\y).fadeTime = 10;
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
Ndef(\x).fadeTime = 10;

a = Task({
    1.do({ arg i;
		Ndef(\x, {
			PingPong.ar(LocalBuf(3e4,2).clear,Ringz.ar(CuspN.ar*Impulse.kr([9,8]/12)/9,LFPar.kr(1/[3,2]).range(51,[99,17])*9),0.5) });
  });
});
a.start;
Ndef(\x).play;
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

//--tweet0037 caliope on crack!
//play{a=LFCub;n=8;Splay.ar(a.ar({|i|pow(i+1,a.kr(1/n,i/n,1/n,1))}!n*150,0,a.kr({|i|pow(i+1,a.kr(i+0.5/n,i/n))}!n).max(0))/4)}//#SuperCollider

(
Ndef(\x).fadeTime = 5;
a.stop;
a = Task({
    1.do({ arg i;
		Ndef(\x, {
			a=LFCub;n=8;
			Splay.ar(a.ar({|i|pow(i+1,a.kr(1/n,i/n,1/n,1))}!n*150,0,a.kr({|i|pow(i+1,a.kr(i+0.5/n,i/n))}!n).max(0))/4) });
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


