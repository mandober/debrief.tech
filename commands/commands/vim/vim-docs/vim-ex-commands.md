# Vim ex commands

- :q[uit]!          Quit vim. Force quit vim (!)
- :w[rite]!         Write out current buffer (if it has assoc. file)
- :write {file}     Write out current buffer as file
- :e[dit] {file}    Open file for editing
- :r[ead] {file}    Read in file contents in the current buffer

- :source %         Source current file (`%` current file symbol)
- :40vs +Ex[plore]  Open netrw browser in vsplit, 40 chars wide

- :buffers          List buffers
- :ab[breviations]  List abbreviations
- :scriptnames      List all loaded scripts in Vim and their paths

- :8g8              Find illegal byte sequences in UTF-8 encoded file


  q:           history command-line (list, edit, re-execute)
  q/           history search-forward (list, edit, re-execute)
  q?           history search-backward (list, edit, re-execute)
