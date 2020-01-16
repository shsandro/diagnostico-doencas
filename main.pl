:- initialization(questionario()).

clear_screen :- write('\e[H\e[2J').

teste(0) :- halt.

teste(1) :-
            consult('estresse'),
            consult('base-dados-estresse'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            estresse(L, _SCORE),
            unload_file('estresse'),
            unload_file('base-dados-estresse'),
            writeln('\n\nDigite qualquer tecla para prosseguir:'),
            get_single_char(_),
            get_single_char(_),
            clear_screen.

teste(2) :-
            consult('depressao'),
            consult('base-dados-depressao'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            depressao(L, _SCORE),
            unload_file('depressao'),
            unload_file('base-dados-depressao'),
            writeln('\n\nDigite qualquer tecla para prosseguir:'),
            get_single_char(_),
            get_single_char(_),
            clear_screen.

teste(3) :-
            consult('ansiedade'),
            consult('base-dados-ansiedade'),
            perguntas(),
            getLines(L, 'respostas.txt'),
            ansiedade(L, _SCORE),
            unload_file('ansiedade'),
            unload_file('base-dados-ansiedade'),
            writeln('\n\nDigite qualquer tecla para prosseguir:'),
            get_single_char(_),
            get_single_char(_),
            clear_screen.

tutorial() :-
            writeln('\nA seguir você selecionará o questionário que deseja realizar. Sempre que houver na tela "|:", digite um dos valores pedidos, em seguida digite "." e pressione enter para continuar.'),
            writeln('Para as perguntas dos questionários, também digite a resposta seguida de ".".'),
            writeln('\nDigite qualquer tecla para prosseguir:'),
            get_single_char(_),
            clear_screen.

questionario() :-
            writeln('Bem-vindo!'),
            writeln('\nDe acordo com a Organização mundial da Saúde, saúde mental é um bem estar no qual o indivíduo é capaz de usar suas próprias habilidades, recuperar-se do estresse rotineiro, ser produtivo e contribuir com sua comunidade.\n'),
            writeln('Este programa busca oferecer testes para Estresse, Depressão e Ansiedade, e ajudar o usuário a descobrir se possui algum nível desses distúrbios mentais citados.'),
            tutorial(),
            writeln('Qual teste deseja realizar?\n'),
            writeln('1 - Estresse          2 - Depressão          3 - Ansiedade'),
            writeln('(Digite 0 para encerrar o programa)'),
            read(Teste),
            clear_screen,
            teste(Teste),
            questionario().