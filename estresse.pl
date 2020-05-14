:- [util].

escreveResposta(0, Out) :- 
            writeln(Out, "'never'.").

escreveResposta(1, Out) :- 
            writeln(Out, "'almost_never'.").

escreveResposta(2, Out) :- 
            writeln(Out, "'sometimes'.").

escreveResposta(3, Out) :- 
            writeln(Out, "'fairly_often'.").

escreveResposta(4, Out) :- 
            writeln(Out, "'very_often'.").

exibePerguntas([], _Out).

exibePerguntas([L | R], Out) :-
            writeln(L),
            read(Resposta),
            escreveResposta(Resposta, Out),
            exibePerguntas(R, Out).

perguntas() :-
            writeln('\nPara cada pergunta escolha uma das possíveis alternativas:'),
            writeln('0 - nunca        1 - quase nunca        2 - às vezes          3 - com frequência          4 - com muita frequência\n'),
            writeln('Responda 0, 1, 2, 3 ou 4 para as próximas perguntas.\n'),
            getLines(L, 'perguntas-estresse.txt'),
            open('respostas.txt', write, Out),
            exibePerguntas(L, Out),
            close(Out).