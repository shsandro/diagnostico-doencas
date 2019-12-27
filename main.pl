:- initialization(questionario()).

teste(0) :- halt.

teste(1) :-
            consult('estresse'),
            consult('base-dados-estresse'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            estresse(L, _SCORE).

teste(2) :-
            consult('depressao'),
            consult('base-dados-depressao'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            depressao(L, _SCORE).

teste(3) :-
            consult('ansiedade'),
            consult('base-dados-ansiedade'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            ansiedade(L, _SCORE).

questionario() :-
            writeln('Qual teste deseja realizar?'),
            writeln('1 - Estresse          2 - Depressão          3 - Ansiedade'),
            writeln('(Digite 0 para encerrar o programa)'),
            read(Teste),
            teste(Teste),
            questionario().