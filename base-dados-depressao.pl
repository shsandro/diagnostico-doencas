:- use_module(library(plunit)).

% -------------------------------------------------
% *                BASE DE DADOS DEPRESSÃO        *
% -------------------------------------------------

score(not_at_all, 0).
score(several_days, 1).
score(more_than_half_the_days, 2).
score(nearly_every_day, 3).

checkDepressaoMinima(SCORE) :-
            SCORE >= 0,
            SCORE =< 4.

checkDepressaoSuaveModerada(SCORE) :- 
            SCORE >= 5,
            SCORE =< 14.

checkDepressaoModeradamenteSevera(SCORE) :-
            SCORE >= 15,
            SCORE =< 19.

checkDepressaoSevera(SCORE) :- 
            SCORE >= 20.

depressao(FREQUENCIA, SCORE) :- 
            (calcDepressao(FREQUENCIA, SCORE), checkDepressaoSevera(SCORE), write("\nDepressão Severa.\nProcure ajuda médica urgentemente!"), !);
            (calcDepressao(FREQUENCIA, SCORE), checkDepressaoModeradamenteSevera(SCORE), write("\nDepressão moderadamente severa.\nProcure ajuda médica!"), !);
            (calcDepressao(FREQUENCIA, SCORE), checkDepressaoSuaveModerada(SCORE), write("\nDepressão suave ou moderada.\nÉ recomendado procurar ajuda médica."), !);
            (calcDepressao(FREQUENCIA, SCORE), checkDepressaoMinima(SCORE), write("\nDepressão mínima ou inexistente.\nSe preferir, procure ajuda médica."), !).

calcDepressao([], 0).

calcDepressao([FREQUENCIA | R], SCORE) :-
            score(FREQUENCIA, SCORE_AUX),
            calcDepressao(R, SCORE_AUX2),
            SCORE is SCORE_AUX2 + SCORE_AUX.

:- begin_tests(depressao).

test(t0, SCORE == 4) :- depressao([not_at_all, several_days, several_days, not_at_all, several_days, several_days, not_at_all, not_at_all, not_at_all, not_at_all], SCORE).
test(t1, SCORE == 0) :- depressao([not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all, not_at_all], SCORE).
test(t2, SCORE == 10) :- depressao([several_days, several_days, several_days, several_days, several_days, several_days, several_days, several_days, several_days, several_days], SCORE).
test(t3, SCORE == 20) :- depressao([more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days, more_than_half_the_days], SCORE).
test(t4, SCORE == 30) :- depressao([nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day, nearly_every_day], SCORE).
test(t5, SCORE == 10) :- depressao([several_days, several_days, several_days, several_days, several_days, several_days, several_days, several_days, several_days, several_days], SCORE).

:- end_tests(depressao).