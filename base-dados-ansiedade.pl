:- use_module(library(plunit)).

% -------------------------------------------------
% *                BASE DE DADOS ANSIEDADE        *
% -------------------------------------------------

score(not_at_all, 0).
score(several_days, 1).
score(more_than_half_the_days, 2).
score(nearly_every_day, 3).

checkAnsiedadeMinima(SCORE) :-
            SCORE >= 0,
            SCORE =< 4.

checkAnsiedadeSuave(SCORE) :- 
            SCORE >= 5,
            SCORE =< 9.

checkAnsiedadeModerada(SCORE) :-
            SCORE >= 10,
            SCORE =< 14.

checkAnsiedadeSevera(SCORE) :- 
            SCORE >= 15.

ansiedade(FREQUENCIA, SCORE) :- 
            (calcAnsiedade(FREQUENCIA, SCORE), checkAnsiedadeSevera(SCORE), write("\nAnsiedade Severa.\nProcure ajuda médica urgetemente!"), !);
            (calcAnsiedade(FREQUENCIA, SCORE), checkAnsiedadeModerada(SCORE), write("\nAnsiedadde moderada.\nProcure ajuda médica!"), !);
            (calcAnsiedade(FREQUENCIA, SCORE), checkAnsiedadeSuave(SCORE), write("\nAnsiedadde suave.\nÉ recomendado procurar ajuda médica."), !);
            (calcAnsiedade(FREQUENCIA, SCORE), checkAnsiedadeMinima(SCORE), write("\nAnsiedadde mínima ou inexistente.\nSe preferir, procure ajuda médica."), !).

calcAnsiedade([], 0).

calcAnsiedade([FREQUENCIA | R], SCORE) :-
            score(FREQUENCIA, SCORE_AUX),
            calcAnsiedade(R, SCORE_AUX2),
            SCORE is SCORE_AUX2 + SCORE_AUX.

:- begin_tests(ansiedade).

test(t0, SCORE == 4) :- ansiedade([not_at_all, several_days, several_days, not_at_all, several_days, several_days], SCORE).
test(t1, SCORE == 0) :- ansiedade([not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all], SCORE).
test(t2, SCORE == 7) :- ansiedade([several_days, several_days, several_days, several_days, several_days, several_days, several_days], SCORE).
test(t3, SCORE == 14) :- ansiedade([more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days], SCORE).
test(t4, SCORE == 21) :- ansiedade([nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day], SCORE).
test(t5, SCORE == 7) :- ansiedade([several_days, several_days, several_days, several_days, several_days, several_days, several_days], SCORE).

:- end_tests(ansiedade).