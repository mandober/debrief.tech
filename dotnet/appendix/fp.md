# FP in C#


UNIT TYPE

`bottom` type is a type that cannot be instantiated, becasue it has no values.
It is on the other side of types hierarchy, opposite the `top` type.
In case of C#, the top type is `object`, but C# doesn't have a `bottom` type.

Unit type is a type that has only 1 value, commonly denoted as `()`.
However, C# also lacks the proper unit type. `void` is a special language
construct specifying that a method returns no value; it is only allowed to
use void in that particular context.

Until recently, fp libraries have tended to define their unit type as a struct
with no members. The downside is that these custom impl aren't compatible.
It would be best if we all adopt the nullary ValueTuple as the standard.

However, for the role of unit we can use a special value: the empty tuple.
In langs that have it, unit type is `()`, and its only value is also `()`.
The empty tuple has no members, so it can only have 1 possible value.
Since it contains no information whatsoever, that's as good as no value.

The empty tuple is `System.ValueTuple`, but we'll follow the FP convention
and alias it (the import) as "Unit" with `using Unit = System.ValueTuple;`

```cs
// Provides static methods for creating value tuples
public struct ValueTuple : 
  IStructuralComparable, 
  IStructuralEquatable, 
  IComparable, 
  IComparable<ValueTuple>, 
  IEquatable<ValueTuple>, 
  ITuple
```


## Currying

This is a function add that takes two parameters and returns the result of adding the two values. When this function is called, the caller must supply both arguments x and y at once:

```cs
Func<int, int, int> add = delegate(int x, int y) {
  return x + y;
};
```

Applying currying to this function means creating a function that accepts only one parameter, returns another function that takes the second parameter, and then returns the result of the addition.

Typically, the order of parameters after the application of currying will be the same as before, although it doesn’t have to be.

This is what the function looks like after currying has been applied:

```cs
Func<int, Func<int, int>> curriedAdd = delegate(int x) {
  return delegate(int y) {
    return x + y;
  }
};
```

The inner function uses the parameter `x` that is a local variable in the outer function, so the compiler creates a **closure** for that variable.


The principles of currying also apply to functions in **lambda syntax**:

```cs
// uncurried
Func<int, int, int> add = (x, y) => x + y;

// curried
Func<int, Func<int, int>> curriedAdd = x => y => x + y;
```


The technique of currying applies to functions with any number of parameters.

uncurried function:    
`Func<...> uf = (par1, par2, ..., parX) => ...;`

curried function:    
`Func<...> cf = par1 => par2 => ... => parX = > ...;`


The code in the body of the lambda expression remains the same during the transformation. The shape of the type changes according to very similar rules.

Consider this original generic delegate type:   
  Func<int, bool, string, decimal, double>
becomes:    
  Func<int, Func<bool, Func<string, Func<decimal, double>>>>



## Automatic Currying
The function `Curry`, which takes another function as a parameter and returns a curried format function:

```cs
public static Func<A, Func<B, F>> Curry<A,B,F>(this Func<A,B,F> f)
=> a => b => f(a, b);
```

The input parameter, `f`, is of type `Func<T1, T2, TR>` and the return type of the `Curry` function is `Func<T1, Func <T2, TR>>`. The shape of the function that is returned follows the same schema as the lambda expressions that have been curried manually.


### Application of Curry
The compiler needs to be able to infer the parameter types and return type of the function from at least one location, so the lack of type annoatations could be a problem.

For example, this won't work:

```cs
// just a method to work with:
int Add(int x, int y) => x + y;

// pass Add to Curry:
var CurriedAdd = Curry(Add); // ERROR
```

There are 2 options to overcome this problem:
1. add generic parameters explicitly to `Curry` call (RHS annotation)
2. declare the type of method indirectly, via helper fn.var (LHS annotation)

```cs
// 1. add generic parameters (RHS annotation)
var fadd = Curry<int, int, int>(Add);

// 2. helper fn variable (LHS annotation)
Func<int,int,int> fadd = Add;

// and then call Curry
var CurriedAdd = Curry(fadd); // OK
```


If the method was not previously created, you can use anonymous function to create it. First, assign a lambda to explicitly annotated variable; then call `Curry` putting the return result into var'ed variable:

```cs
// assign lambda to an annotated variable
Func<int,int,int> Lambda = (x, y) => x + y;

// call Curry
var curriedLambda = Curry(Lambda);
```

Even though `Curry` is a generic function, it is not necessary to pass in the generic parameters explicitly; the compiler infers the generic parameters because the parameter passed into `Curry` is already typed.

For inline use of lambdas, you can pass the generic parameters explicitly:

```cs
var curriedLambda = Curry<int,int,int>((x, y) => x + y);
```
