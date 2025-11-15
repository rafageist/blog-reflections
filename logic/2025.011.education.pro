/* ============================================================
   Reflections — Núcleo lógico en Prolog
   Tema: Aprender, estudiar, comprender, educar vs adoctrinar
   Autor: (tu nombre)
   Descripción:
     Este módulo modela, en lógica de predicados, las
     distinciones conceptuales y relaciones principales
     del artículo.
   ============================================================ */

/* ---------- Conceptos básicos (ontología mínima) ---------- */

concepto(aprender).
concepto(estudiar).
concepto(comprender).
concepto(memorizar).
concepto(educar).
concepto(educarse).
concepto(adoctrinar).
concepto(saber).

/* Tipos semánticos (rol del concepto) */
resultado(aprender).
resultado(saber).

proceso(estudiar).
proceso(memorizar).
proceso(educar).
proceso(educarse).
proceso(adoctrinar).

profundidad(comprender).      % Comprender agrega profundidad/estructura

/* Propiedades semánticas simplificadas */
implica_autonomia(aprender).
implica_autonomia(educarse).
puede_implicar_autonomia(educar).

orientado_a_pensar(educar).
orientado_a_obedecer(adoctrinar).

/* ---------- Relaciones principales del artículo ---------- */

/* 1) Estudiar es (potencialmente) un medio hacia aprender */
medio_para(estudiar, aprender).

/* 2) Memorizar es una técnica (subconjunto) dentro de estudiar */
subproceso(memorizar, estudiar).

/* 3) Aprender y estudiar no son opuestos ni equivalentes */
no_equivalente(aprender, estudiar).
no_opuesto(aprender, estudiar).

/* 4) Comprender no es idéntico a aprender, pero potencia su calidad */
no_equivalente(comprender, aprender).
potencia(comprender, aprender).

/* 5) Educar no es adoctrinar (son excluyentes en intención) */
no_equivalente(educar, adoctrinar).
excluyente_intencional(educar, adoctrinar).

/* 6) Educar y educarse se complementan */
complementarios(educar, educarse).

/* 7) Saber es un estado posterior/integrado */
posterior_a(saber, aprender).
posterior_a(saber, comprender).
posterior_a(saber, estudiar).   % puede ser posterior si hubo aprendizaje real
posterior_a(saber, educar).     % idem, si hubo formación auténtica

/* ---------- Reglas de inferencia (lectura del artículo) ---------- */

/* Estudiar conduce a aprender si el estudio no se reduce a obediencia
   y hay componentes de comprensión/práctica significativa. */
conduce_a_aprender(estudiar) :-
    \+ reduce_a(estudiar, obediencia),
    ( incluye(estudiar, comprender)
    ; incluye(estudiar, practica_significativa)
    ; incluye(estudiar, dialogo_critico)
    ).

/* Memorizar solo, sin comprender ni práctica con sentido, no garantiza aprender */
conduce_a_aprender(memorizar) :-
    incluye(memorizar, comprender) ; incluye(memorizar, transferencia),
    !.
conduce_a_aprender(memorizar) :- fail.

/* Adoctrinar nunca educa en el sentido fuerte del artículo (pensamiento) */
educa_en_sentido_fuerte(X) :-
    proceso(X),
    orientado_a_pensar(X),
    \+ orientado_a_obedecer(X).

no_educa_en_sentido_fuerte(adoctrinar).

/* Aprender puede ocurrir sin estudio formal (aprendizaje no escolarizado) */
posible_sin_estudio_formal(aprender).

/* Estudiar puede ocurrir sin producir aprendizaje (p. ej., por obediencia/memoria mecánica) */
posible_sin_aprender(estudiar).

/* Comprender aumenta la transferibilidad del aprendizaje */
aumenta_transferencia(comprender).

/* ---------- Hechos auxiliares para razonamiento de ejemplo ---------- */

/* Casos de "reducción a obediencia" (malas prácticas) */
reduce_a(estudiar, obediencia) :- incluye(estudiar, memorizacion_mecanica), \+ incluye(estudiar, comprender).

/* Componentes posibles del buen estudiar */
incluye(estudiar, comprender).
incluye(estudiar, practica_significativa).
incluye(estudiar, dialogo_critico).

/* Posible contenido de memorizar con valor (si se integra) */
incluye(memorizar, comprender) :- fail.  % por defecto, no
incluye(memorizar, transferencia) :- fail.

/* ---------- Reglas de consulta de coherencia conceptual ---------- */

/* ¿X es medio y Y es fin? */
es_medio_y_fin(X,Y) :- medio_para(X,Y), resultado(Y).

/* ¿X y Y están mal equiparados (ni equivalentes ni opuestos)? */
mala_oposicion(X,Y) :-
    concepto(X), concepto(Y),
    no_equivalente(X,Y),
    no_opuesto(X,Y).

/* Un "buen sistema educativo" (idealizado) evita adoctrinar, promueve pensar,
   y reconoce estudiar como medio (no como fin) */
buen_sistema_educativo(Sistema) :-
    Sistema = sistema(guia:educar, evita:adoctrinar, reconoce:estudiar_medio),
    educa_en_sentido_fuerte(educar),
    \+ no_educa_en_sentido_fuerte(educar),
    medio_para(estudiar, aprender).

/* ---------- Ejemplos de consultas (comentarios) ----------

?- es_medio_y_fin(estudiar, aprender).
true.

?- subproceso(memorizar, estudiar).
true.

?- mala_oposicion(aprender, estudiar).
true.

?- conduce_a_aprender(estudiar).
true.   % porque incluye componentes significativos por defecto

?- conduce_a_aprender(memorizar).
false.  % a menos que se explicite que memorizar incluye comprender/transferencia

?- no_equivalente(educar, adoctrinar).
true.

?- educa_en_sentido_fuerte(adoctrinar).
false.

?- posible_sin_estudio_formal(aprender).
true.

?- posible_sin_aprender(estudiar).
true.

?- aumenta_transferencia(comprender).
true.

?- buen_sistema_educativo(S).
S = sistema(guia:educar, evita:adoctrinar, reconoce:estudiar_medio).

---------------------------------------------------------------- */
