module SemLs2 where

import System.Environment
import System.IO
import LexLs2
import ParserLs2
import Control.Applicative 
import Control.Monad
import Graphics.SOE
import qualified Data.Map as M

----------------------------Universidad Nacional Experimental de Guayana------------------------------
------------------------------------------------Ls2---------------------------------------------------
--------------------------------------Fase: Analisis Semantico----------------------------------------
-- Profesores Diego Mosquera y Luis Astorga.
-- By: Miguel Guevara
-- 19-03-17

-- SECCIÓN DE TIPOS
-- Tipo del trazado gráfico
data Traza = Lin Bool Paso        -- Segmento de línea, visible o invisible 
           | Giro Paso            -- Giro de dirección del apuntador
           | Sub Traza            -- Subtraza para una rama
           | Traza :>: Traza      -- Secuencia de segmentos
           deriving Show

-- Tipo de longitud de segmento de línea
type Seg    = Float

-- Tipo de punto en el plano real medido en pulgadas
type Vertex = (Float,Float)

-- Tipo de posición punto-dirección del apuntador
type Pos    = (Vertex,Rad)

-- Tipo de cambio de posición
type Paso   = (Pos,Pos)


-- Tipo de la tabla de símbolos (árbol binario balanceado importado de Data.Map)
type SymTab = M.Map String Float


-- Tipo transformador de estado (TE) para la tabla de símbolos
newtype TE a = T (SymTab -> (a,SymTab))


-- SECCIÓN DE INSTANCIAS

-- Instancia del tipo Graf como funtor
instance Functor TE where
    fmap = liftM

-- Instancia del tipo Graf como aplicativo
instance Applicative TE where
    pure a = T (\cs -> (a,cs))
    (<*>) = ap

-- Instancia del tipo Graf como Monad
instance Monad TE where
    return x = T (\symTab -> (x, symTab))
    (T act) >>= k = T  (\symTab -> let (x, symTab') = act symTab
                                       (T act') = k x
                                   in act' symTab')

-- Función que extrae el valor de un parámetro en la tabla de símbolos
lookUp :: String -> TE Float
lookUp str = T (\symTab -> case M.lookup str symTab of
                              Just v  -> (v, symTab)
                              Nothing -> error $ "Parámetro o Símbolo no definido: " ++ str)

-- Función que verifica si un símbolo ha sido declarado
lookUpV :: String -> TE ()
lookUpV str = T (\symTab -> case M.lookup str symTab of
                              Just v  -> ((), symTab)
                              Nothing -> error $ "Símbolo no definido: " ++ str)

-- Función que inserta un parámetro o símbolo,
-- si y solo si este no ha sido definido antes.
-- De lo contrario emite error.
addSymbolV :: String -> Float -> TE ()
addSymbolV str val = T (\symTab -> case M.lookup str symTab of
                              Just v  -> error $ "Parámetro o Símbolo existente: " ++ str
                              Nothing -> ((), M.insert str val symTab))

-- Función que introduce un valor en la tabla de símbolos
addSymbol :: String -> Float -> TE ()
addSymbol str val = T (\symTab -> let symTab' = M.insert str val symTab
                                  in  ((), symTab'))

-- Función para extraer resultado
result :: Show a => TE a -> SymTab -> a
result te = fst . (transf te) 

-- Función que ejecuta la transformación de estado
transf :: TE a -> SymTab -> (a,SymTab)
transf (T te) = te 

--Tabla de simbolos
simb = M.fromList ([("longSimb",0.20)])

-- TE que produce el trazado gráfico a partir de los datos (función semántica)
semantico :: Datos -> Traza
semantico dat = fst ((transf (semantic dat)) simb)

semantic :: Datos -> TE Traza
semantic dat = do cargaPar dat
                  cargaSimb dat
                  let (n, a, p) = cond dat
                      m         = mat dat
                      g         = gen dat
                  ms  <- autosim n m g
                  trz <- sem ms p a
                  return trz

--En las líneas 124, 126 y 128, se evalúa si un símbolo de un movimiento está previamente declarado
sem :: Movs -> Pos -> Rad -> TE Traza
sem (Tr op simb) pos a = case simb of
                              Sim st        -> do lookUpV st
                                                  calcTraza (lookUp "longSimb")
                              Def st (x:xs) -> do lookUpV st
                                                  calcTraza (lookUp x) 
                              Inv st (e:es) -> do lookUpV st
                                                  calcTraza (eval_arit e)
                            where 
                              calcTraza te = do seg <- te
                                                let npos = calcProx pos seg 0
                                                return (Lin (det op) (pos,npos))
                              calcProx ((x, y), r1) s r2 = let r = r1 + r2
                                                           in ((x + s * (cos r), y + s * (sin r)), r)
                              det Num = True
                              det Arr = False                                                      
sem (Gr dir) pos@(p,d) a = case dir of
                                Der -> return (Giro (pos, (p, d - a))) 
                                Izq -> return (Giro (pos, (p, d + a)))
                                D e -> do r <- eval_arit e
                                          return (Giro (pos, (p, d - r)))
                                I e -> do r <- eval_arit e
                                          return (Giro (pos, (p, d + r)))

sem (Rm movs) pos a    = do trz <- sem movs pos a
                            return (Sub trz)
sem (movs1 :--: movs2) pos a = do trz1 <- sem movs1 pos a
                                  let pos' = posFinal trz1
                                  trz2 <- sem movs2 pos' a
                                  return (trz1 :>: trz2)
                                  where
                                    posFinal (Lin _ (p1, p2))   = p2
                                    posFinal (Giro (p1, p2))    = p2
                                    posFinal (Sub trz)          = posInic trz
                                    posFinal (_ :>: trz)        = posFinal trz
                                    posInic (Lin _ (p1, p2))    = p1
                                    posInic (Giro (p1, p2))     = p1
                                    posInic (Sub trz)           = posInic trz
                                    posInic (trz :>: _)         = posInic trz

-- TE que carga la tabla de símbolos desde lista de parámetros 
cargaPar :: Datos -> TE ()
cargaPar dat = do let qs = (cargaP . fst .  gram) dat
                  case qs of 
                    []  -> return ()
                    pss -> cargas pss
                  where
                    cargaP []     = []
                    cargaP (p:ps) = case p of
                                      P1 st1 t1 v1 -> (st1,Numer v1) : cargaP ps
                                      P2 st2 t2 v2 -> (st2, v2) : cargaP ps


cargas :: [(String, Exp)] -> TE ()
cargas []     = return ()
cargas (x:xs) = do carga x
                   cargas xs
                   return ()
                where
                   carga (s, exp) = do r <- eval_arit exp
                                       addSymbolV s r
                                       return ()

cargass :: [(String, Exp)] -> TE ()
cargass []     = return ()
cargass (x:xs) = do carga x
                    cargass xs
                    return ()
                 where
                    carga (s, exp) = do r <- eval_arit exp
                                        addSymbol s r
                                        return ()

-- TE que carga la tabla de símbolos desde lista de variables de símbolos y la matriz
cargaSimb :: Datos -> TE ()
cargaSimb dat = do let ss = (snd .  gram) dat
                   complecion ss
                   let m  = mat dat
                       qs = simbMat m ss
                   case qs of 
                    [] -> return ()
                    ps -> cargass ps 

addSDef :: String -> [String] -> Float -> TE ()
addSDef n pss v =  do
                 addSymbolV n 0.0 
                 adds pss v
                 where
                    adds [] _     = return ()
                    adds (p:ps) v = do addSymbol p v
                                       adds ps v
                                       return ()  
-- TE que inicializa todos los parámetros de los símbolos en un valor predefinido
complecion :: [Simb] -> TE ()
complecion []     = return ()
complecion (s:ss) = do v <- lookUp "longSimb"
                       carga s v
                       complecion ss
                       return ()
                    where
                       carga x v = case x of
                                     Sim n     -> addSymbolV n 0.0
                                     Def n pss -> addSDef n pss v
                       
                                                          
-- Función que instancia parámetros formales con valores o expresiones reales
simbMat :: Movs -> [Simb] -> [(String,Exp)]
simbMat = matchSimbs . extListSimb 

extListSimb :: Movs -> [Simb]
extListSimb (Tr _ s)     = [s]
extListSimb (Gr _)       = []
extListSimb (Rm m)       = extListSimb m
extListSimb (m1 :--: m2) = (extListSimb m1) ++ (extListSimb m2)

matchSimbs :: [Simb] -> [Simb] -> [(String,Exp)]
matchSimbs _ []        = []
matchSimbs [] _        = []
matchSimbs (sb:sbs) xs = (matchSimb sb xs) ++ (matchSimbs sbs xs)
                          where
                           matchSimb s []     = []
                           matchSimb s (x:xs) = case s of
                                                  Def n1 ls -> case x of
                                                                 Inv n2 es -> if n1 == n2 then zip ls es
                                                                              else matchSimb s xs
                                                                 _ -> matchSimb s xs
                                                  Inv n1 es -> case x of
                                                                 Def n2 ls -> if n1 == n2 then zip ls es
                                                                              else matchSimb s xs
                                                                 _ -> matchSimb s xs
                                                  Sim n     -> []
                     

-- EVALUADOR ARITMÉTICO
eval_arit :: Exp -> TE Float
eval_arit exp = case exp of
                  (Term op exp1 exp2) -> do r1 <- eval_arit exp1
                                            r2 <- eval_arit exp2
                                            case op of
                                              Mas  -> return (r1 + r2)
                                              Rest -> return (r1 - r2)

                  (Fact op exp1 exp2) -> do r1 <- eval_arit exp1
                                            r2 <- eval_arit exp2
                                            case op of
                                              Por  -> return (r1 * r2)
                                              Div  -> return (r1 / r2)

                  (E exp1 exp2)       -> do r1 <- eval_arit exp1
                                            r2 <- eval_arit exp2
                                            return (r1 ** r2)
                               
                  (SubExp exp)        -> do r <- eval_arit exp
                                            return (r)

                  (Neg exp)           -> do r <- eval_arit exp 
                                            return (-r)


                  (Numer val)         -> case val of
                                              L n -> return (intToFloat n)
                                              R r -> return r
                                              B b -> if b == True then return 1.0
                                                     else return 0.0

                  (Var str)           -> lookUp str


-- EVALUADOR LÓGICO
-- Función que convierte convierte valor lógico en real
eval_log :: Log -> TE Float
eval_log (No e)            = do a <- eval_log e
                                return (abs (a - 1))
eval_log (Bin c e1 e2)     = case c of
                               O   -> do x <- eval_log e1
                                         y <- eval_log e2
                                         return (x + y - x*y)
                               Y   -> do x <- eval_log e1
                                         y <- eval_log e2
                                         return (x * y)
                               Imp -> eval_log (Bin O (No e1) e2)
                               Sii -> eval_log (Bin Y (Bin Imp e1 e2) (Bin Imp e2 e1))
eval_log (SubLog e1)       = eval_log e1
eval_log (Cond o e1 e2)    = do a <- eval_arit e1
                                b <- eval_arit e2
                                case o of 
                                  Meni  -> eval_log (V (a <= b))
                                  Mayi  -> eval_log (V (a >= b))
                                  Men   -> eval_log (V (a < b))
                                  May   -> eval_log (V (a > b))
                                  Igl   -> eval_log (V (a == b))
                                  Dif   -> eval_log (V (a /= b))
eval_log (V b)             = do case b of
                                  True  -> return 1.0
                                  False -> return 0.0



-- TE que efectúa las iteraciones según las generatrices

autosim :: Int -> Movs -> Gen -> TE Movs
autosim 0 m _   = return m
autosim n m gen = do new <- folds sust m gen
                     fin <- autosim (n-1) new gen
                     return fin

foldM' :: (Monad m) => (a -> b -> m a) -> a -> [b] -> m a
foldM' _ z [] = return z
foldM' f z (x:xs) = do
  z' <- f z x
  z' `seq` foldM' f z' xs

-- Función de plegado por la derecha (con acumulador) que efectua la iteración
folds :: (Movs -> (Simb, Guard, Movs) -> TE Movs) -> Movs -> Gen -> TE Movs
folds f mat []     = return mat
folds f mat (p:ps) = do new <- f mat p
                        fin <- folds f new ps
                        return fin
-- Función que valida si un símbolo de una generatriz fue previamente definido.
validM (Sim st)   = lookUpV st
validM (Inv st _) = lookUpV st
validM (Def st _) = lookUpV st

-- Función auxiliar que sustituye un movimiento por un árbol de movimientos (según generatriz) 
sust :: Movs -> (Simb, Guard, Movs) -> TE Movs
sust (Tr op sb1) (sb2,gd,gn) = do validM sb2
                                  case sb1 of
                                       Inv n1 es1 ->
                                                      case sb2 of
                                                           Def n2 st2 ->
                                                                            case gd of 
                                                                                 G1 l -> do t <- eval_log l
                                                                                            if (n1 == n2) && (t == 1.0) 
                                                                                            then do
                                                                                                    matchPars st2 es1
                                                                                                    m <- actualiza gn
                                                                                                    return m
                                                                                            else return (Tr op sb1)
                                                                                 G2 p -> return (Tr op sb1)
                                                           _          -> return (Tr op sb1)
                                       _          ->
                                                      if sb1 == sb2 then
                                                        return gn
                                                      else return (Tr op sb1)
                                 where
                                    matchPars [] []         = return ()
                                    matchPars (x:xs) (y:ys) = do z <- eval_arit y
                                                                 addSymbol x z
                                                                 matchPars xs ys
                                                                 return ()
sust (Gr dir) _               = return (Gr dir)
sust (Rm movs) sgg            = do m <- sust movs sgg
                                   return (Rm m)
sust (mov1 :--: mov2) sgg     = do m1 <- sust mov1 sgg
                                   m2 <- sust mov2 sgg
                                   return (m1 :--: m2)       

-- TE que actualiza los parámetros de los movimientos en una generatriz
actualiza :: Movs -> TE Movs
actualiza movs = case movs of  
                   Tr op simb -> case simb of
                                   Sim n    -> return (Tr op simb)
                                   Inv n es -> do exps <- evalList es   
                                                  return (Tr op (Inv n exps))
                                   _        -> fail "Error en actualización de generatriz"
                                 where
                                    evalList []     = return []
                                    evalList (e:es) = do r  <- eval_arit e
                                                         rs <- evalList es
                                                         return (Numer (R r):rs)
                   Gr dir     -> case dir of
                                   Der -> return (Gr dir)
                                   Izq -> return (Gr dir)
                                   D e -> do r <- eval_arit e 
                                             return (Gr (D (Numer (R r))))
                                   I e -> do r <- eval_arit e 
                                             return (Gr (I (Numer (R r))))
                   Rm m1       -> do m2 <- actualiza m1
                                     return (Rm m2)
                   m1 :--: m2  -> do m1' <- actualiza m1
                                     m2' <- actualiza m2
                                     return (m1' :--: m2')

--Función que extrae el resultado del parser de la mónada Either.
extrParser (Right a) = a
extrParser (Left e) = error e