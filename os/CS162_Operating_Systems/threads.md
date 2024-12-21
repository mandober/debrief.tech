# Threads

- What are threads?
- Where should we implement threads? In the kernel? In a user level threads package?
- How should we schedule threads (or processes) onto the CPU?

## Processes versus Threads
- A process defines the address space, text, resources, etc.
- A thread defines a single sequential execution stream within a process (PC, stack, registers)
- Threads extract the *thread of control* information from a process
- Threads are bound to a single process
- Each process may have multiple threads of control within it
  - the address space of the process is shared among its threads
  - no system calls are required to enforce thread cooperation
  - threads are simpler than message passing and shared-memory

*Forking a thread* can be realized as a system call (to kernel code), or a procedure call to a thread library (user code).

## Kernel Threads

A kernel thread, also known as a *lightweight process*, is a thread
that the OS knows about.

Switching between kernel threads of the same process requires a *"smaller" context switch*:
- values of registers, PC, and stack pointer (SP) must be saved
- memory management information does not need to be changed (saved) since the threads share an address space

The kernel must manage and schedule threads (as well as processes), but it can use the same process scheduling algorithms.

>Switching between kernel threads is slightly faster than switching between processes.

## User-Level Threads

A user-level thread is a thread that the OS does not know about; the OS only knows about the process containing the threads. The OS only schedules the process, not the threads within the process.

The programmer uses a *thread library* to manage threads (create, delete, synchronize, schedule).

Advantages of user-level threads:
- There is no context switching when switching threads
- *User-level thread scheduling* is more flexible
- user-level code can define a problem-dependent thread-scheduling policy
- Each process might use a different scheduling algorithm for its own threads.
- A thread can voluntarily give up the processor by telling the scheduler it will yield to other threads.
- User-level threads do not require system calls to create them, or context switches to move between them
- Thread management calls are library calls and much faster than system calls made by kernel threads.
- User-level threads are typically much faster than kernel threads.

Disadvantages of user-level threads:
- Since OS does not know about the existence of the user-level threads, it may make poor scheduling decisions
- It may run a process that only has idle threads
- If a user-level thread is waiting for I/O, the entire process will wait
- *Solving this problem requires communication between the kernel and the user-level thread manager*
- Since OS just knows about the process, it schedules the process the same way as other processes, regardless of the number of user threads
- For kernel threads, the more threads a process creates, the more time slices the OS will dedicate to it.

## Threading Models

- many-to-one,  u:1, many user threads mapped to 1 kernel thread
- one-to-one,  1:1,  one user thread  mapped to 1 kernel thread
- many-to-many, u:k, many user threads mapped to many kernel threads
- two-level is like many-to-many model, except it also includes 1:1

## Thread Libraries

- Thread library provides programmer with API for creating and managing threads
- Two primary ways of implementing
  - Library entirely in user space
  - Kernel-level library supported by the OS

## Pthreads

- May be provided either as user-level or kernel-level
- A POSIX standard (IEEE 1003.1c) API for thread creation and synchronization
- API specifies behavior of the thread library, implementation is up to development of the library
- Common in UNIX operating systems (Solaris, Linux, Mac OS X)
- WIN32 Threads: Similar to Posix, but for Windows

## Java Threads

- Java threads are managed by the JVM
- Typically implemented using the threads model provided by underlying OS
- Java threads may be created by:
  - Extending `Thread` class
  - Implementing the `Runnable` interface

## Examples


Pthreads:

    pthread_attr_init(&attr); /* set default attributes */
    pthread_create(&tid, &attr, sum, &param);

Win32 threads:

    ThreadHandle = CreateThread(NULL, 0, Sum, &Param, 0, &ThreadID);

Java Threads:

    Sum sumObject = new Sum();
    Thread t = new Thread(new Summation(param, SumObject));
    t.start(); // start the thread 

## Summary

- Thread: a single execution stream within a process
- Switching between user-level threads is faster than between kernel threads since a context switch is not required.
- User-level threads may result in the kernel making poor scheduling decisions, resulting in slower process execution than if kernel threads were used.
- Many scheduling algorithms exist. Selecting an algorithm is a policy decision and should be based on characteristics of processes being run and goals of operating system (minimize response time, maximize throughput, etc.).

## Lecture 7: Synchronization and Locks
https://www.youtube.com/watch?v=sYBfnDUsvrc&list=PLacuG5pysFbDQU8kKxbUh4K5c1iL5_k7k&index=7

**Synchronization primitives** are required to ensure that only one thread executes in a *critical section* at a time.

## Synchronization Terminology

**Synchronization**: use of atomic operations to ensure cooperation
between threads.

**Mutual Exclusion**: ensure only one thread has access to a resource, preventing other threads to access that resource (while the thread has a lock on it).

**Critical Section**: is a contiguous code that needs to be executed atomically. Piece of code that only one thread can execute at a time.

**Lock**: mechanism to prevent another process from doing something. A lock is issued before entering a critical section, before accessing a shared resource. The resource is unlocked when leaving the critical section or when access to shared data is complete. A process that wants access to a locked resource waits until the resource is released.

All synchronization involves waiting.

**Safety property** ensures nothing bad happens.

**Liveness property** ensures progress can be made (no deadlocks).

**Busy waiting** - when a thread is consuming CPU resources without doing any useful work.

**Atomic operation** - an operation that can be completed without interrupts of any kind.

**Deadlock**: the condition that occurs when two threads are busy waiting for the other one to release a resource they need.

## Too Much Milk: Solution 3

```c
//  Thread A                     Thread B
A1: leave_note A;            B1: leave_note B;
A2: while (Note B) {         B2: if (! Note A) {
A3:   do nothing;            B3:   if (! Milk) {
    }                        B4:     buy milk;
A4: if (! Milk) {                  }
A5:   buy milk;                  }
    }                        B5: remove note B;
A6: remove note A;
```

A2 and B2 are moments of interest: 
anyway, since thread A loops, it waits for B to buy milk or not, and then if B did not buy it, it buys the milk.

Is Solution 3 a good solution?
- It is too complicated - it was hard to convince ourselves this solution works.
- It is asymmetrical - thread A and B are different. Thus, adding more threads would require different code for each new thread and modifications to existing threads.
- A is busy waiting - A is consuming CPU resources despite the fact that it is not doing any useful work.
- This solution relies on loads and stores being atomic.

## Locks

**Locks**: provide mutual exclusion to shared data with two atomic routines:
- `Lock.Acquire` - wait until lock is free, then grab it.
- `Lock.Release` - unlock, and wake up any thread waiting in `Acquire`.

Rules for using a lock:
- always acquire the lock before accessing shared data.
- always release the lock after finishing with shared data.
- lock is initially free

Implementing Too Much Milk with Locks

```c
// Thread A                 Thread B
Lock.Acquire();             Lock.Acquire();
if (noMilk){                if (noMilk){
  buy milk;                   buy milk;
}                           }
Lock.Release();             Lock.Release();
```

- This solution is clean and symmetric.
- How do we make `Lock.Acquire` and `Lock.Release` atomic?

Hardware Support for Synchronization
- Implementing high level primitives requires low-level hardware support

## Implementing Locks By Disabling Interrupts

There are two ways the CPU scheduler gets control:
- *Internal Events*: the thread does something to relinquish control (e.g. I/O).
- *External Events*: interrupts (e.g. time slice) cause the scheduler to take control away from the running thread.

On uniprocessors, we can prevent the scheduler from getting control as follows:
- *Internal Events*: prevent them by not requesting any I/O operations during a critical section.
- *External Events*: prevent them by disabling interrupts (i.e. tell the hardware to delay handling any external events until after the thread is finished with the critical section).

Implementing Locks by Disabling Interrupts
- For uniprocessors, we can disable interrupts for high-level primitives like locks, whose implementations are private to the kernel.
- The kernel ensures that interrupts are not disabled forever, just like it already does during interrupt handling.

```java
class Lock {
  public:
    void Acquire();
    void Release();
  private:
    int value;
    Queue Q;
}

Lock::Lock() {
  value = 0;   // lock is free
  Q = 0;       // queue is empty
}

Lock::Acquire(Thread T) {
  // syscall: kernel execs this
  disable interrupts;
  if (value == BUSY) {
    add T to Q;
    put T to Sleep;
  } else {
    value = BUSY;
  }
  enable interrupts;
}

Lock::Release() {
  disable interrupts;
  if (queue not empty) {
    take thread T off Q;
    put T on ready queue;
  } else {
    value = FREE;
  }
  enable interrupts;
}
```

## Atomic read-modify-write Instructions

*Atomic read-modify-write instructions* atomically read a value from memory into a register and write a new value.
- Straightforward to implement simply by adding a new instruction on a uniprocessor.
- On a multiprocessor, the processor issuing the instruction must also be able to invalidate any copies of the value the other processes may have in their cache, i.e. the multiprocessor must support some type of *cache coherence*.

Examples:
- Test and Set: (most architectures) read a value, write '1' back to memory.
- Exchange: (x86) swaps value between register and memory.
- Compare and Swap: (68000) read value, if value matches register value r1, exchange register r2 and value.

## Summary

- Communication among threads is typically done through shared variables.
- Critical sections identify pieces of code that cannot be executed in parallel by multiple threads, typically code that accesses and/or modifies the values of shared variables.
- Synchronization primitives are required to ensure that only one thread executes in a critical section at a time.
- Achieving synchronization directly with loads and stores is tricky and errorprone
- Solution: use high-level primitives such as locks, semaphores, monitors

## Semaphores

Semaphores are basically generalized locks. Like locks, semaphores are a special type of variable that supports two atomic operations and offers elegant solutions to synchronization problems. They were invented by Dijkstra in 1965.

**Semaphore**: an integer variable that can be updated only using two special atomic instructions.

**Binary (or Mutex) Semaphore**: (same as a lock): guarantees mutually exclusive access to a resource - only one process is in the critical section at a time. Can vary from 0 to 1. It is initialized to free (value = 1).

**Counting Semaphore:**: Useful when multiple units of a resource are available. The initial count to which the semaphore is initialized is usually the number of resources. A process can acquire access so long as at least one unit of the resource is available.

Like locks, a semaphore supports two atomic operations:
- `Semaphore.Wait()` wait until semaphore S is available 
- `Semaphore.Signal()` signal to other processes that semaphore S is free

Each semaphore supports a queue of processes that are waiting to access the critical section (e.g. to buy milk). If a process executes `S.Wait()` and semaphore S is free (non-zero), it continues executing. If semaphore S is not free, the OS puts the process on the wait queue for semaphore S. A `S.Signal()` unblocks one process on semaphore S's wait queue.

```cpp
class Semaphore {
  public:
    void Wait(Process P);
    void Signal();
  private:
    int value;
    Queue Q; // queue of processes;
}

Semaphore(int val) {
  value = val;
  Q = empty;
}

Wait(Process P) {
  value = value - 1;
  if (value < 0) {
    add P to Q;
    P->block();
  }
}

Signal() {
  value = value + 1;
  if (value <= 0) {
    remove P from Q;
    wakeup(P);
  }
}
```

Signal and Wait must be atomic! Use interrupts or test&set to ensure atomicity.


Semaphores are a huge step up from the equivalent load/store implementation, but have the following drawbacks:
- They are essentially shared global variables.
- There is no linguistic connection between the semaphore and the data to which the semaphore controls access.
- Access to semaphores can come from anywhere in a program.
- They serve two purposes, mutual exclusion and scheduling constraints.
- There is no control or guarantee of proper usage.

Solution: use a higher level primitive called monitors.

## Monitor

A **monitor** is similar to a class (object) in that it ties the data, operations, and in particular, the synchronization operations, together.

Unlike classes
- monitors guarantee mutual exclusion, i.e. only one thread may execute a given monitor method at a time.
- monitors require all data to be private.

A Monitor defines a *lock* and zero or more *condition variables* for managing concurrent access to shared data.
- The monitor uses the lock to insure that only a single thread is active in the monitor at any instance.
- The lock also provides mutual exclusion for shared data.
- Condition variables enable threads to go to sleep inside of critical sections, by releasing their lock at the same time it puts the thread to sleep.

Monitor operations:
- Encapsulates the shared data you want to protect.
- Acquires the mutex at the start.
- Operates on the shared data.
- Temporarily releases the mutex if it cannot complete.
- Reacquires the mutex when it can continue.
- Releases the mutex at the end.

## Condition Variables

How can we change `remove()` to wait until something is on the queue?
- Logically, we want to go to sleep inside of the critical section
- But if we hold on to the lock and sleep, then other threads cannot access the shared queue, add an item to it, and wake up the sleeping thread. The thread could sleep forever

Solution: use condition variables
- Condition variables enable a thread to sleep inside a critical section
- A lock held by a thread is atomically released when the thread is put to sleep

**Condition variable**: is a queue of threads waiting for something inside a critical section.

Condition variables support 3 operations:
1. `Wait`(Lock the lock): atomic (release lock, go to sleep), when the process wakes up it re-acquires lock.
2. `Signal`(): wake up waiting thread, if one exists. Otherwise, it does nothing.
3. `Broadcast`(): wake up all waiting threads.

Rule: thread must hold the lock when doing condition variable operations.

## Mesa versus Hoare Monitors

What should happen when signal() is called?
- No waiting threads => the signaler continues and the signal is effectively lost (unlike what happens with semaphores).
- If there is a waiting thread, one of the threads starts executing, others must wait

**Mesa-style**: (Nachos, Java, and most real OSs)
- The thread that signals keeps the lock (and thus the processor).
- The waiting thread waits for the lock.

**Hoare-style**: (most textbooks)
- Thread that signals gives up the lock and the waiting thread gets the lock.
- When the thread that was waiting and is now executing exits or waits again, it releases the lock back to the signaling thread.

The synchronized queuing example above works for either style of monitor, but we can simplify it for Hoare-style semantics:
- Mesa-style: the waiting thread may need to wait again after it is awakened, because some other thread could grab the lock and remove the item before it gets to run.
- Hoare-style: we can change the 'while' in Remove to an 'if' because the waiting thread runs immediately after an item is added to the queue.




## Lecture 9: Readers and Writers

Synchronization for Readers/Writers Problem

An object is shared among may threads, each belonging to one of two classes:
- Readers: read data, never modify it
- Writers: read data and modify it

Using a single lock on the data object is overly restrictive.

Want many readers reading the object at once
- Allow only one writer at any point
- How do we control access to the object to permit this protocol?

Correctness criteria:
- Each read or write of the shared data must happen within a critical section.
- Guarantee mutual exclusion for writers.
- Allow multiple readers to execute in the critical section at once.

## Dining Philosophers

Concurrency problem: five philosophers sit at a circular table with five bowls of spaghetti and five forks. A philosopher can just sit thinking, but whilst they think they get hungry. To eat, a philosopher needs two forks.

How to solve to maximize concurrency while avoiding deadlocks or starvation?

A solution
- Try to pick up two closest forks
- Block if neighbor has already picked up a fork
- After eating, put down both forks and go back to thinking

The problem is if all philosophers pick left fork, they will starve waiting for the other fork. A better solution is needed. We need to avoid the situation where only one fork is locked - either both forks or none.

## Real-world Examples

Producer-consumer
- Audio-Video player: network and display threads; shared buffer
- Web servers: master thread and slave thread

Reader-writer
- Banking system: read account balances versus update

Dining Philosophers
- Cooperating processes that need to share limited resources

Set of processes that need to lock multiple resources
- Disk and tape (backup)

Travel reservation:
- hotel, airline, car rental databases

## Summary

Readers/writers problem:
- Allow multiple readers to concurrently access a data
- Allow only one writer at a time

Two possible solutions using semaphores
- Favor readers
- Favor writers

Starvation is possible in either case!

Dining philosophers: 
- mutually exclusive access to multiple resources

## Deadlocks

**Deadlock**: a condition where two or more threads are waiting for an event that can only be generated by these same threads. Deadlock can occur when several threads compete for a finite number of resources simultaneously.

*Deadlock prevention* algorithms check resource requests and possibly availability to prevent deadlock.

*Deadlock detection* finds instances of deadlock when threads stop making progress and tries to recover.

*Deadlock avoidance* algorithms resource requests and availability at runtime to avoid deadlocks.

**Starvation** occurs when a thread waits indefinitely for some resource, but other threads are actually using it (making progress). Starvation is a different condition from deadlock.

## Necessary Conditions for Deadlock

Deadlock can happen if all the following conditions hold:
- *Mutual Exclusion*: at least one thread must hold a resource in nonsharable mode, i.e. the resource may only be used by one thread at a time.
- *Hold and Wait*: at least one thread holds a resource and is waiting for other resource(s) to become available. A different thread holds the resource(s).
- *No Preemption*: A thread can only release a resource voluntarily; another thread or the OS cannot force the thread to release the resource.
- *Circular wait*: A set of waiting threads `{t₁, …, tₙ}` where `tᵢ` is waiting on `tᵢ﹢₁`, i=1..n, and `tₙ` is waiting on `t₁`.

## Deadlock Prevention

Prevent deadlock: ensure that at least one of the necessary conditions doesn't hold.
1. Mutual Exclusion:
  - make resources sharable (but not all resources can be shared)
2. Hold and Wait:
  - Guarantee that a thread cannot hold one resource when it requests another
  - Make threads request all the resources they need at once 
    and make the thread release all resources before requesting a new set.
3. No Preemption:
  - If a thread requests a resource that cannot be immediately allocated to it,
    then the OS preempts (releases) all the resources that the thread is currently holding.
  - Only when all of resources are available, will the OS restart the thread.
  - Problem: not all resources can be easily preempted, like printers.
4. Circular wait:
  - impose an ordering (numbering) on the resources and request them in order.

## Deadlock Prevention with Resource Reservation

- Threads provide advance information about the maximum resources they may need during execution
- Define a sequence of threads `{t₁, …, tₙ}` as safe if for each `tᵢ`, the resources that `tᵢ` can still request can be satisfied by the currently available resources plus the resources held by all `tⱼ`, where j < i.
- A *safe state* is a state in which there is a safe sequence for the threads.
- An *unsafe state* is not equivalent to deadlock, it just may lead to deadlock, since some threads might not actually use the maximum resources they have declared.
- Grant a resource to a thread is the new state is safe.
- If the new state is unsafe, the thread must wait even if the resource is currently available.
- This algorithm ensures no circular-wait condition exists.

## Banker's Algorithm

- This algorithm handles multiple instances of the same resource.
- Force threads to provide advance information about what resources they may need for the duration of the execution.
- The resources requested may not exceed the total available in the system.
- The algorithm allocates resources to the requesting thread if the allocation leaves the system in a safe state.
- Otherwise, the thread must wait.
