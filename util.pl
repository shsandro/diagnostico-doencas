getLines(L, File) :-
  setup_call_cleanup(
    open(File, read, In),
    readData(In, L),
    close(In)
  ).

readData(In, L) :-
  read_term(In, H, []),
  (   H == end_of_file
  ->  L = []
  ;   L = [H|T],
      readData(In,T)
  ).