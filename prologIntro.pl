%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiele für Fakten mit einem Argument (1 stellige Fakten)
%
% - weiblich(...), maennlich(...) sind Prädikate.
% - elke, inga, ..., thomas, helge sind Atome
% - Alle Argumente von Prädikaten, die mit einem Kleinbuchstaben beginnen
%   sind ein Atom.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
weiblich(anja).
weiblich(elke).
weiblich(inga).
weiblich(senta).

maennlich(helge).
maennlich(matthias).
maennlich(rudolf).
maennlich(thomas).
maennlich(tim).
maennlich(volker).
























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiele für Fakten mit zwei Argumenten (2 stellige Fakten)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mutter(anja,elke).      % anja ist 'mutter' von elke
mutter(elke,rita).
mutter(inga,matthias).
mutter(inga,thomas).
mutter(senta,inga).
mutter(senta,rudolf).

vater(helge,tim).       % helge ist 'vater' von tim
vater(rudolf,elke).
vater(tim,inga).
vater(tim,rudolf).
vater(volker,matthias).
vater(volker,thomas).























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiele für Regeln
%
% - Kind, Elter sind Variablen
% - Alle Argumente von Prädikaten, die mit einem Großbuchstaben beginnen
%   sind eine Variable.
% - Der Name einer Variablen ist nicht von Bedeutung für Prolog, Kind könnte
%   auch X heißen und Elter Z. Für ein besseres Verständnis sind aber sprechende
%   Namen sinnvoll.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elternteil(Elter, Kind) :-      % Elter ist 'elternteil' von Kind, wenn
    mutter(Elter, Kind).        % Elter 'mutter' von Kind ist
                                % 
elternteil(Elter, Kind) :-      % Elter ist 'elternteil' von Kind, wenn
    vater(Elter, Kind).         % Elter 'vater' von Kind ist

























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiele für eine Regel, die mehrere Prädikate im Rumpf hat
%
% - Das , entspricht einem Und, d.h. die Regel ist wahr, wenn alle Prädikaten
%   im Rumpf wahr sind.
%
% - Prolog erlaubt weitere Verknüpfungen im Rumpf, z.b. das Oder (;).
%   Im Rahmen der Veranstaltung ist jedoch _nur_ das Und (,) erlaubt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
geschwister(Kind1, Kind2) :-    % Kind1 und Kind2 sind 'geschwister', wenn
    elternteil(Elter, Kind1),   % Elter ein 'elternteil' von Kind1 ist UND
    elternteil(Elter, Kind2),   % Elter ein 'elternteil' von Kind2 ist UND
    Kind1\=Kind2.               % Kind1 und Kind2 verschieden sind
                                %
                                % Achtung, '\=' ist ein built-in




















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiele für eine rekursive Regel
%
% - Es ist ratsam (in manchen Fällen sogar notwendig), die nicht-rekursiven
%   Instanzen der Regel _vor_ der rekursiven Instanz zu definieren.
% - Auch im Rumpf sollte im Allgemeinen der rekursive Aufruf hinten stehen.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nachkomme(Nkomme, Vfahre) :-          % Nkomme ist 'nachkomme' von Vfahre, wenn
    elternteil(Vfahre, Nkomme).       % Vfahre 'elternteil' von Nkomme ist
                                      % 
nachkomme(Nkomme, Vfahre) :-          % Nkomme ist 'nachkomme' von Vfahren, wenn
    elternteil(Elter, Nkomme),        % Elter 'elternteil' von Nkomme ist UND
    nachkomme(Elter, Vfahre).         % Elter 'nachkomme' von Vfahre ist
























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiel dafür, dass man einige Prädikate einfach realisieren kann, wenn man
% bereits vorhandene Prädikate in einer anderen Art nutzt als sie eigentlich
% vorgesehen waren.
%
% (Durch vertauschen der Argumente, kann man mit 'nachkomme' die Vorfahren 
% bestimmen)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vorfahre(Vfahre, Nkomme) :-         % Vfahre ist 'vorfahre' von Nkomme, wenn
    nachkomme(Nkomme, Vfahre).      % Nkomme 'nachkomme' von Vfahre ist

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mehr Information beim Aufruf von Prolog bekommen durch den trace-mode.
% Anschalten durch Anfrage 'trace.'
% Ausschalten durch Anfrage 'nodebug.'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Einige weitere Regeln
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tante(Tante, Kind) :-
    weiblich(Tante),
    elternteil(Elter, Kind),
    geschwister(Elter, Tante).

onkel(Kind, Onkel) :-
    maennlich(Onkel),
    elternteil(Elter, Kind),
    geschwister(Elter, Onkel).

cousine(Kind1, Kind2) :-
    weiblich(Kind2),
    mutter(Tante, Kind2),
    tante(Tante, Kind1).

cousine(Kind1, Kind2) :-
    weiblich(Kind2),
    vater(Onkel, Kind2),
    onkel(Onkel, Kind1).

cousin(Kind1, Kind2) :-
    maennlich(Kind2),
    mutter(Tante, Kind2),
    tante(Tante, Kind1).

cousin(Kind1, Kind2) :-
    maennlich(Kind2),
    vater(Onkel, Kind2),
    onkel(Onkel, Kind1).
