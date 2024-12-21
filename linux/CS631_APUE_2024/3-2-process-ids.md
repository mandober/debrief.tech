# Week 3 Segment 2 - UIDs and GIDs

Every process has 6 or more IDs associated with it
- who we really are
  - real user ID
  - real group ID
- used for file access permission checks
  - effective user ID
  - effective group ID
  - supplementary group IDs
- saved by exec functions
  - saved set-user-ID
  - saved set-group-ID

Whenever a file is setuid, set the effective user ID to `st_uid`. 

Whenever a file is setgid, set the effective group ID to `st_gid`

`st_uid` and `st_gid` always specify the owner and group owner of a file, regardless of whether it is setuid/setgid.
