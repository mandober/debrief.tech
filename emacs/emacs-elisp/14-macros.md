14. Macros
  - 14.1 A Simple Example of a Macro
  - 14.2 Expansion of a Macro Call
  - 14.3 Macros and Byte Compilation
  - 14.4 Defining Macros
  - 14.5 Common Problems Using Macros
    - 14.5.1 Wrong Time
    - 14.5.2 Evaluating Macro Arguments Repeatedly
    - 14.5.3 Local Variables in Macro Expansions
    - 14.5.4 Evaluating Macro Arguments in Expansion
    - 14.5.5 How Many Times is the Macro Expanded?
  - 14.6 Indenting Macros


## 14. Macros

https://www.gnu.org/software/emacs/manual/html_node/elisp/Macros.html

Macros enable you to define new control constructs and other language features.

A macro is defined much like a function, but instead of telling how to compute a value, it tells how to compute another Lisp expression which will in turn compute the value. We call this expression the *expansion* of the macro.

>Macros can do this because they operate on the unevaluated expressions for the arguments, not on the argument values as functions do. They can therefore construct an expansion containing these argument expressions or parts of them.


Macro-related functions:
- macrop OBJECT
- macroexpand     FORM &optional ENVIRONMENT
- macroexpand-all FORM &optional ENVIRONMENT
- macroexpand-1   FORM &optional ENVIRONMENT


## 14.1 A Simple Example of a Macro

Suppose we would like to define a *Lisp construct* to increment a variable value. We'd like to write `(inc x)` and have the effect as if `(setq x (1+ x))` was written.

Normally, `(inc x)` is a call to function `inc` with arg `x`, but `x` gets evaluated, so its value is the actual argument; e.g. if x is 4, then this call amounts to `(inc 4)`.

Q: What if we use `'x`? Pass `x` as the symbol that it is. After all, isn't this the case: `'x` refers to the variable and `x` to its value (at least when it is in a correct context). This gives the error: `(wrong-type-argument symbolp 'x)`, so no luck, but why isn't it done like this?

Here's a macro definition that does the job:

    (defmacro inc (var)
      (list 'setq var (list '1+ var)))

When this is called with `(inc x)`, the argument `var` is the symbol `x` - not the value of `x`, as it would be in a function.

The body of the macro uses this to construct the expansion, `(setq x (1+ x))`.

>Once the macro definition returns this expansion, Lisp proceeds to evaluate it
(thus incrementing `x`, as a side effect).


* Function: `macrop OBJECT`

Predicate testing whether its arg is a macro, returning `t`, else `nil`.


## 14.2 Expansion of a Macro Call

A *macro call* looks just like a *function call* in that it is a list whose car is (the name of) the macro. The rest of the elements of the list are the arguments of the macro.

Evaluation of the macro call begins like evaluation of a function call except for one crucial difference: the macro arguments are the actual expressions appearing in the macro call. **They are not evaluated before they are given to the macro definition**. By contrast, the arguments of a function are results of evaluating the elements of the function call list.

Having obtained the arguments, Lisp invokes the macro definition just as a function is invoked. The *argument variables (formal parameters)* of the macro are bound to the *argument values (actual arguments)* from the macro call (or to a list of them in the case of a `&rest` argument). And the *macro body* executes and returns its value just as a *function body* does.

The second crucial difference between macros and functions is that the value returned by the macro body is an alternate Lisp expression, also known as the *expansion of the macro*.
>The Lisp interpreter proceeds to evaluate the expansion as soon as it comes back from the macro.

Since the expansion is evaluated in the normal manner, it may contain calls to other macros. It may even be a call to the same macro, though this is unusual.

Note that Emacs tries to expand macros when loading an uncompiled Lisp file. This is not always possible, but if it is, it speeds up subsequent execution.

You can see the expansion of a given macro call by calling `macroexpand`.

* Function: macroexpand FORM &optional ENVIRONMENT

This function expands FORM, if it is a macro call. If the result is another macro call, it is expanded in turn, until something which is not a macro call results. That is the value returned by `macroexpand`. If FORM is not a macro call to begin with, it is returned as given.

Note that `macroexpand` does not look at the subexpressions of FORM (although some macro definitions may do so). Even if they are macro calls themselves, `macroexpand` does not expand them.

The function `macroexpand` does not expand calls to inline functions. Normally there is no need for that, since a call to an inline function is no harder to understand than a call to an ordinary function.

If ENVIRONMENT is provided, it specifies an *alist of macro definitions that shadow the currently defined macros*. Byte compilation uses this feature.

    (defmacro inc (var)
        (list 'setq var (list '1+ var)))

    (macroexpand '(inc r))
        ⇒ (setq r (1+ r))

    (defmacro inc2 (var1 var2)
        (list 'progn (list 'inc var1) (list 'inc var2)))

    (macroexpand '(inc2 r s))
        ⇒ (progn (inc r) (inc s))  ; inc not expanded here.

* Function: macroexpand-all FORM &optional ENVIRONMENT

`macroexpand-all` expands macros like `macroexpand`, but will look for and expand all macros in FORM, not just at the top-level. If no macros are expanded, the return value is eq to FORM.

Repeating the example used for `macroexpand` above with `macroexpand-all`, we see that `macroexpand-all` does expand the embedded calls to `inc`:

    (macroexpand-all '(inc2 r s))
        ⇒ (progn (setq r (1+ r)) (setq s (1+ s)))

* Function: macroexpand-1 FORM &optional ENVIRONMENT

This function expands macros like `macroexpand`, but it only performs one step of the expansion: if the result is another macro call, `macroexpand-1` will not expand it.


## 14.3 Macros and Byte Compilation

https://www.gnu.org/software/emacs/manual/html_node/elisp/Compiling-Macros.html

You might ask why we take the trouble to compute an expansion for a macro and then evaluate the expansion. Why not have the macro body produce the desired results directly? The reason has to do with compilation.

When a macro call appears in a Lisp program being compiled, the Lisp compiler calls the macro definition just as the interpreter would, and receives an expansion. But instead of evaluating this expansion, it compiles the expansion as if it had appeared directly in the program. As a result, the compiled code produces the value and side effects intended for the macro, but executes at full compiled speed. This would not work if the macro body computed the value and side effects itself-they would be computed at compile time, which is not useful.

In order for compilation of macro calls to work, the macros must already be defined in Lisp when the calls to them are compiled. The compiler has a special feature to help you do this: if a file being compiled contains a defmacro form, the macro is defined temporarily for the rest of the compilation of that file.

Byte-compiling a file also executes any require calls at top-level in the file, so you can ensure that necessary macro definitions are available during compilation by requiring the files that define them (see Features). To avoid loading the macro definition files when someone runs the compiled program, write eval-when-compile around the require calls (see Evaluation During Compilation).


## 14.4 Defining Macros

https://www.gnu.org/software/emacs/manual/html_node/elisp/Defining-Macros.html

>A Lisp macro object is a list whose car is macro and whose cdr is a function.

Expansion of the macro works by applying the function (with `apply`) to the list of unevaluated arguments from the macro call.

It is possible to use an *anonymous Lisp macro* just like an *anonymous function*, but this is never done, because it does not make sense to pass an anonymous macro to functionals such as mapcar. In practice, all Lisp macros have names, and they are almost always defined with the defmacro macro.


## 14.5 Common Problems Using Macros



### 14.5.1 Wrong Time



### 14.5.2 Evaluating Macro Arguments Repeatedly



### 14.5.3 Local Variables in Macro Expansions



### 14.5.4 Evaluating Macro Arguments in Expansion



### 14.5.5 How Many Times is the Macro Expanded?



## 14.6 Indenting Macros
