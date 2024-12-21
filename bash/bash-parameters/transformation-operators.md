# Transformation operators

Transformation operators: `UuL QE P Aa Kk`

The form of variable expansion:

    ${parameter@operator}

The expansion is either a transformation of the value of parameter or information about parameter itself, depending on the value of operator. Each operator is a single letter.

<!-- TOC -->

- [U (UPPERCASE)](#u-uppercase)
- [u (Title case)](#u-title-case)
- [L (lowercase)](#l-lowercase)
- [Q (quoted)](#q-quoted)
- [W (dollar-single-quote)](#w-dollar-single-quote)
- [P (prompt string)](#p-prompt-string)
- [A (declaration form)](#a-declaration-form)
- [a (attributes)](#a-attributes)
- [K](#k)
- [k](#k)

<!-- /TOC -->

## U (UPPERCASE)
The expansion is a string that is the value of parameter with lowercase alphabetic characters converted to *UPPERCASE*.

## u (Title case)
The expansion is a string that is the value of parameter with the first character converted to uppercase, if it is alphabetic; i.e. *Title case*.

## L (lowercase)
The expansion is a string that is the value of parameter with uppercase alphabetic characters converted to *lowercase*.

## Q (quoted)
The expansion is a string that is the value of parameter *quoted* in a format that can be reused as input.

## W (dollar-single-quote)
(since bash-v.5.2) The expansion is a string that is the value of parameter with backslash escape sequences expanded as with the `$'…'` quoting mechanism; *dollar-single-quotes*

## P (prompt string)
The expansion is a string that is the result of expanding the value of parameter as if it were a *prompt string*.

## A (declaration form)
The expansion is a string in the form of an *assignment statement* or *declare command* that, if evaluated, will recreate parameter with its attributes and value.

## a (attributes)
The expansion is a string consisting of flag values representing parameter's *attributes*.

## K
Produces a possibly-quoted version of the value of parameter, except that it prints the values of indexed and associative arrays as a sequence of quoted key-value pairs.

## k
(since bash-v.5.2) Like the `K` transformation, but expands the keys and values of indexed and associative arrays to separate words after word splitting.



If parameter is `@` or `*`, the operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@` or `*`, the operation is applied to each member of the array in turn, and the expansion is the resultant list.

The result of the expansion is subject to word splitting and filename expansion as described below.

```bash
var="O'Hara McCarthney"
echo "$var"
# O'Hara McCarthney

echo "${var@Q}"
# 'O'\''Hara McCarthney'
echo "${var@A}"
# var='O'\''Hara McCarthney'

echo "${var@U}"
# O'HARA MCCARTHNEY
echo "${var@u}"
# O'Hara McCarthney
echo "${var@L}"
# o'hara mccarthney
```
