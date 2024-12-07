% Solución en Prolog, alumno: Lucas Nahuel Devecchi Di Bella

% Punto 1
persona(juan, casa(120)).
persona(fer, casa(110)).
persona(nico, depto(3, 2)).
persona(alf, depto(3, 1)).
persona(vale, depto(4,1)).
persona(julian, loft(2000)).

viveLocalidad(alf, almagro).
viveLocalidad(nico, almagro).
viveLocalidad(julian, almagro).

viveLocalidad(vale, flores).
viveLocalidad(fer, flores).

% Punto 2
barrioCopado(Barrio):-
    esBarrio(Barrio),
    forall(viveLocalidad(Persona, Barrio), personaConViviendaCopada(Persona)).

esBarrio(Barrio):-
    viveLocalidad(_, Barrio).

personaConViviendaCopada(Persona):-
    persona(Persona, Vivienda),
    viviendaCopada(Vivienda).

viviendaCopada(casa(MCuadrados)):-
    MCuadrados > 100.
    
viviendaCopada(loft(AnioConstruccion)):-
    AnioConstruccion > 2015.

viviendaCopada(depto(CantAmbientes, CantBanios)):-
    deptoCopado(CantAmbientes, CantBanios).

deptoCopado(CantAmbientes, _):-
    CantAmbientes > 3.

deptoCopado(_, CantBanios):-
    CantBanios > 1.

% Punto 3 Todo: inversible

esCaro(Barrio):-
    esBarrio(Barrio),
    not((viveLocalidad(Persona, Barrio), viveEnViviendaBarata(Persona))).

viveEnViviendaBarata(Persona):-
    persona(Persona, Vivienda),
    viviendaBarata(Vivienda).

viviendaBarata(casa(MCuadrados)):-
    MCuadrados < 90.

viviendaBarata(depto(CantAmbientes, _)):-
    CantAmbientes =< 2. % permite el caso en el que la cantAmbientes es negativa, por lo que puedo hacer un  ",CantAmbientes >= 1", pero entiendo que no es relevante para la resoluciòn del ejercicio.

viviendaBarata(loft(AnioConstruccion)):-
    AnioConstruccion < 2005.

% Punto 4
