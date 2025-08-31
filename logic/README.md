# Logic Models for Reflections Blog

This folder contains **Prolog knowledge bases** created as companions to essays published on the [Reflections](../wiki) blog.  
Each `.pl` file encodes the main ideas of an article in **predicate logic**, allowing you to explore the concepts through queries.

## File Naming Convention
Files follow the pattern:

`YEAR.SEQ.TOPIC.pl`


- **YEAR** – year of publication (e.g., 2025)  
- **SEQ** – sequential or monthly identifier (e.g., 011)  
- **TOPIC** – short keyword for the article’s theme (e.g., `education`)  

Example:  
`2025.011.education.pl` → Logic model for the article *“Aprender, estudiar, educar: la importancia de no confundir conceptos”*.

## How to Use

1. Install [SWI-Prolog](https://www.swi-prolog.org/).  
2. Clone or download this repository.  
3. Open a terminal in the `/logic` folder.  
4. Load a file into Prolog:

```prolog
swipl
?- [2025.011.education].
```

5. Run queries, for example:

```prolog
 ?- es_medio_y_fin(estudiar, aprender).
 true.
 
 ?- no_equivalente(educar, adoctrinar).
 true.
```

## Purpose

These files are not full applications but conceptual models.
They translate philosophical or educational reflections into predicate logic to:

- Make distinctions explicit
- Allow logical queries about concepts
- Bridge abstract thought with formal reasoning

✍️ Feel free to explore, adapt, or extend these logic bases.
