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

% Punto 3

viviendaBarata(casa(MCuadrados)):-
    AnioConstruccion < 2005.

viviendaBarata(loft(AnioConstruccion)):-
    AnioConstruccion < 2005.

viviendaBarata(loft(AnioConstruccion)):-
    AnioConstruccion < 2005.
