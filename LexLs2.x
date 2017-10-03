{

module LexLs2 (Token(..), lexer) where
}
----------------------------Universidad Nacional Experimental de Guayana------------------------------
------------------------------------------------Ls2---------------------------------------------------
--------------------------------------Fase: Analisis Lexico-------------------------------------------
-- Profesores Diego Mosquera y Luis Astorga.
-- Alumnos
--        Miguel Guevara.   CI 25693142
--        Jessika Carvajal. CI 24179295
--        Isrrael Maita.    CI 19621016
--        Jaussman Sanchez. CI 23871616
--24-01-17
%wrapper "posn"
--Expresiones regulares
$dig   = [1-9]
$digit = [0-9]
$alpha = [a-zA-Z]
$beginPar = [a-z]
$beginSym = [A-Z]
$newline = [\n]
$comment = $printable#\.

@title = "Titulo:" $printable+ "."
@comments = "Comentarios" $newline [$comment]* "."
@gram = "Gramatica"
@conds = "Condiciones"
@fin = "Fin"
@matriz = "matriz"
@generatriz = "generatriz"
@probabilidad = "probabilidad"
@derivaciones = "drivaciones"
@sym = "simbolo"
@par = "parametro"
@pasos = "pasos"
@angulo = "angulo"
@posicion = "posicion"
@valor = "valor"
@lParent = "("
@rParent = ")"
@comma = ","
@sepAs = ":"
@assign = ":="
@movSep = "--"
@subs = "->"
@plus = "+"
@minus = "-"
@mult = "*"
@divs = "/"
@pot = "^"
@opersArith = "+" | "-" | "*" | "/" | "^"
@unOp = "!"
@opersOdr = "<" | ">" | "=<" | ">=" | "/=" | "="
@movNum = "#"
@movArr = "@"
@movIzq = "$"
@movDer = "&"
@movRmPush = "{"
@movRmPop = "}"
@entN = "0" | $dig $digit*
@realN = "-"? "0."[$digit]+ | "-"? $dig$digit*"."$digit+
@booleV = "True" | "False"
@types = "Ent" | "Real" | "Boole"
@titErr = "Titulo:" [$printable#\.]+ \n | "Titulo" [$printable#\.]+ \n | "Titulo" $printable+ \.
@cmmntErr = "Comentarios" $newline[ $comment]* \n
@id_sym = $beginSym [$digit]* 
@id_par = $beginPar [$alpha $digit]*
--Tokens
tokens :- 
          $newline$newline											          { \(AlexPn _ f c) s -> TokenLin	  { str = toString "Separador de Linea" (f + 1) 1	        }	  }
          $white+											                    ;
          @title 	                                      	{ \(AlexPn _ f c) s -> TokenTit	  { tit = title s, str = toString (title s) f c           }	  }
          @comments                                       ;
          @gram                                           { \(AlexPn _ f c) s -> TokenGram  { str = toString ("Seccion: " ++ s) f c                 }   }
          @conds                                          { \(AlexPn _ f c) s -> TokenConds { str = toString ("Seccion: " ++ s) f c                 }   }
          @fin				                                    { \(AlexPn _ f c) s -> TokenFin	  { str = toString "Fin" f c 	                            }	  }
          @titErr                                         { \(AlexPn _ f c) s -> LexicalErr { str = toString "mal Titulo " f c                      }   }
          @cmmntErr                                       { \(AlexPn _ f c) s -> LexicalErr { str = toString "mal Comentario "              f c     }   }
	        @types                                          { \(AlexPn _ f c) s -> TokenType  { typ = s, str = toString ("Tipo: " ++ s) f c           }   }
          @movNum                                         { \(AlexPn _ f c) s -> TokenMovNum{ str = toString "Mov #" f c                            }   }
          @movArr                                         { \(AlexPn _ f c) s -> TokenMovArr{ str = toString "Mov @" f c                            }   }
          @movIzq                                         { \(AlexPn _ f c) s -> TokenMovIzq{ str = toString "Mov $" f c                            }   }
          @movDer                                         { \(AlexPn _ f c) s -> TokenMovDer{ str = toString "Mov &" f c                            }   }
          @movRmPush                                      { \(AlexPn _ f c) s -> TokenRmPush{ str = toString "Push {" f c                           }   }
          @movRmPop                                       { \(AlexPn _ f c) s -> TokenRmPop { str = toString "Pop }" f c                            }   }
          @lParent                                        { \(AlexPn _ f c) s -> TokenLP    { str = toString "Parentesis Abierto" f c               }   }
          @rParent                                        { \(AlexPn _ f c) s -> TokenRP    { str = toString "Parentesis Cerrado" f c               }   }
          @comma                                          { \(AlexPn _ f c) s -> TokenCOMMA { str = toString "COMMA" f c                            }   }
          @sepAs                                          { \(AlexPn _ f c) s -> TokenSepAs { str = toString ("Separador  " ++ s) f c               }   }
          @assign                                         { \(AlexPn _ f c) s -> TokenAssign{ str = toString ("Asignacion  " ++ s) f c              }   }
          @movSep                                         { \(AlexPn _ f c) s -> TokenMovSep{ str = toString ("Separador  " ++ s) f c               }   }
          @subs                                           { \(AlexPn _ f c) s -> TokenSubs  { str = toString ("Substitucion  " ++ s) f c            }   }
          @plus                                           { \(AlexPn _ f c) s -> TokenPlus  { str = toString ("Operador  " ++ s) f c                }   }
          @minus                                          { \(AlexPn _ f c) s -> TokenMinus { str = toString ("Operador  " ++ s) f c                }   }
          @mult                                           { \(AlexPn _ f c) s -> TokenMult  { str = toString ("Operador  " ++ s) f c                }   }
          @divs                                           { \(AlexPn _ f c) s -> TokenDivs  { str = toString ("Operador  " ++ s) f c                }   }
          @pot                                            { \(AlexPn _ f c) s -> TokenPot   { str = toString ("Operador  " ++ s) f c                }   }
          @unOp                                           { \(AlexPn _ f c) s -> TokenUnOp  { op = s, str = toString ("Operador Unario  " ++ s) f c }   }
          @opersOdr                                       { \(AlexPn _ f c) s -> TokenOrder { odn = s, str = toString ("Op de Orden  " ++ s) f c    }   }
          "/\" | "\/" | ">" | "=>" | "<=" | "<=>" | "~"   { \(AlexPn _ f c) s -> TokenLogic { comp = s, str = toString ("Op Logico: " ++ s) f c     }   }
          @sym                                            { \(AlexPn _ f c) s -> TokenSym   { str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @par                                            { \(AlexPn _ f c) s -> TokenPar   { str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @pasos                                          { \(AlexPn _ f c) s -> TokenPasos { str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @angulo                                         { \(AlexPn _ f c) s -> TokenAng   { str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @posicion                                       { \(AlexPn _ f c) s -> TokenPos   { str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @valor                                          { \(AlexPn _ f c) s -> TokenVal   { str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @matriz                                         { \(AlexPn _ f c) s -> TokenMatriz{ str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @generatriz                                     { \(AlexPn _ f c) s -> TokenGentrz{ str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @probabilidad                                   { \(AlexPn _ f c) s -> TokenProbld{ str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @derivaciones                                   { \(AlexPn _ f c) s -> TokenDerivs{ str = toString ("Palabra Reservada: " ++ s) f c       }   }
          @realN                                          { \(AlexPn _ f c) s -> TokenReal  { real = (read s), str = toString ("Real: " ++ s) f c   }   }
          @booleV                                         { \(AlexPn _ f c) s -> TokenBoole { boole = (read s), str = toString ("Bool: " ++ s) f c  }   }
          @entN                                           { \(AlexPn _ f c) s -> TokenEnt   { ent = (read s), str = toString ("Entero: " ++ s) f c  }   }
          @id_sym                                         { \(AlexPn _ f c) s -> TokenIdSym { idSym = s, str = toString ("ID_Simbolo: " ++ s) f c   }   }
          @id_par                     				            { \(AlexPn _ f c) s -> TokenIdPar { idPar = s, str = toString ("ID_Parametro: " ++ s) f c }  	}

{
--Definicion de tokens como registros
data Token =   TokenTit		{ tit :: String, str :: String        		  }
			       | TokenGram	{ str :: String		                          }
             | TokenConds { str :: String                             }
             | TokenFin   { str :: String                             }
             | TokenType  { typ :: String, str :: String              }
             | TokenSym   { str :: String                             }
             | TokenPar   { str :: String                             }
             | TokenPasos { str :: String                             }
             | TokenAng   { str :: String                             }
             | TokenPos   { str :: String                             }
             | TokenVal   { str :: String                             }
             | TokenEnt   { ent :: Int, str :: String                 }
             | TokenReal  { real :: Float, str :: String              }
             | TokenBoole { boole :: Bool, str :: String              }
             | TokenIdSym { idSym :: String, str :: String            }
			       | TokenIdPar { idPar :: String, str :: String          	}
			       | TokenLin		{ str :: String            	  		          }
             | TokenMovNum{ str :: String                             }
             | TokenMovArr{ str :: String                             }
             | TokenMovIzq{ str :: String                             }
             | TokenMovDer{ str :: String                             }
             | TokenRmPush{ str :: String                             }
             | TokenRmPop { str :: String                             }
             | TokenLP    { str :: String                             }
             | TokenRP    { str :: String                             }
             | TokenCOMMA { str :: String                             }
             | TokenSepAs { str :: String                             }
             | TokenAssign{ str :: String                             }
             | TokenMatriz{ str :: String                             }
             | TokenGentrz{ str :: String                             }
             | TokenProbld{ str :: String                             }
             | TokenDerivs{ str :: String                             }
             | TokenMovSep{ str :: String                             }
             | TokenSubs  { str :: String                             }
             | TokenPlus  { str :: String                             }
             | TokenMinus { str :: String                             }
             | TokenMult  { str :: String                             }
             | TokenDivs  { str :: String                             }
             | TokenPot   { str :: String                             }
             | TokenUnOp  { op :: String, str :: String               }
             | TokenOrder { odn :: String, str :: String              }
             | TokenLogic { comp :: String, str :: String             }
		         | LexicalErr	{ str :: String                             }
		         deriving Show

title :: String -> String
title s = let str = drop (length "Titulo:") s
        in take ((length str) - 1) str

toString s f c = "[ " ++ s ++ " ], fila: " ++ (show f) ++ ", columna: " ++ (show c)

alexScanTokenS str = go (alexStartPos,'\n', [], str)
  where go inp@(pos,_, _, str) =
          case alexScan inp 0 of
                AlexEOF 									-> []
                AlexError ((AlexPn _ line column), _, _, _) -> [ LexicalErr { str = toString "Palabra desconocida" line column } ]
				
                AlexSkip  inp' len     						-> go inp'
                AlexToken inp' len act 						-> act pos (take len str) : go inp'

--Funcion Lexer
lexer s = alexScanTokenS s
}
