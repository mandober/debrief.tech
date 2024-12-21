# Tips

# REISUB

On the keyboard, `SysRq` key can emit some special actions

R reset
E
I
S
U
B

Only on proper Linux (doesn't work on VM)
- `Alt+SysRq+K` will stop all processes on current tty
- `Alt+SysRq+RK` on X server

```bash
# generate random UUID
sysctl -n kernel.random.uuid
# cb53bb18-203c-40b0-a41d-ef335f7d4881

# mark the file append only (proper linux only, no VMs)
chattr +a .bashrc
```
