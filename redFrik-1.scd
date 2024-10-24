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

// IN PROG
//--tweet0023 nice drip dropping and bloops
//play{Splay.ar({|i|f=i+5*99;RHPF.ar(Ringz.ar(Ball.ar(Saw.ar(i+1)>0,SinOsc.kr(0.1,0,1/5,0.3),0.05,0.02)/99,f,0.05),f,0.1)}!5)}//#SuperCollider

(
Ndef(\x).fadeTime = 5;
Ndef(\x, {Splay.ar({|i|f=i+5*99;RHPF.ar(Ringz.ar(Ball.ar(Saw.ar(i+1)>0,SinOsc.kr(0.1,0,1/5,0.3),0.05,0.02)/99,f,0.05),f,0.1)}!5)} );
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
Ndef(\x).fadeTime = 15;
a = Task({
    1.do({ arg i;
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
Ndef(\y).fadeTime = 15;
b = Task({
   3.do({ arg i;
        Ndef(\y).map(\i, i);
		Ndef(\y, { x={ Pan2.ar(BPF.ar(Impulse.ar(18.linrand+0.5),9999.linrand,0.3.linrand,5)*3.0,1.0.rand2)}} );
		3.wait;
		x.release(9);
    });
});
b.start;
Ndef(\y).play;
)
//--tweet0003 metalic whips and blips
//r{loop{x=play{t=SinOsc.ar(999.rand).abs;Formlet.ar(TDuty.ar(t,0,t),4e3.linrand,t,1-t)!2};wait(9.rand+1);x.release(39)}}.play//#SuperCollider
(
Ndef(\x).fadeTime = 15;
a.stop;
a = Task({
    19.do({ arg i;
        Ndef(\x).map(\i, i);
		Ndef(\x, x = { t=SinOsc.ar(999.rand).abs;Formlet.ar(TDuty.ar(t,0,t),4e3.linrand,t,1-t) ! 2} );
        wait(9.rand+1);

		Ndef(\x).fadeTime = 9.rand+1;
		//Ndef(\z).fadeTime = [5,15,30].choose;
    });
});
a.start;
Ndef(\x).play;
)
//--tweet0005 light ringing soundscape
//r{loop{z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}.play(s,0,z);wait(z/3);x.release}}.play//#SuperCollider
(
b.stop;
Ndef(\y).fadeTime = 15;
b = Task({
    20.do({ arg i;
        Ndef(\y).map(\s, i);
		Ndef(\y, { z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}} );
		Ndef(\y).fadeTime = 60.rand+1/3;
    });
});
b.start;
Ndef(\y).play;
)
//--tweet0006 Blows up in original with reverb. works well with 0005
//r{loop{x={	MoogFF.ar(ClipNoise.ar*0.4,LFPar.kr({0.3.rand}!2,0,600,990))}.play(s,0,19);1.wait;x.release}}.play//#SuperCollider
(
a.stop;
Ndef(\x).fadeTime = 15;
a = Task({
    20.do({ arg i;
        Ndef(\x).map(\s, i);
		Ndef(\x, { MoogFF.ar(ClipNoise.ar*0.4,LFPar.kr({0.3.rand}!2,0,600,990))} );
        1.wait;
    });
});
a.start;
Ndef(\x).play;
)


// THESE ALSO in 7
//--tweet0004 whirring soundscape 4 & 5
//r{loop{ z=20.rand+6;x={y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}.play(s,0,z);wait(26-z);x.release}}.play//#SuperCollider
// this one needs another def to start.
(
Ndef(\y).fadeTime = 15;
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


//--tweet0007 nice room plucked instrument with strums and nice growing druming.
//r{loop{x={BPF.ar(Pluck.ar(Crackle.ar([1.9,1.8]),Impulse.ar(5.rand+1),0.05,0.05.linrand),1200.rand)}.play(s,0,9);wait(9);x.release(69)}}.play
(
Ndef(\x).fadeTime = 15;
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
    1.do({ arg i;
		Ndef(\x, {
			a=Saw; GVerb.ar(
				Splay.ar(BBandPass.ar(a.ar("sunday".ascii),a.ar(9/"slow".ascii)*400+500,a.ar(7/"coding".ascii)+1.1)/5))});
  });
});
a.start;
Ndef(\x).play;
)


