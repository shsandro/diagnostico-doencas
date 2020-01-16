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
            SCORE >= 27.

checkEstresseModerado(SCORE) :- 
            SCORE >= 14,
            SCORE =< 26.

checkEstresseBaixo(SCORE) :- 
            SCORE >= 0,
            SCORE =< 13.

estresse(FREQUENCIA, SCORE) :- 
            (calcEstresse(FREQUENCIA, SCORE), checkEstresseAlto(SCORE), write("\nVocê possui Estresse alto.\nProcure uma ajuda médica!"), !);
            (calcEstresse(FREQUENCIA, SCORE), checkEstresseModerado(SCORE), write("\nEstresse moderado.\nÉ indicado procurar ajuda médica."), !);
            (calcEstresse(FREQUENCIA, SCORE), checkEstresseBaixo(SCORE), write("\nEstresse baixo.\nSe preferir, procure ajuda médica."), !).

calcEstresse([], 0).

calcEstresse([FREQUENCIA | R], SCORE) :-
            score(FREQUENCIA, SCORE_AUX),
            calcEstresse(R, SCORE_AUX2),
            SCORE is SCORE_AUX2 + SCORE_AUX.

:- begin_tests(estresse).

test(t0, SCORE == 6) :- estresse([never, almost_never, almost_never, never, sometimes, sometimes, never, never, never, never], SCORE).
test(t1, SCORE == 0) :- estresse([never, never, never, never, never, never, never, never, never, never], SCORE).
test(t2, SCORE == 10) :- estresse([almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never, almost_never], SCORE).
test(t3, SCORE == 40) :- estresse([very_often, very_often, very_often, very_often, very_often, very_often, very_often, very_often, very_often, very_often], SCORE).
test(t4, SCORE == 30) :- estresse([fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often, fairly_often], SCORE).
test(t5, SCORE == 20) :- estresse([sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes, sometimes], SCORE).

:- end_tests(estresse).