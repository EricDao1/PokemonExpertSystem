%-- Eric Dao & Riverz Flores

begin :- write('Welcome to the Expert System about Pokemons!'),
    nl, write('I am going to ask questions about Pokemon features from generation 1 and 2!!'),
    nl, write('Please answer yes. or no.'),
    nl, write('Ready?'),
    nl, read(yes) -> pokemon(A), write(A); write('Pikachu says bye.'), nl, halt(0).


:- dynamic yes/1.
:- dynamic no/1.


is_true_verify(Verify) :-
    undo,
    format('~w?~n', [Verify]),
    read(Answer),
    (Answer == yes -> write('Im a pokemon master!'), fail;
    Answer == no -> write('Looks like you didnt say yes. I have to do more Pokemon research..')),
    nl, write('Pikachus says if you want to try again.'),
    nl, write('To try again type begin. or type no. to exit.'),
    nl, read(begin) -> begin; write('Pikachu says bye.'), nl, halt(0).

verify(Question) :- (yes(Question) -> true;
    (no(Question) -> false;
    is_true(Question))).


is_true(Question) :-
    pokemon(Question) -> true ; ((format('~w?~n', [Question]), read(Answer),
    (Answer == yes -> assert(yes(Question)); Answer == no -> assert(no(Question)), false;
    write('Pikachu says only answers of yes. or no. Goodbye.'), nl, halt(0)))).


pokemon(ditto) :- verify('is it made up of slime'), verify('is it normal type'), is_true_verify('Is your pokemon ditto?').
pokemon(muk) :- verify('is it made up of slime'), verify('is it poison type'), is_true_verify('Is your pokemon muk?').
pokemon(slugma) :- verify('is it made up of slime'), verify('is it fire type'), is_true_verify('Is your pokemon slugma?').
pokemon(dragonite) :- verify('does it have wings'), verify('is it flying type'), verify('is it dragon type'), is_true_verify('Is your pokemon dragonite?').
pokemon(charizard) :- verify('does it have wings'), verify('is it flying type'), verify('is it fire type'), is_true_verify('Is your pokemon charizard?').

pokemon(rhydon) :- verify('is it rock type'), verify('does it have arms'), verify('does it have legs'), is_true_verify('Is your pokemon rhydon?').
pokemon(geodude) :- verify('is it rock type'), verify('does it have arms'), is_true_verify('Is your pokemon geodude?').
pokemon(onix) :- verify('is it rock type'), is_true_verify('Is your pokemon onix?').

pokemon(zapdos) :- verify('is it legendary'), verify('is it flying type'), verify('is it electric type'), is_true_verify('Is your pokemon zapdos?').
pokemon(articuno) :- verify('is it legendary'), verify('is it flying type'), verify('is it ice type'), is_true_verify('Is your pokemon articuno?').
pokemon(moltres) :- verify('is it legendary'), verify('is it flying type'), verify('is it fire type'), is_true_verify('Is your pokemon moltres?').

pokemon(suicune) :- verify('is it legendary'), verify('is it water type'), is_true_verify('Is your pokemon suicune?').
pokemon(raikou) :- verify('is it legendary'), verify('is it electric type'), is_true_verify('Is your pokemon raikou?').
pokemon(entei) :- verify('is it legendary'), verify('is it fire type'), is_true_verify('Is your pokemon entei?').

pokemon(slowpoke) :- verify('is it lazy'), verify('is it water/psychic type'), is_true_verify('Is your pokemon slowpoke?').
pokemon(snorlax) :- verify('is it lazy'), verify('is it normal type and blue'), is_true_verify('Is your pokemon snorlax?').
pokemon(slaking) :- verify('is it lazy'), verify('is it normal type and brown'), is_true_verify('Is your pokemon slaking?').

pokemon(none) :- write('Looks like I have to do more Pokemon research..'),
    nl, write('To try again type begin.'),
    read(begin) -> undo, begin; halt(0).


undo :- retract(yes(_)), false.
undo :- retract(no(_)), false.
undo.
