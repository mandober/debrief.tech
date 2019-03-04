# Hierarchy

* Tokens and symbols
  * Identifiers
    * Keywords
      * Reserved keywords
        - char, bool, true, false
        - byte, sbyte, short, ushort, int, uint, long, ulong
        - double, float, decimal
        - string, null, object
        - do, while, if, else, for, in, foreach, switch, case
        - return, throw, break, continue, goto
        - try, catch, finally
        - as, is
        - public, private, protected, internal
        - checked, unchecked
        - out, ref, params
        - namespace, class, struct, enum, delegate, event, interface
        - operator, explicit, implicit
        - readonly, abstract, default, extern, const, static
        - fixed, lock, override, sealed, base
        - this, new, stackalloc, sizeof
      * Contextual keywords
        - async, await, yield
        - nameof
        - var
        - dynamic
        - global
        - let
        - on
        - partial
        - value
        - ascending, descending
        - select, equals, group, by, orderby, from, add
        - when, where, join, into, remove
        - get, set
      * Keywords (reserved and contextual combined)
        * Value types
          - char
          - bool
          - byte, sbyte, short, ushort, int, uint, long, ulong
          - double, float, decimal
        * Reference types
          - string
          - null
          - object
        * Flow control:
          * Conditional:
            - do, while, if, else, for, in, foreach
            - switch, case
            - break, continue
          * Unconditional:
            - goto
            - return
            - yield
          * Error control:
            - try, catch, finally
            - throw
        * Operators
          - as
          - is
          - sizeof
          - nameof
          - true, false
        * Identifiers
          - extern
          - var
          - let
          - dynamic
          - const
          - static
          - readonly
        * Variables:
          - out
          - ref
          - params
          - stackalloc
          - lock
          - fixed
        * Values
          - new
          - default
          - checked, unchecked
        * Classes:
          - this
          - base
          - abstract
          - sealed
          - partial
        * Methods:
          - async, await, yield
          - where
          - get, set, value
          - operator, explicit, implicit
          - override
          - partial
        * Access:
          - public, private, protected, internal
          - private internal, private protected
        * Language Items
          - namespace
          - class
          - struct
          - enum
          - delegate
          - event
          - interface
        * LINQ:
          - select, equals, add
          - group, by, orderby
          - when, join, remove
          - ascending, descending
          - where
          - global
          - from
          - into
          - on
    - Names (identifiers as names)
      - name, `[_a-zA-Z][a-zA-Z_0-9]*`
      - keyword as name, `@keyword`
      - unicode identifier, `char \u0065 = 'e'`
  * Punctuation characters
    - block: braces
    - label: identifier followed by a colon, `label:`
  * Special characters
    - Verbatim identifier character, `@`
    - Interpolated string character, `$`
  * Comments
    - Syntax comments
      - single-line, `//`
      - multiline comments, `/* ... */`
    - Doc comments (also IDE tooltips)
      - single-line, `///`
      - multiline comments, `/** ... */`
  * Attributes, `[Test]`
  * Preprocessor directives, `#endregion`
  * Operators
  * Literals
    - numeric literal
      - number literal
      - suffix literal
      * Numeric style
        - decimal number literal
        - hex number literal
        - scientific number literal
    - Character literal
    - String literals
      - plain strings literals
      - verbatim string literals (with @ prefix)
  * Variables
    - global (static) variables
    - local variables
    - arguments
    - parameters
      - value parameter
      - reference parameter, `ref`
      - output parameter, `out`
      - variable (arity) parameter, `params`
  * Constants, `const int c = 3`
  * Flow
    - Loops
      - for
      - while
      - do...while
    - Conditionals
      - Null-conditional
  * Expressions
    - expression-bodied block, `... => expr;`
  * Statements
    - code block
    - labelled code block
    - statement block, `{}`
  * Values
    - Value types, `int num = 42`
      - Boxing scalars, `var boxed = (object) num`
      - Unboxing scalars, `var num = (int) boxed`
    - Reference types, `List<int> list = new List<int> { 1, 2, 3}`
      - pointer types (only in unsafe mode), `int* ip = &num`
* Modifiers
  * Access modifiers:
    - private
    - public
    - protected
    - internal
    - private internal
    - protected internal
  * Parameter modifiers:
    - ref
    - out
    - params
  * Storage modifiers:
    - static
    - extern
  * Mutability modifiers:
    - readonly
    - const
  * Other modifiers:
    - partial
    - abstract
    - new (value that can be instantiated)
    - struct (value modifier)


* Class properties
  - class modifiers
  - class identifier (class name)
* Class members
  - attributes
  - fields
    - instance fields
    - static fields
* Methods
  - Main method
  - properties (getter/setters)
  - static methods
  - constructors
  - deconstructor (DCONS), `Deconstruct`
  - destructor (DTOR)
  - indexers
* Generics
  - generic type parameter
  - generic constraints


* Items
  - types
  - namespace, `namespace nsName`
  - using directive:
    - `using nsName`
    - `using ns = nsName`
    - `using static nsWithStaticClass`


  events
  indexers
  finalizers
  static

- types
- input type
- output/return type
- class
- namespace
- assembly
- events
- indexers
- finalizers


Language
- Environment
- Program Structure
- Basic Syntax
- Data Types
- Type Conversion
- Variables
- Constants
- Operators
- Decision Making
- Loops
- Encapsulation
- Methods
- Nullables
- Arrays
- Strings
- Structure
- Enums
- Classes
- Inheritance
- Polymorphism
- Operator Overloading
- Interfaces
- Namespaces
- Preprocessor Directives
- Regular Expressions
- Exception Handling
- File I/O
- Attributes
- Reflection
- Properties
- Indexers
- Delegates
- Events
- Collections
- Generics
- Anonymous Methods
- Unsafe Codes
- Multithreading


Anonymous Methods
Arrays
Attributes
Basic Syntax
Classes
Collections
Constants and Literals
Data Types
Decision Making
Delegates
Encapsulation
Enums
Environment
Events
Exception Handling
File I/O
Generics
Indexers
Inheritance
Interfaces
Loops
Methods
Multithreading
Namespaces
Nullables
Operator Overloading
Operators
Overview
Polymorphism
Preprocessor Directives
Program Structure
Properties
Reflection
Regular Expressions
Strings
Structures
Type Conversion
Unsafe Codes
Variables
