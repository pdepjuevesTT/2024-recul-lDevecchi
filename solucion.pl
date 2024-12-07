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
valorCasa(fer,    60000).
valorCasa(alf,    75000).
valorCasa(nico,   80000).
valorCasa(vale,   95000).
valorCasa(julian, 140000).
valorCasa(juan,   150000).

queCasasCompra(PlataInicial, PlataRestante, ListaCasasCompradas):-
    PlataRestante is PlataInicial, % inicializo plataRestante
    obtenerListaCasasPrecios(PlataInicial, ListaCasasParaComprar), % Obtengo lista de casas con precios.
    comprarCasa(PlataRestante, ListaCasasParaComprar, ListaCasasCompradas), % Agrego casa a la lista, y actualizo dinero
    forall(siguiente(_, _, ListaCasasParaComprar), comprarCasa(PlataRestante, ListaCasasParaComprar, ListaCasasCompradas)).

obtenerListaCasasPrecios(PlataInicial, ListaPrecios):-
    findall(valorCasa(Persona, Precio), (valorCasa(Persona, Precio), Precio =< PlataInicial), ListaPrecios).

comprarCasa(PlataRestante, ListaCasasParaComprar, ListaCasasCompradas):-
    siguiente(CasaActual, _, ListaCasasParaComprar),
    tieneDineroSuficiente(PlataRestante, CasaActual),
    comprarCasa(PlataRestante, ListaCasasParaComprar, ListaCasasCompradas),
    pagarEIncluirCasa(PlataRestante, CasaActual, ListaCasasCompradas).

pagarEIncluirCasa(PlataRestante, CasaActual, ListaCasasCompradas):-
    PlataRestante is PlataRestante - CasaActual, 
    nth0(0, ListaCasasCompradas, CasaActual).

tieneDineroSuficiente(PlataRestante, PrecioCasaActual):-
    PlataRestante >= PrecioCasaActual.

siguiente(Anterior, Siguiente, Lista):-
    nth1(IndiceAnterior, Lista, Anterior),
    IndiceSiguiente is IndiceAnterior + 1,
    nth1(IndiceSiguiente, Lista, Siguiente).
