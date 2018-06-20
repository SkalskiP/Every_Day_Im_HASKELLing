import Data.List
import System.IO

module Shapes   
( Point(..)  
, Shape(..)  
, surface  
, nudge  
, baseCircle  
, baseRect  
) where 

-- Algebraic data types intro
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses#algebraic-data-types

-- Creating your own datatype, which can be either a circle or a rectangle

data Point = Point Float Float deriving (Show)  
data Shape = Circle Point Float | Rectangle Point Point deriving (Show) 

-- Function that takes a shape and returns its surface

surface :: Shape -> Float  
surface (Circle _ r) = pi * r ^ 2  
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1) 

-- Function that nudges a shape

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))  

-- Let's test surface function

circleSurface = surface (Circle (Point 0 0) 24)  
rectangleSurface = surface (Rectangle (Point 0 0) (Point 100 100))  

-- Let's test nudge function

nudgedCircle = nudge (Circle (Point 34 34) 10) 5 10

-- Helpers for creating shapes at (0,0) position 

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)