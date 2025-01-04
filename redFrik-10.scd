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
t.clear;
u.clear;
v.clear;
w.clear;
)
MIDIIn.connectAll;
(

//setup
Ndef.clear;
m = NdefGui.new;
n = NdefGui.new;

m.object_(Ndef(\x));
n.object_(Ndef(\y));
// volume control via midi
i = MIDIFunc.cc( {arg ...args; Ndef(\y).vol_(args[0]/127.0)}, 0); // match cc 0
j = MIDIFunc.cc( {arg ...args; Ndef(\x).vol_(args[0]/127.0)}, 1); // match cc 1
// pause resume via midi
t = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).resume}, {Ndef(\y).pause })} , 48); // match cc 32
u = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).resume}, {Ndef(\x).pause })} , 49); // match cc 1
v = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\y).play}, {Ndef(\y).stop })} , 64); // match cc 32
w = MIDIFunc.cc({arg ...args; if (args[0] > 0, { Ndef(\x).play}, {Ndef(\x).stop })} , 65); // match cc 1
)

//--tweet0084 play with 83
//play{a=Saw;Splay.ar(Formant.ar(a.ar((5,7..15)*19)*77+199,a.ar((1,3..13)*29)*199+299,a.ar((3,5..11)*a.ar(3,2,3))*299+399))/3}//#SuperCollider
(
Ndef(\x).fadeTime = 5;
Ndef(\x, {a=Saw;Splay.ar(Formant.ar(a.ar((5,7..15)*19)*77+199,a.ar((1,3..13)*29)*199+299,a.ar((3,5..11)*a.ar(3,2,3))*299+399))/3} );
)


//--tweet0086 atmospheric windy and ringing, whistle
//play{a=LFNoise2.kr(1/(9..17));Splay.ar(Ringz.ar(BPF.ar(Dust2.ar(a.abs*1e4),a.exprange(99,1e4),1.1-a),(9..1)*99,a+1.1,a)/5)}// #SuperCollider

(
Ndef(\y).fadeTime = 5;
Ndef(\y, {a=LFNoise2.kr(1/(9..17));Splay.ar(Ringz.ar(BPF.ar(Dust2.ar(a.abs*1e4),a.exprange(99,1e4),1.1-a),(9..1)*99,a+1.1,a)/5)});
)

//--tweet0074 laser war coming and receeding
//play{a=Pulse;BLowPass4.ar(a.ar(a.ar(2,0.2,a.ar(3,0.3)*500,[600,606]*a.ar(5))).sin,LFPar.ar(0.07)*4e3+5e3,LFPar.ar(0.1)+1.3)}//#SuperCollider
(
Ndef(\x).fadeTime = 5;
Ndef(\x,{a=Pulse;BLowPass4.ar(a.ar(a.ar(2,0.2,a.ar(3,0.3)*500,[600,606]*a.ar(5))).sin,LFPar.ar(0.07)*4e3+5e3,LFPar.ar(0.1)+1.3)});
Ndef(\x).play;
)
//--tweet0075 uboot on titan.
//play{a=SinOsc;b=(1..16)*8;a.ar(a.ar(b).sum+[2,3]+a.ar(1/8)*99*a.ar(b/(a.ar(1/6)*2+2.05),0,4+a.ar(1/8)).reduce('bitOr'))*0.5}//#SuperCollider

(
Ndef(\y).fadeTime = 5;
Ndef(\y,{a=SinOsc;b=(1..16)*8;a.ar(a.ar(b).sum+[2,3]+a.ar(1/8)*99*a.ar(b/(a.ar(1/6)*2+2.05),0,4+a.ar(1/8)).reduce('bitOr'))*0.5} );
Ndef(\y).play;
)
Ndef(\y).resume;



