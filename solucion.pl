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
vivenPropiedadesCopadas(Barrio):-
    viveLocalidad(_, Barrio),
    forall(viveLocalidad(Persona, Barrio), viviendaCopada(Persona)).

viviendaCopada(persona(_, casa(MCuadrados))):-
    MCuadrados > 100.
    
viviendaCopada(persona(_, depto(CantAmbientes, CantBanios))):-
    deptoCopado(CantAmbientes, CantBanios).

deptoCopado(CantAmbientes, _):-
    CantAmbientes > 3.

deptoCopado(_, CantBanios):-
    CantBanios > 1.

viviendaCopada(persona(_, loft(AnioConstruccion))):-
    AnioConstruccion > 2015.
