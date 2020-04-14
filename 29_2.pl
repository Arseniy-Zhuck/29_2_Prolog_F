
:-dynamic man/1.

:-dynamic woman/1.
:-dynamic prostoe/1.

/*man(dimitriy).*/
man(jack).
man(kolya).
man(petya).
woman(zoya).
woman(anna).
woman(alisa).
woman(aleksa).
woman(sveta).
dite(dimitriy, anatoliy).
dite(dimitriy, zoya).
dite(anna, anatoliy).
dite(anna, zoya).
dite(kolya, dimitriy).
dite(kolya, sveta).
dite(petya, dimitriy).
dite(petya, sveta).
dite(alisa, anna).
dite(alisa, jack).
dite(aleksa, anna).
dite(aleksa, jack).

sin(X,Y):-dite(X,Y),man(X).
doch(X,Y):-dite(X,Y),woman(X).
brak(X,Y):-dite(AIST,X),!,dite(AIST,Y),not(X=Y).
bro(X,Y):-dite(X,AIST),!,dite(Y,AIST),not(X=Y),man(Y).
sis(X,Y):-dite(X,AIST),!,dite(Y,AIST),not(X=Y),woman(Y).
br_s(X,Y):-bro(X,Y),!.
br_s(X,Y):-sis(X,Y).
prostoe(3).
prostoe(5).

pros(X):-prostoe(X),!.
pros(X):-pr(X),asserta(prostoe(X)).
pr(2):-!.
pr(X):-prostoe(I),Y is X mod I,not(Y=0),fail.
pr(X).


p3_2(A,N):-p3_2(A,2,0,N).
p3_2(A,A,N,N):-!.
p3_2(A,I,K,N):-prprd(I,PPD),I=PPD,!,K1 is K+1, I1 is I+1, p3_2(A,I1,K1,N).
p3_2(A,I,K,N):-I1 is I+1, p3_2(A,I1,K,N).

prprd(I,PPD):-prprd(I,2,1,PPD).
prprd(I,K,PPD,PPD):-I1 is I+1,I1=K,!.
prprd(I,K,P,PPD):-Y is I mod K,Y=0,pr(K),P1 is P*K, K1 is K+1, prprd(I,K1,P1,PPD),!.
prprd(I,K,P,PPD):-K1 is K+1,prprd(I,K1,P,PPD).

nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-R is A mod B,nod(B,R,C).

euler(A,N):-euhu(A,2,1,N).
euhu(A,A,N,N):-!.
euhu(A,I,K,N):-nod(A,I,1),!,I1 is I+1, K1 is K+1,euhu(A,I1,K1,N).
euhu(A,I,K,N):-I1 is I+1,euhu(A,I1,K,N).

p2_3(A,N):-p2_3(A,0,N).
p2_3([],N,N):-!.
p2_3([H|T],K,N):-H<10,K1 is K+H,p2_3(T,K1,N),!.
p2_3([_|T],K,N):-p2_3(T,K,N).







