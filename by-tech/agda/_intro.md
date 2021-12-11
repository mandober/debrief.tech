# Agda : Intro

Agda is written in Haskell and has much similarities to it, but many things are also different.

This states that `Bool` is a data type with the two constructors `true` and `false`.

```agda
data Bool : Set where
  true  : Bool
  false : Bool

not : Bool -> Bool
not true = false
not false = true

equiv : Bool -> Bool -> Bool
equiv true  true  = true
equiv true  false = false
equiv false true  = false
equiv false false = true
```

This declaration states that `Bool` is a member of the type `Set`, which in turn is the type of sets or *small types* (terminology by Martin-Lof). Thus, `Bool` is a small type, but `Set` is a *large type*. A signature `Set : Set` would imply inconsistency, letting us prove anything.

In general, Agda cannot infer types. However, we can always check whether a certain term has a certain type, provided it is *normal*. Agda's typechecker uses *normalisation*, also called *simplification*, and without the *normality restriction* it would not terminate.

Agda insists on total functions, therefore patterns in a function definition must be exhaustive.

Agda supports *infix* and *mix-fix* operators, and it is more permissive than Haskell about which characters can form an operator's name, and about the number and the position of arguments. The places of arguments in an infix operator are indicated using the underscore char.

```agda
_||_ : Bool -> Bool -> Bool
true || true = true
_    || _    = false

infixl 60 _||_

if_then_else_ : {C : Set} -> Bool -> C -> C -> C
if true then x else y = x
if false then x else y = y
```

`if-then-else` function is declared as a mix-fix operator. It also uses an *implicit argument* (in braces) which gives a readable version.

The precedence and association of infix operators are the same as in Haskell, except that the precedence goes from 1 to 99. The wildcard (`_`) is used as the pattern the same way as in Haskell.


In Haskell, data declarations that use type recursion are called recursive data type, but in constructive type theory, they are called *inductive types* or *inductively defined types*.

```agda
data Nat : Set where
  zero : Nat
  succ : Nat -> Nat

pred : Nat -> Nat
pred zero = zero
pred (succ n) = n

_+_ : Nat -> Nat -> Nat
zero + m = m
succ n + m = succ (n + m)

_*_ : Nat -> Nat -> Nat
zero * n = zero
succ n * m = n * m + m
```

Given a first order data type, Agda distinguishes between *canonical forms* and *non-canonical forms*. Canonical form only contain the constructors, whereas non-canonical can contain defined functions. For example, `true`, `false`, `succ (succ zero)` are canonical forms, but `not true`, `zero * zero`, `succ (zero + zero)` are not.

More precisely, Per Martin-Lof uses the notion of *lazy canonical forms*, which are forms that just need to begin with a constructor to be considered canonical. So, under this view, the form `succ (zero + zero)` would indeed be a lazy canonical form, but not a "full" canonical form.

Agda can use decimal representation for natural numbers by enabling a set of language pragmas or "built-in definitions":

```agda
{-# BUILTIN NATURAL Nat #-}
{-# BUILTIN ZERO zero #-}
{-# BUILTIN SUC succ #-}
{-# BUILTIN NATPLUS _+_ #-}
{-# BUILTIN NATTIMES _*_ #-}
```


## Lambda Notation and Polymorphism

Lambda abstraction is either written Curry-style, `\x -> e`, without a type label on the argument `x`, or Church-style, `\(x : A) -> e`, with a type label.

- The Curry-style  identity function is: `\ x      -> x : A -> A`
- The Church-style identity function is: `\(x : A) -> x : A -> A`

The above typings are valid for any type `A`, so `\x -> x` is polymorphic, that
is, it has many types.

Haskell would infer the type `\x -> x :: a -> a` for a type variable `a`. However, *Agda doesn't have type variables*. Instead, we can express the fact that we have *a family of identity functions*, one for each small type, as follows:

```agda
id : (A : Set) -> A -> A
id = \(A : Set) -> \(x : A) -> x

-- we can shift the params on the LHS-RHS

id : (A : Set) -> A -> A
id A x = x

id : (A : Set) -> A -> A
id A = \x -> x
```

From this, it follows that `id A : A -> A` is the identity function on the small type `A`, that is, we can apply this "generic" identity function `id` to a type argument `A` to obtain the identity function from `A` to `A`; it's like when we write `idᴀ` in math for the identity function on a set `A`.

Here we see a first use of *dependent types*: the type `A -> A` depends on the variable `A : Set`, ranging over the small types.

Agda's notation for *dependent function types*: if `A` is a type and `B[x]` is a type which depends on (is indexed by) `(x : A)`, then `(x : A) -> B[x]` is the type of functions `f` mapping arguments `(x : A)` to values `f x : B[x]`.

```agda
K : (A B : Set) -> A -> B -> A
K _ _ x _ = x

S : (A B C : Set) -> (A -> B -> C) -> (A -> B) -> A -> C
S _ _ _ f g x = f x (g x)

if_then_else_ : {C : Set} -> Bool -> C -> C -> C
if true then x else y = x
if false then x else y = y

natrec : {C : Set} -> C -> (Nat -> C -> C) -> Nat -> C
natrec p h zero = p
natrec p h (succ n) = h n (natrec p h n)

plus : Nat -> Nat -> Nat
plus n m = natrec m (\x y -> succ y) n

mult : Nat -> Nat -> Nat
mult n m = natrec zero (\x y -> plus y m) n
```
