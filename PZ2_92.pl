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
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
					I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]):-!.
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

pr5_3:-	read_str(A,N),get_words(A,Words),uniq_el(Words,Unique_words),
		counts_in_list(Unique_words,Words,Counts),max_in_list(Counts,Ind),
		el_no(Unique_words,Ind,Freq_word),write_str(Freq_word).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

get_words(A,Words):-get_words(A,[],Words).
get_words([],B,B):-!.
get_words(A,Temp_words,B):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	append(Temp_words,[Word],T_w),get_words(A2,T_w,B),!.
get_words(_,B,B).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(El,[],Ref,R):-append(Ref,[El],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_in_list(_,[],0):-!.
count_in_list(EL,[EL|Tail],K):-count_in_list(EL,Tail,K1), K is K1+1,!.
count_in_list(El,[_|Tail],K):-count_in_list(El,Tail,K).

counts_in_list([],_,[]):-!.
counts_in_list([El|T_El],List,[Count|T_Count]):-
		count_in_list(El,List,Count),counts_in_list(T_El,List,T_Count).

max_in_list([H|T],Imax):-max_in_list(T,H,1,2,Imax).
max_in_list([],_,Cur,_,Cur):-!.
max_in_list([H|T],Max,Cur,Ind,Imax):-H>Max,Ind1 is Ind+1,max_in_list(T,H,Ind,Ind1,Imax),!.
max_in_list([_|T],Max,Cur,Ind,Imax):-Ind1 is Ind+1,max_in_list(T,Max,Cur,Ind1,Imax).

el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).


max([H|T], M):-max(T, M, H).
max([], M, M):-!.
max([H|T], M, MI):-H > MI, !, max(T, M, H).
max([_|T], M, MI):-max(T,M, MI).

pr5_6:-	see('c:/Prolog/29_2_Prolog_F/29_1.txt'),
		read_list_str(List,List_len),seen,max(List_len,X),write(X).

build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).
		
b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-	in_list(A,El),N1 is N-1,
					b_a_rp(A,N1,[El|Perm]).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

build_all_perm:-
		read_str(A,N),b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),
				b_a_p(A1,[El|Perm]).
				
				
build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,[],K).

b_a_r(_,Perm1,0):-write_str(Perm1),nl,!,fail.
b_a_r(A,Perm,K):-in_list_exlude(A,El,A1),K1 is K-1,
				b_a_r(A1,[El|Perm],K1).
				
sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

pr_subset:-read_str(A,N),sub_set(B,A),write_str(B),nl,fail.

sub_set_k([],[],0).
sub_set_k([H|Sub_set],[H|Set],K):- K1 is K-1,sub_set_k(Sub_set,Set,K1).
sub_set_k(Sub_set,[H|Set],K):-sub_set_k(Sub_set,Set,K).
pr_subset_k:-read_str(A,N),read(K),sub_set_k(B,A,K),write_str(B),nl,fail.

pr7_7:- List[_,_,_,_],
	( 
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,black]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		((in_list(List,[dima,fantic,_]));(in_list(List,[_,dru,grey])))
	);
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
		
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
		
	);
	(
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	)
	),
	write(List).

/*unique(A, Result):- 
        unique(A, Result, []), !.
unique([],[],_):-!.
unique([H|T], [H|T], Found):-
        not(member(H, Found)),
        unique(T, T, [H|Found]),!.
unique([_|T], Result, Found):-
        unique(T, Result, Found).
*/
append_K(X,0,A,A):-!.
append_K(X,K,A,A1):-K1 is K-1,append_K(X,K1,A,[X|A1]).

expand_list(A,N,K,A1):-expand_list(A,N,K,A1,[]).
expand_list([],0,_,A1,A1):-!.
expand_list([H|T],N,K,A1,B):-N1 is N-1,append_K(H,K,C,[]),append(B,C,B1),expand_list(T,N1,K,A1,B1).

sub_set_p([],[],0).
sub_set_p([H|Sub_set],[H|Set],K):- K1 is K-1,sub_set_p(Sub_set,Set,K1).
sub_set_p(Sub_set,[H|Set],K):-sub_set_p(Sub_set,Set,K).
sochet_pov:-read_str(A,N),read(K),expand_list(A,N,K,A1),sub_set_p(B,A1,K),write_str(B),nl,fail.


