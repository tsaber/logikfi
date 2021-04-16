%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grundlage für Aufgabenblatt 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zahl(eins).
zahl(zwei).
zahl(drei).
zahl(vier).
zahl(fuenf).
zahl(sechs).
zahl(sieben).
zahl(acht).
zahl(neun).
zahl(zehn).


istEinsKleinerAls(eins,zwei).
istEinsKleinerAls(zwei,drei).
istEinsKleinerAls(drei,vier).
istEinsKleinerAls(vier,fuenf).
istEinsKleinerAls(fuenf,sechs).
istEinsKleinerAls(sechs,sieben).
istEinsKleinerAls(sieben,acht).
istEinsKleinerAls(acht,neun).
istEinsKleinerAls(neun,zehn).

istPrim(eins).
istPrim(drei).
istPrim(fuenf).
istPrim(sieben).
istKleinerAls(X,Y):- 
	istEinsKleinerAls(X,Y).

istKleinerAls(X,Y):-
	istEinsKleinerAls(X,Z),
	istKleinerAls(Z,Y).

istGroesserAls(X,Y):-
	istKleinerAls(Y,X).

%istGleich(X,Y):-
%	X=Y.
istGleich(eins,eins).
istGleich(zwei,zwei).
istGleich(drei,drei).
istGleich(vier,vier).
istGleich(fuenf,fuenf).
istGleich(sechs,sechs).
istGleich(sieben,sieben).
istGleich(acht,acht).
istGleich(neun,neun).
istGleich(zehn,zehn).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Antworten für Aufgabe 1.3 a):
%
% I)    
% Anfrage:      zahl(zwei).
% Antwort(en): true
% 
% II)   
% Anfrage:      zahl(vier).
% Antwort(en): true 
% 
% III)  
% Anfrage:      zahl(zwoelf).
% Antwort(en): false.
% 
% IV)   
% Anfrage:      istEinsKleinerAls(fuenf,sechs).
% Antwort(en): true.
%
% V)   
% Anfrage:      istEinsKleinerAls(fuenf,vier).
% Antwort(en): false.
% 
% IV)   
% Anfrage:      istEinsKleinerAls(fuenf,X).
% Antwort(en): X = sechs.
% 
% VII)   
% Anfrage:      istEinsKleinerAls(X,fuenf).
% Antwort(en): X = vier.
% 
% VIII)   
% Anfrage:      istEinsKleinerAls(X,Y).
% Antwort(en): 
% X = eins,
% Y = zwei;
% X = zwei,
% Y = drei ;
% X = drei,
% Y = vier ;
% X = vier,
% Y = fuenf ;
% X = fuenf,
% Y = sechs ;
% X = sechs,
% Y = sieben ;
% X = sieben,
% Y = acht ;
% X = acht,
% Y = neun ;
% X = neun,
% Y = zehn.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
