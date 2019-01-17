# Haskell Terms


`cabal`
Haskell's package manager.

`hackage`
Cabal's package repository (site).

`stack` 
Haskell project manager.
Stack is a new approach to Haskell package structure that emerged in 2015.
Instead of using a rolling build like cabal-install stack breaks up sets of
packages into release blocks that guarantee internal compatibility between sets
of packages. The package solver for Stack uses a different strategy for resolving
dependencies than cabal-install has used historically and is generally more
robust.
Contrary to much misinformation, Stack does not replace Cabal as the
build system and uses it under the hood. It just makes the process of integrating with third party packages and resolving their dependencies much more
streamlined.

`Haddock`
docs tool
 
`ghc`
optimizing compiler that generates fast native code

`ghci`
interactive interpreter and debugger.

`runghc`
Haskell program runner, script runner

