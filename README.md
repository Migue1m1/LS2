# LSystems

An L-system or Lindenmayer system is a parallel rewriting system and a type of formal grammar. 
An L-system consists of an alphabet of symbols that can be used to make strings, 
a collection of production rules that expand each symbol into some larger string of symbols, 
an initial "axiom" string from which to begin construction, and a mechanism for translating 
the generated strings into geometric structures.

L-systems were introduced and developed in 1968 by Aristid Lindenmayer, 
a Hungarian theoretical biologist and botanist at the University of Utrecht. 
Lindenmayer used L-systems to describe the behaviour of plant cells and to model 
the growth processes of plant development. 

L-systems have also been used to model the morphology of a variety of organisms 
and can be used to generate self-similar fractals such as iterated function systems.

## About the Project

This project is about an Interpreter of a subset of L-Systems. 
Consists of Lexical, Syntax and Semantic phases of an Interpreter.

* LexLs2.x    -> Lexical analysis using Alex (Lexer).
* ParserLs2.y -> Syntax analysis using Happy (Parser).
* SemLs2.hs   -> Semantic analysis.
* Main.hs     -> Main file that calls the previous.
* Examples    -> Program Examples.

## Getting Started

Run on Linux using next syntax...

```
runhaskell Main.hs examples/figure_file.ls2
```

## Prerequisites

You need install:

* [Ubuntu](https://www.ubuntu.com/) or another Linux distro.
* [Haskell](https://www.haskell.org/)

## Compiler Tools

* [Alex](https://www.haskell.org/alex/)
* [Happy](https://www.haskell.org/happy/)

## ScreenShots

**Arbusto**
![arbusto_ls2](https://github.com/Migue1m1/LSystems/blob/master/screenshots/arbusto_ls2.png)

**Triangulo Rectangulo**
![triangulo_ls2](https://github.com/Migue1m1/LSystems/blob/master/screenshots/Triangulo_rectangulo_ls2.png)

## Acknowledgments

* To Luis Astorga and Diego Mosquera.

## See...

* [Learn You Haskell For Great Good](http://learnyouahaskell.com/)
