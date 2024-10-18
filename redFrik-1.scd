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
o = NdefGui.new;
m.object_(Ndef(\x));
n.object_(Ndef(\y));
o.object_(Ndef(\z));
Ndef(\x).play;
Ndef(\y).play;
Ndef(\z).play;
)

/*(
Ndef(\x).fadeTime = 5;
Ndef(\x, { |i=1 |
	//var e = Env.adsr(fadeTime, 0.01, 0.4, fadeTime).ar(2, gate);
	y={ Pan2.ar( SinOsc.ar(i+1, SinOsc.ar( (i%9).div(3)*100+(i%9)+500),0.03) * 4  ,1.0.rand2)} } );
Ndef(\y, { |i=1 |
	z={ Pan2.ar(BPF.ar(Impulse.ar(18.linrand+0.5),9999.linrand,0.3.linrand,5)*3.0,1.0.rand2)} } );
)*/

(
a.stop;
Ndef(\x).fadeTime = 5;
a = Task({
    19.do({ arg i;
        Ndef(\x).map(\i, i);
		Ndef(\x,  { { Pan2.ar( SinOsc.ar(i+1, SinOsc.ar( (i%9).div(3)*100+(i%9)+500),0.03) * 4 ,1.0.rand2) } });
        [10,15,5].choose.wait;
		Ndef(\x).fadeTime = [10,15,5].choose;
    });
});
a.start;
Ndef(\x).play;
)



//--tweet0002 tick drip impulses.
//r{99.do{x={Pan2.ar(BPF.ar(Impulse.ar(18.linrand+0.5),9999.linrand,0.3.linrand,5),1.0.rand2)}.play;3.wait;x.release(9)}}.play//#SuperCollider

(
b.stop;
Ndef(\y).fadeTime = 9;
b = Task({
   29.do({ arg i;
        Ndef(\y).map(\i, i);
		Ndef(\y, { x={ Pan2.ar(BPF.ar(Impulse.ar(18.linrand+0.5),9999.linrand,0.3.linrand,5)*3.0,1.0.rand2)}} );
		3.wait;
		x.release(9);
    });
});
b.start;
Ndef(\y).play;
)

b.stop;
b.start;

//--tweet0003 metalic whips and blips
//r{loop{x=play{t=SinOsc.ar(999.rand).abs;Formlet.ar(TDuty.ar(t,0,t),4e3.linrand,t,1-t)!2};wait(9.rand+1);x.release(39)}}.play//#SuperCollider

(
Ndef(\z).fadeTime = 9;
c = Task({
    19.do({ arg i;
        Ndef(\z).map(\i, i);
		Ndef(\z, x = { t=SinOsc.ar(999.rand).abs;Formlet.ar(TDuty.ar(t,0,t),4e3.linrand,t,1-t) ! 2} );
        wait(9.rand+1);
		x.release(9)
		//Ndef(\z).fadeTime = [5,15,30].choose;
    });
});
c.start;
Ndef(\z).play;
)
c.stop;
c.start;

//--tweet0005 light ringing soundscape
//r{loop{z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}.play(s,0,z);wait(z/3);x.release}}.play//#SuperCollider

(
a.stop;
Ndef(\x).fadeTime = 9;
a = Task({
    20.do({ arg i;
        Ndef(\x).map(\s, i);
		Ndef(\x, { z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}} );
		Ndef(\x).fadeTime = 60.rand+1/3;
    });
});
a.start;
Ndef(\x).play;
)
a.stop;
a.start;

//--tweet0004 whirring soundscape 4 & 5
//r{loop{ z=20.rand+6;x={y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}.play(s,0,z);wait(26-z);x.release}}.play//#SuperCollider
// this one needs another def to start.
(
Ndef(\y).fadeTime = 9;
b.stop;
b = Task({
    20.do({ arg i;
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



//--tweet0006 Blows up in original with reverb. works well with 0005
//r{loop{x={	MoogFF.ar(ClipNoise.ar*0.4,LFPar.kr({0.3.rand}!2,0,600,990))}.play(s,0,19);1.wait;x.release}}.play//#SuperCollider

(
c.stop;
Ndef(\z).fadeTime = 5;
c = Task({
    20.do({ arg i;
        Ndef(\z).map(\s, i);
		Ndef(\z, { MoogFF.ar(ClipNoise.ar*0.4,LFPar.kr({0.3.rand}!2,0,600,990))} );
        1.wait;
    });
});
c.start;
Ndef(\z).play;
)
c.stop;
c.start;

//--tweet0007 nice room plucked instrument with strums and nice growing druming.
//r{loop{x={BPF.ar(Pluck.ar(Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)}.play(s,0,9);wait(9);x.release(69)}}.play
(
Ndef(\x).fadeTime = 9;
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
a.stop;
a.start;


//--tweet0032 drone with ticks WATCH volume
//{Splay.ar({|i|l=LFTri.ar(1/6,i/1.5,2.5,3.5).round;SinOsc.ar(142.857*l,lag(l,i-3/6),1-poll(0.142857*l,10/6,"\t\t"))}!6)}.play//#SuperCollider
(
Ndef(\z).fadeTime = 3;
c.stop;
c = Task({
    20.do({ arg s;
		Ndef(\z).map(\i, s);
		Ndef(\z, { |i|
			Splay.ar({|i|l=LFTri.ar(1/6,i/1.5,2.5,3.5).round;
				SinOsc.ar(142.857*l,lag(l,i-3/6),1-poll(0.142857*l,10/6,"\t\t"))}!6)});
		9.wait;
  });
});
c.start;
Ndef(\z).play;
)
c.stop;
c.start;

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
