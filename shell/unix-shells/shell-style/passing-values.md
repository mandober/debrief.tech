# Shell style :: Passing values

Shell functions can pass around a value in several ways, except in the most fundamental way - by returning it. Shell functions are peculiar kinds of functions in that their return value can only be 1 byte interpreted as an unsigned number (0-255) that represents an exit code.

## Passing the payload

Passing around values
- producer returns the payload directly (exit code as payload)
- producer prints the payload, consumer captures it
- producer saves the payload into a designated variable (functions only)
- producer saves the payload to file (or fifo), consumer reads it


## Exit code

The returned value of executables is called an *exit code*, and the returned value of functions is called a *return code* although they mean the same.

The exit code of 0 represents success (i.e. the operation was performed without errors), while all the other (positive) numbers represent errors. However, there is no standard as to what number stands for what error - it is left to the utility authors to specify and document.

## Predicate functions

Because a shell function can only return a (byte sized) unsigned number in the range 0-255, we can sometimes abuse the convention (especially for private functions) and interpet it as the actual payload of a function. **Predicates** are especially amenable for this since they return a Boolean, and we can very well express the two Boolean values with a number.

```bash
# instead of:
predicate          # call the function
x=$?               # capture its return code
if [[ x ]]; then   # test it

# with predicates we can just do this directly:
if [[ predicate ]]; then …
```

The shell variable `$?` is special - it contains the exit code of the last thing that was executed. It is crucial to test it (or capture it) as soon as possible, before another execution overwrites it with its own exit code.

In general, a predicate is a function that returns a Boolean - it is usually used to perform some check or test and signal back whether it passed or not. Generally, the return value 'true' signals success (check passed), and 'false' signals failure (check failed). In shell scripting we don't really have too many types - not even Booleans - so we have to make do. Fortunately, the only thing we can return forma shell function is sufficient to encode both Boolean values, so (following the standard), the return value (actually an exit code) 0 can represent 'true', while 1 can represent 'false'. We can even use the other numbers (2-255) to represent the types of errors, although that is usually an overkill; predicates should be simple functions that just signal whether we have something or not, and we're not usually interested in the reasons why not.

Predicate families
- `is_*`
- `has_*`


## Other types of functions

Only if function's return value is the `u8` number type (i.e. unsigned number type with values in the range 0 - 255), can we abuse the convention and interpret a function's return value directly as a payload - in which case we have to implemnt some other way of signaling errors.

All other types of functions cannot use this approach. They need to pass their payload some other way.

The usual way this is done is to have a function output its payload to stdout. This means the payload must be first *serialized* to a string (next to numbers, string is basically the only other shell type). Then, a utility (usually another function) that wants to use that payload needs to capture it.

Capture the payload:

```bash
# Call getHost function that "returns" the hostname
getHost
# but this just prints the hostname to stdout - we cannot use it

# To get a hold of the output, we must capture it:
x=$(getHost)
# or, using the old syntax:
x=`getHost`
```

Asembling a pipeline of utilities does the same thing - the first utility prints the payload to stdout, the next utility captures it via its stdin.

Pipeline:

```
┌────────┴────────┐
│        ⁰        ├─ ³ ─→
│                 ├─ … ─→
│   ₁          ₂  ├─ ⁹ ─→
└───┬──────────┬──┘
    ↓          ↓
    └────┬←┈┈ᴬ┈┼┈ᴮ┈┈→ /dev/null
         ↓     ↓ᴰ
┌────────┴─────┴──┐
│        ⁰     ³  │
│   ₁          ₂  │
└───┬──────────┬──┘
    ↓          ↓
```

A utility always gets the 3 standard FDs: stdin (fd0), stdout (fd1) and stderr (fd2), but it can associate 7 more (fd3 to fd9) safely. It can actually assiociate a whole lot more than these 10, but there may be issues with FDs with a number larger than 9.

The obvious problem is that there are 2 outputs (stdout for the payload and stderr for errors), but only 1 input (stdin). Bash has operators to make both outputs (stdout and stderr) go to the same place (_A_) - usually to the receiving utility's stdin, in which case it may be difficult for the receiving utility to manage, or even to know, what is the payload and what are errors. When the possible errors are not important, it is common to discard them by redirecting stderr to /dev/null (_B_). If the errors are significant, but you don't want to send both the payload and possible errors to the same stdin, you can associate another input FD to the receiving utility (_D_).
