% 2018CSC1054 Jasleen kaur
% prime_factors(N, Fact) :- Fact contains prime factors of N.

prime_factors(N,Fact) :- N > 0,  prime_factors(N,Fact,2).

% prime_factors(N,Fact,K) :- N is not having and prime factors greater
% than k

prime_factors(1,[],_) :- !.
prime_factors(N,[J|Fact],J) :-                           % N is multiple of F
   R is N // J, N =:= R * J, !, prime_factors(R,Fact,J).
prime_factors(N,Fact,J) :-
   next_factor(N,J,NJ), prime_factors(N,Fact,NJ).        % N is not multiple of F


% next_factor(J,F,NJ) :- when calculating the prime factors of N
%    and if F does not divide N then NF is the next larger candidate to
%    be a factor of N.

next_factor(_,2,3) :- !.
next_factor(N,J,NJ) :- J * J < N, !, NJ is J + 2.
next_factor(N,_,N).


