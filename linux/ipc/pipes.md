# Pipes

Pipes
- Anonymous pipe
- Named pipe

Notes
- `mkfifo` creates a named pipe
- pipes works smoothly only if there both producer and consumer are present
- if there's only a producer, pipe blocks until the consumer reads the data
- if there's only a consumer, pipe blocks until the producer writes the data
