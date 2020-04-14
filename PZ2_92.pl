max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max3(X,Y,Z,X):-X>Y,X>Z,!.
max3(_,Y,Z,Y):-Y>Z,!.
max3(_,_,Z,Z).
maxD(X,Y,Z,U):-max(Y,Z,K),max(X,K,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1), X is X1*N.

fact1(N,X):-fact2(0,1,N,X).
fact2(N,K,N,K):-!.
fact2(I,K,N,X):-I1 is I+1,K1 is K*I1,fact2(I1,K1,N,X).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1, fib(N1,X1), N2 is N-2, fib(N2,X2), X is X1+X2.

fib1(N,X):-fib2(1,1,2,N,X).
fib2(_,K,N,N,K):-!.
fib2(J,K,I,N,X):- I1 is I+1, K1 is J+K, fib2(K,K1,I1,N,X).

pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):- Y is X mod I,not(Y=0),I1 is I+1,pr1(I1,X).

npr_d(N,X):-ndp(N,N,X).
ndp(I,N,I):- Y is N mod I,Y=0,pr(I),!.
ndp(I,N,X):- I1 is I-1,ndp(I1,N,X).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

pr5_1:-
	read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
	write_str(A),write(', '),write(N).

pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).
count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]):-!.
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).



