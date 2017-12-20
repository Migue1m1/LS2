
module Main where

import System.IO
import System.Environment
import LexLs2
import ParserLs2
import SemLs2
import Graphics.SOE

----------------------------Universidad Nacional Experimental de Guayana------------------------------
------------------------------------------------Ls2---------------------------------------------------
------------------------------------- Fase: Graficador -----------------------------------------------
-- Profesores Diego Mosquera y Luis Astorga.
-- By: Miguel Guevara
-- 19-03-17

-- Función principal, activa el parser (Datos),
-- el cual a su vez invoca al lexer (Tokens), 
-- para procesar el árbol sintáctico por el analizador semántico (Trazas)
main = do
       (file:xs) <- getArgs
       contents  <- readFile file
       (nom,trz) <- semant (extrParser (parser contents))
       runGraphics (
                   do w <- openWindow nom (xWin,yWin)
                      drawInWindow w (dibuja trz [Magenta, Cyan, White] 0)
                      spaceClose w
                   )

spaceClose :: Window -> IO ()
spaceClose w = do
                  k <- getKey w
                  if k == ' '
                  then closeWindow w
                  else spaceClose w

semant :: Datos -> IO (String,Traza)
semant dat = let nom = title dat
                 trz = semantico dat
             in return (nom , trz)

                                    
-- Funciones de conversión entre pulgadas y píxeles 

inchToPixel :: Float -> Int
inchToPixel x = round (100 * x)

pixelToInch :: Int -> Float
pixelToInch n = (intToFloat n)/100

-- Dimensiones de la ventada gráfica
xWin, yWin :: Int
xWin = 900
yWin = 750

trans :: Vertex -> Point
trans (x,y) = ((div xWin 2) + inchToPixel x, (div yWin 2) - inchToPixel y)

transList :: [Vertex] -> [Point]
transList = map trans

dibuja :: Traza -> [Color] -> Int -> Graphic
dibuja (Lin bool ((vt1,_),(vt2,_))) col n = case bool of
                                            True  -> withColor (getColor col (mod n 3)) (line (trans vt1) (trans vt2)) 
                                            False -> withColor Black (line (trans vt1) (trans vt2)) 
dibuja (Giro _) _ n                      = emptyGraphic
dibuja (Sub trz) col n                   = dibuja trz col (n + 1)
dibuja (trz1 :>: trz2) col n             = do dibuja trz1 col (n + 1)
                                              dibuja trz2 col (n + 1)
--Función que devuelve un color
getColor (c:cs) 0 = c
getColor (c:cs) n = getColor cs (n - 1)