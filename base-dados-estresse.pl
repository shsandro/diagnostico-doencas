:- use_module(library(plunit)).

% -------------------------------------------------
% *                BASE DE DADOS ESTRESSE         *
% -------------------------------------------------

score(never, 0).
score(almost_never, 1).
score(sometimes, 2).
score(fairly_often, 3).
score(very_often, 4).

checkEstresseAlto(SCORE) :- 
            SCORE >= 27,
            SCORE =< 40.

checkEstresseModerado(SCORE) :- 
            SCORE >= 14,
            SCORE =< 26.

checkEstresseBaixo(SCORE) :- 
            SCORE >= 0,
            SCORE =< 13.

estresse(FREQUENCIA, SCORE) :- 
            (estresseAlto(FREQUENCIA, SCORE), checkEstresseAlto(SCORE), write("Estresse alto.\n"), !);
            (estresseModerado(FREQUENCIA, SCORE), checkEstresseModerado(SCORE), write("Estresse moderado.\n"), !);
            (estresseBaixo(FREQUENCIA, SCORE), checkEstresseBaixo(SCORE), write("Estresse baixo.\n"), !).

estresseAlto([], 0).

estresseAlto([FREQUENCIA | R], SCORE) :-
            score(FREQUENCIA, SCORE_AUX),
            estresseAlto(R, SCORE_AUX2),
            SCORE is SCORE_AUX2 + SCORE_AUX.

estresseModerado([], 0).

estresseModerado([FREQUENCIA|R], SCORE) :-
            score(FREQUENCIA, SCORE_AUX),
            estresseModerado(R, SCORE_AUX2),
            SCORE is SCORE_AUX2 + SCORE_AUX.

estresseBaixo([], 0).

estresseBaixo([FREQUENCIA|R], SCORE) :-
            score(FREQUENCIA, SCORE_AUX),
            estresseBaixo(R, SCORE_AUX2),
            SCORE is SCORE_AUX2 + SCORE_AUX.

:- begin_tests(estresse).

test(t0, SCORE == 6) :- estresse([never, almost_never, almost_never, never, sometimes, sometimes, never, never, never, never], SCORE).
test(t1, SCORE == 0) :- estresse([never, never, never, never, never, never, never, never, never, never], SCORE).
test(t2, SCORE == 10) :- estresse([almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never], SCORE).
test(t3, SCORE == 40) :- estresse([very_often, very_often, very_often, very_often, very_often, very_often, very_often, very_often, very_often, very_often], SCORE).
test(t4, SCORE == 30) :- estresse([fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often], SCORE).
test(t5, SCORE == 20) :- estresse([sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes], SCORE).

:- end_tests(estresse).