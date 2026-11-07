
:- dynamic letter/1.

% The starting set of letters
letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    choice(Choice).

% 1 - display all letters (fail loop, like print_countries)
choice(1) :-
    display_letters,
    menu.

% 2 - add a letter (assert)
choice(2) :-
    write('Enter the letter: '), read(L),
    assert(letter(L)),
    write('The letter has been added'), nl,
    menu.

% 3 - add a letter at the top (asserta)
choice(3) :-
    write('Enter the letter: '), read(L),
    asserta(letter(L)),
    write('The letter has been added at the top'), nl,
    menu.

% 4 - add a letter at the bottom (assertz)
choice(4) :-
    write('Enter the letter: '), read(L),
    assertz(letter(L)),
    write('The letter has been added at the bottom'), nl,
    menu.

% 5 - delete a letter (retract)
choice(5) :-
    write('Enter the letter to delete: '), read(L),
    delete_letter(L),
    menu.

% 6 - delete all letters (retractall)
choice(6) :-
    retractall(letter(_)),
    write('All letters have been deleted'), nl,
    menu.

% 7 - exit
choice(7) :-
    write('Goodbye'), nl.

% Print every letter: letter(X) finds one, fail makes Prolog try the next
display_letters :-
    letter(X),
    write(X), write(' '),
    fail.
display_letters :-
    nl.

% retract removes the first match; if the letter is not there it fails
delete_letter(L) :-
    letter(L),
    retract(letter(L)),
    write('The letter has been deleted'), nl.
delete_letter(L) :-
    not(letter(L)),
    write('This letter is not in the set'), nl.
