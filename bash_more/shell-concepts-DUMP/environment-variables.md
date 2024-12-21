# Environment Variables

environment variables (ev)
* ev properties
  - owner
  - scope
  - extent
  - specificity
  - usage: crucial, preferential

Environment variables: common division
- System
- User

The most common division of evs is to broadly classify them as system and user evs. System is the operating system as a whole, which implies that the scope of ev is system-wide. On the other hand, the priority of sevs is low.

The broader the scope, the lower the priority.
The more general the purpose, the lower the priority. 

However, there is often a broader and more granular system of division based on priority and ranging from very general to very specific 


## Hierarchical system of priorities

The most useful environment variables are often placed in a system that offers more granularity regarding different
- value: default, admin value, per-machine, network, user
- attributes: 
- scope: machine, sys, user, app
- validity/extent: always, under particular set of conditions
- priority: default |> system |> user |> app

First, an important ev should have an universal default value; universal meaning safe and reasonable across different machines, OS variants, users, apps that may pick it up deliberately or by accident.

levels:
-    all machines vs specific machine
- all OS varsions vs specific OS varsion
-      all admins vs specific admin
-       all users vs specific user
-        all apps vs specific app

SCOPE (AND and OR rules of scoping)
- per-machine
- per-OS: OS version, OS variant, OS flavor
- per-authority: admin, regular-user, guest
- per-appliance: app, command, alias, shell function
- per-directory: active only under a specific directory
- per-session
