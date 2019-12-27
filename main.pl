teste(1) :-
            consult('estresse'),
            consult('base-dados-estresse'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            estresse(L, SCORE).

questionario() :-
            writeln('Qual teste deseja realizar?'),
            writeln('1 - Estresse          2 - Depressão          3 - Ansiedade'),
            read(Teste),
            teste(Teste).