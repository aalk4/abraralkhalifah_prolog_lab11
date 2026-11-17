
:- dynamic letter/1.

% Initial set of letters
letter(a).
letter(b).
letter(c).

% Start the game
start :-
    nl,
    write('Hi, This is the Name Game!'), nl,
    write('You can add, delete, or move letters to create your name.'), nl,
    menu_loop.

menu_loop :-
    display_menu,
    read(Choice),
    perform_action(Choice),
    (Choice = 7 -> true; menu_loop).

% Display the menu
display_menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1 - Display the current set of letters'), nl,
    write('2 - Add a letter'), nl,
    write('3 - Add a letter at the top'), nl,
    write('4 - Add a letter at the bottom'), nl,
    write('5 - Delete a letter'), nl,
    write('6 - Delete all letters'), nl,
    write('7 - Exit'), nl,
    write('Enter your choice: ').

% Option 1: Display letters
perform_action(1) :-
    findall(X, letter(X), Letters),
    write('Current letters: '),
    write(Letters), nl.

% Option 2: Add a letter
perform_action(2) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    write('Letter added.'), nl.

% Option 3: Add a letter at the top
perform_action(3) :-
    write('Enter a letter: '),
    read(X),
    asserta(letter(X)),
    write('Letter added at the top.'), nl.

% Option 4: Add a letter at the bottom
perform_action(4) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    write('Letter added at the bottom.'), nl.

% Option 5: Delete a letter
perform_action(5) :-
    write('Enter the letter to delete: '),
    read(X),
    ( retract(letter(X)) ->
        write('Letter deleted.'), nl
    ;
        write('Letter not found.'), nl
    ).

% Option 6: Delete all letters
perform_action(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl.

% Option 7: Exit
perform_action(7) :-
    write('Goodbye!'), nl.

% Invalid choice
perform_action(_) :-
    write('Invalid choice. Please try again.'), nl.
