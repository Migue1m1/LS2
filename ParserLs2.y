{
module ParserLs2 where
import LexLs2
import qualified Data.Map as M
}
----------------------------Universidad Nacional Experimental de Guayana------------------------------
------------------------------------------------Ls2---------------------------------------------------
--------------------------------------Fase: Analisis Sintactico---------------------------------------
-- Profesores Diego Mosquera y Luis Astorga.
-- By: Miguel Guevara
-- 19-03-17
%name parserLs2
%tokentype { Token }
%monad { P } { thenP } { returnP }
%error { happyError }

%token 
    Titulo          { TokenTit $$ _    }
    Gramatica       { TokenGram _      }
    Condiciones     { TokenConds _     }
    Fin             { TokenFin _       }
    Line            { TokenLin _       }
    Matriz          { TokenMatriz _    }
    Generatriz      { TokenGentrz _    }
    Probabilidad    { TokenProbld _    }
    Derivaciones    { TokenDerivs _    }
    Parametro       { TokenPar _       }
    Simbolo         { TokenSym _       }
    IdParametro     { TokenIdPar $$ _  }
    IdSimbolo		    { TokenIdSym $$ _  }
    Pasos			      { TokenPasos _     }
    Angulo			    { TokenAng _       }
    Posicion		    { TokenPos _       }
    Valor           { TokenVal _       }
    Ent		      		{ TokenEnt $$ _    }
    Real			      { TokenReal $$ _   }
    Boole           { TokenBoole $$ _  }
    Tipo            { TokenType $$ _   }
    '+'             { TokenPlus _      }
    '-'             { TokenMinus _     }
    '*'             { TokenMult _      }
    '/'             { TokenDivs _      }
    '^'             { TokenPot _       }
    '!'             { TokenUnOp $$ _   }
    Ordr            { TokenOrder $$ _  }
    Logic           { TokenLogic $$ _  }
    LError          { LexicalErr _     }
    LP              { TokenLP _        }
    RP              { TokenRP _        }
    COMMA           { TokenCOMMA _     }
    "->"            { TokenSubs _      }
    ':'             { TokenSepAs _     }
    "--"            { TokenMovSep _    }
    ":="            { TokenAssign _    }
    '#'             { TokenMovNum _    }
    '@'             { TokenMovArr _    }
    '$'             { TokenMovIzq _    }
    '&'             { TokenMovDer _    }
    '{'             { TokenRmPush _    }
    '}'             { TokenRmPop _     }
%left '+' '-'
%left '*' '/' '^' '!'
%%
--Gramatica que devuelve la estructura de datos para el análisis semántico
program : Titulo lins Gramatica gramatica Line Condiciones condiciones Line matriz Line generatriz Line Fin { Dat { title = $1,  gram = $4, cond = $7, mat = $9, gen = $11} }

--Gramatica para las condiciones iniciales
condiciones : Pasos Ent Angulo Ent Posicion LP Real COMMA Real RP Ent
              {
                if $2 < 0  then error "Error Semantico: Numero de pasos negativos."
                else if $4 < 0 || $4 > 90 then error "Error Semantico: Angulo fuera de rango [0 < x < 90]."
                else if $11 < 0 || $11 > 180 then error "Error Semantico: Angulo de posicion fuera de rango [0 < x < 180]" 
                else ($2, degToRad(intToFloat $4), (($7, $9), degToRad (intToFloat $11)))
              }
-- Una o dos líneas
lins : Line      { [] }
     | Line Line { [] }

--Si hay parametros, los símbolos deben contener parámetros
--Si no hay parámetros, la gramática no es paramétrica
gramatica : simbolos    { ([], $1) }
          | gramaticaPS {    $1    }

--Lista de símbolos simples, sin parámetros
simbolos : simbolo          { [$1]    }
         | simbolo simbolos { $1 : $2 }
--Gramatica para símbolo simple. Ej: simbolo X
simbolo : Simbolo IdSimbolo { Sim $2  }

--Gramática con parámetros y símbolos con parámetros
gramaticaPS : parametros simbolosPar { ($1, $2) }
--Lista de parámetros
parametros : parametro            {   [$1]  }
           | parametro parametros { $1 : $2 }
--Gramática que acepta parámetros
parametro : Parametro IdParametro ':' Tipo Valor num { if valdTypes $4 $6 then P1 $2 (extrType $4) $6 else error "Error Semantico: Tipos incompatibles." }
          | Parametro IdParametro ':' Tipo ":=" expr { P2 $2 (extrType $4) $6 }

--Lista de símbolos con parámetros
simbolosPar : simboloP             {  [$1]   }
            | simboloP simbolosPar { $1 : $2 }
--Gramatica para símbolos con parámeteros, acepta simbolo X(x,t), pero no simbolo X
simboloP : Simbolo IdSimbolo simbPars { Def $2 $3 }
--Gramática para los parámetros
simbPars : LP IdParametro COMMA IdParametro RP { [$2, $4] }
         | LP IdParametro RP                   {   [$2]   }

{-      parte 2       -}

--Gramática para la matriz
matriz : Matriz matrizPart { $2 }

matrizPart : '#' IdSimbolo LP gParams RP                        { Tr Num (Inv $2 $4)         } 
           | '@' IdSimbolo LP gParams RP                        { Tr Arr (Inv $2 $4)         }
           | '#' IdSimbolo                                      { Tr Num (Sim $2)            }
           | '@' IdSimbolo                                      { Tr Arr (Sim $2)            }
           | '#' IdSimbolo LP gParams RP "--" movimientosParams { Tr Num (Inv $2 $4) :--: $7 }
           | '@' IdSimbolo LP gParams RP "--" movimientosParams { Tr Arr (Inv $2 $4) :--: $7 }
           | '#' IdSimbolo "--" movimientosN                    { Tr Num (Sim $2) :--: $4    }
           | '@' IdSimbolo "--" movimientosN                    { Tr Arr (Sim $2) :--: $4    }

--Gramática para la generatriz
generatriz :  Generatriz generatrizP1 { $2 }

{- se evalúan los movimientos de las funciones generatrices clasificándolas en 3 tipos:
              Paramétricas
              Probabilísticas
              Normales
    Las paramétricas tienen parámetros, por lo que cada símbolo de la función generatriz debe tener asociado sus parámetros
    Las probabilísticas y las normales se asemejan en los movimientos, con la diferencia de que en las probabilísticas
            se incluye la probabilidad
    Por ejemplo, la generatriz siguiente no debe ser aceptada:
        #F(1,p*9)--#F--{&--#F(9,0)}--#F
      por el hecho de que hay un simbolo F que no contiene parametros.

-}
generatrizP1 : IdSimbolo generatrizP2 { putSimb $2 $1 }

--Gramátrica que predice si el movimiento es Probabilistico-Normal o Parametrico
generatrizP2 :  "->" generatrizP3                                     { $2  }
              | gntrzParams "->" movimientosParams generatricesParams { (Def "" (fst $1), G1 (snd $1), $3) : $4 }

--Gramática que predice si el movimiento es probabilistico o normal
generatrizP3 : Probabilidad Real movimientosN generatricesProbs { (Sim "", G2 $2, $3) : $4        }
             | movimientosN generatricesN                       { (Sim "", G1 (V True),  $1) : $2 }

--Gramática que asegura los movimientos normales para generatrices del tipo: F -> #F--{&--#F}--F
generatricesN :  { [] }
              | IdSimbolo "->" movimientosN generatricesN { (Sim $1, G1 (V True), $3) : $4 }

--Gramática que asegura los movimientos paramétricos para generatrices del tipo: F(x,t):t=0 ->#F(x*p,2)--&--#F(x*h,1)
generatricesParams : { [] }
                   | IdSimbolo gntrzParams "->" movimientosParams generatricesParams { ((Def $1 (fst $2)), G1 (snd $2), $4) : $5 }

--Gramática que asegura los movimientos paramétricos para generatrices del tipo: F -> probabilidad 0.34 #F--{$--#F}--#F
generatricesProbs : { [] }
                  | IdSimbolo "->" Probabilidad Real movimientosN generatricesProbs { (Sim $1, G2 $4, $5) : $6 }

--Gramática para parámetros de un simbolo, ej: (expr, expr):exprLogic
gntrzParams : LP idParams RP ':' exprLogic { ($2, $5)  }

idParams : IdParametro COMMA IdParametro { [$1 , $3] }
         | IdParametro                   { [$1]      }

gParams : expr COMMA expr { [$1, $3] }
        | expr            { [$1]     }

--Gramática para los movimientos paramétricos del tipo: F(x,t):t=0 ->#F(x*p,2)--&--#F(x*h,1)
movimientosParams : '#' IdSimbolo LP gParams RP "--" movimientosParams { Tr Num (Inv $2 $4) :--: $7 }
                  | '@' IdSimbolo LP gParams RP "--" movimientosParams { Tr Arr (Inv $2 $4) :--: $7 }
                  | '#' IdSimbolo LP gParams RP                        { Tr Num (Inv $2 $4)         }
                  | '@' IdSimbolo LP gParams RP                        { Tr Arr (Inv $2 $4)         }
                  | '$' "--" movimientosParams                         { Gr Der :--: $3             }
                  | '&' "--" movimientosParams                         { Gr Izq :--: $3             }
                  | '{' movimientosParams '}' "--" movimientosParams   { Rm $2 :--: $5              }

--Gramática para los movimientos normales y probabilísticos del tipo: F -> #F--{&--#F}--F
movimientosN : '#' IdSimbolo "--" movimientosN        { Tr Num (Sim $2) :--: $4 }
             | '@' IdSimbolo "--" movimientosN        { Tr Arr (Sim $2) :--: $4 }
             | '#' IdSimbolo                          { Tr Num (Sim $2)         }
             | '@' IdSimbolo                          { Tr Arr (Sim $2)         }
             | '$' "--" movimientosN                  { Gr Der :--: $3          }
             | '&' "--" movimientosN                  { Gr Izq :--: $3          }
             | '{' movimientosN '}' "--" movimientosN { Rm $2 :--: $5           }

--Gramática para expresiones aritméticas
expr : expr '+' expr { Term Mas $1 $3   }
     | expr '-' expr { Term Rest $1 $3  }
     | expr '*' expr { Fact Por $1 $3   }
     | expr '/' expr { Fact Div $1 $3   }
     | expr '^' expr { E $1 $3          }
     | '!' expr      { Neg $2           }
     | LP expr RP    { SubExp $2        }
     | IdParametro   { Var $1           }
     | num           { Numer $1         }
--Tipos de datos extraídos del lexer
num : Ent   { L $1 }
    | Real  { R $1 }
    | Boole { B $1 }

--Gramática para las expresiones lógicas
exprLogic : expr Ordr expr { Cond (extrOrdn $2) $1 $3 }

{
{- Manejo de errores -}
dataToken :: Token -> String
dataToken = str

dataTokens :: [Token] -> String
dataTokens (x:xs) = show (dataToken x)
dataTokens [] = "el final del archivo"
happyError = \tks i -> ParseFail ("Error de sintaxis por " ++ (dataTokens tks))

data ParseResult a
                  = ParseOk a
                  | ParseFail String
type P a = Int -> ParseResult a

thenP :: P a -> (a -> P b) -> P b
m `thenP` k = \l -> 
                   case m l of
                        ParseFail s -> ParseFail s
                        ParseOk a -> k a l

returnP :: a -> P a
returnP a = \l -> ParseOk a

{- Tipos de dato -}

--Tipo de dato del programa, usado por el analizador semántico
data Datos =  Dat {
                    title :: String,
                    gram  :: ([Par], [Simb]),
                    cond  :: (Int, Float, ((Float, Float), Float)),
                    mat   :: Movs,
                    gen   :: Gen
                  } 
             deriving Show
-- Tipo sinónimo de las generatrices
type Gen = [(Simb, Guard, Movs)]
-- Tipo expresion aritmetica
data Exp = Term Oper Exp Exp       -- Términos en suma o resta
         | Fact Oper Exp Exp       -- Factores en producto o división
         | E Exp Exp              -- Exponenciación base exponente
         | SubExp Exp              -- Subexpresión en paréntesis
         | Neg Exp                 -- Expresión en signo negativo 
         | Numer Valor             -- Número (entero o real)
         | Var String              -- Variable
         deriving (Show, Eq)
-- Tipo de operadores aritméticos (más, menos, por, entre)
data Oper = Mas | Rest | Por | Div deriving (Show, Eq)

-- Tipo de los tipos de parámetros
data Tipo  = Ent | Real | Boole deriving Show        -- Entero o real

-- Tipos de valor numérico                   -- Int o Float
data Valor = L Int | R Float | B Bool deriving (Show, Eq) 

-- Tipo de expresiones lógicas
data Log = No Log                  -- Negación
         | Bin Conect Log Log      -- Opreador lógico binario (conector)
         | SubLog Log              -- Subexpresión en paréntesis
         | Cond Ordn Exp Exp       -- Expresión condicional de orden
         | V Bool                  -- Valores booleanos
         deriving (Show, Eq)

-- Tipo de conectores lógicos
data Conect = O              -- disyunción
            | Y              -- conjunción
            | Imp            -- implicación
            | Sii            -- Equivalencia
        deriving (Eq,Show)

-- Tipo de relaciones de orden (LE,GE,LT,GT,EQ,NEQ)
data Ordn = Meni | Mayi | Men | May | Igl | Dif deriving (Show, Eq)

-- Tipo de guarda para generatrices
data Guard = G1 Log                -- Guarda lógica
           | G2 Float              -- Guarda probabilística
           deriving Show

data Par = P1 String Tipo Valor      -- Nombre tipo valor
         | P2 String Tipo Exp        -- Nombre tipo expresión
         deriving Show

data Movs = Tr Op Simb         -- Movimiento de avance de segmento
          | Gr Dir               -- Movimiento de giro
          | Rm Movs              -- Rama de movimientos
          | Movs :--: Movs       -- Secuencia de movimientos
          deriving Show
data Simb = Sim String               -- Simple y probabilistico
          | Def String [String]      -- Definición con parámetros formales
          | Inv String [Exp]         -- Invocación con parámetros reales
          deriving (Show, Eq)
-- Tipo de operadores
data Op = Num | Arr deriving Show    -- Numeral | Arroba

-- Tipo de dirección de giro
data Dir = Der                   -- Giro derecha con valor global
         | Izq                   -- Giro izquierda con valor global
         | D Exp                 -- Giro derecha con parámetros
         | I Exp                 -- Giro derecha con parámetros
         deriving Show 

-- Tipo de ángulos en grados
type Deg    = Float

-- Tipo de ángulos en radianes
type Rad    = Float

-- Función que inserta un símbolo
-- Es usada por la gramática de las generatrices, debido a que
-- al no poder usarse gramática de atributos, 
-- no hay forma de heredar el primer simbolo reconocido. Ej: la "F" de F -> #...
-- Además, evalua si la suma de las probabilidades de una generatriz es igual a 1.0
putSimb :: [(Simb, Guard, Movs)] -> String -> [(Simb, Guard, Movs)]
putSimb ((Sim _, (G1 v), b):cs) s = ((Sim s, (G1 v), b):cs)
putSimb css@((Sim _, (G2 v), b):cs) s = case checkProbs css of
                                    1.0 -> ((Sim s, (G2 v), b):cs)
                                    _ -> error "Error Semantico: Suma de probabilidades distinto de 1.0"
putSimb ((Def _ ls, g, b):cs) s = ((Def s ls, g, b):cs)

--Devuelve la suma de las probabilidades dada una lista de generatrices
checkProbs :: [(Simb, Guard, Movs)] -> Float
checkProbs ((Sim _, G2 n, b):cs) = n + checkProbs cs
checkProbs [] = 0

-- Dado un String, devuelve un Tipo
extrType :: String -> Tipo
extrType "Ent"   = Ent
extrType "Real"  = Real
extrType "Boole" = Boole

--Dado un tipo y un valor, 
-- devuelve verdadero si son del mismo tipo, falso de lo contrario.
-- Usada para verificar la asignación de dos tipos. Ej: "c:Real Valor 10" devuelve False
valdTypes :: String -> Valor -> Bool
valdTypes "Ent" (L _)   = True
valdTypes "Real" (R _)  = True
valdTypes "Boole" (B _) = True
valdTypes _ _           = False

-- Dado un orden devuelve su tipo correspondiente
extrOrdn :: String -> Ordn
extrOrdn "<"  = Men
extrOrdn ">"  = May
extrOrdn "=<" = Meni
extrOrdn ">=" = Mayi
extrOrdn "/=" = Dif
extrOrdn "="  = Igl

-- Función que convierte entero en real
intToFloat :: Int -> Float
intToFloat x = fromInteger (toInteger x) 

-- Función que convierte grados en radianes
degToRad :: Float -> Float
degToRad d = d * (pi / 180.0)

--Funcion Parser
--ParseOk en caso de análisis correcto
--ParseFail en caso de análisis incorrecto
parser s = case parserLs2 (lexer s) 1 of
                ParseOk e   -> Right e
                ParseFail s -> Left s
}