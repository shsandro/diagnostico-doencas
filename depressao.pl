:- [util].

escreveResposta(0, Out) :- 
            writeln(Out, "'not_at_all'.").

escreveResposta(1, Out) :- 
            writeln(Out, "'several_days'.").

escreveResposta(2, Out) :- 
            writeln(Out, "'more_than_half_the_days'.").

escreveResposta(3, Out) :- 
            writeln(Out, "'nearly_every_day'.").

exibePerguntas([], _Out).

exibePerguntas([L | R], Out) :-
            writeln(L),
            read(Resposta),
            escreveResposta(Resposta, Out),
            exibePerguntas(R, Out).

perguntas() :-
            writeln('\nPara cada pergunta escolha uma das possíveis alternativas:'),
            writeln('0 - nunca        1 - alguns dias        2 - mais da metade dos dias          3 - quase todo dia\n'),
            writeln('Responda 0, 1, 2 ou 3 para as próximas perguntas.\n'),
            getLines(L, 'perguntas-depressao.txt'),
            open('respostas.txt', write, Out),
            exibePerguntas(L, Out),
            close(Out).