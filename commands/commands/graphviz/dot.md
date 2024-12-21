# DOT (graph description language)

https://en.wikipedia.org/wiki/DOT_(graph_description_language)
https://www.graphviz.org/documentation/

DOT is a graph description language. DOT graphs are typically files with the filename extension `*.gv` or `*.dot`.

Various programs can process DOT files. Some, such as `dot`, `neato`, `twopi`, `circo`, `fdp`, `sfdp`, can read a DOT file and render it in graphical form.

Others, such as `gvpr`, `gc`, `acyclic`, `ccomps`, `sccmap`, `tred`, read DOT files and perform calculations on the represented graph.

Finally, others, such as `lefty`, `dotty`, `grappa`, provide an interactive interface. The `GVedit` tool combines a text editor with noninteractive image viewer. Most programs are part of the *Graphviz* package or use it internally.

dot draws directed graphs as hierarchies


## Syntax

### Graph types



#### Undirected graphs


#### Directed graphs


### Attributes


### Comments


## Layout programs

The DOT language defines a graph, but does not provide facilities for rendering the graph. There are several programs that can be used to render, view, and manipulate graphs in the DOT language:

* General
  - `Graphviz` libraries and utilities to manipulate and render graphs
* JavaScript
  - `Canviz` library for rendering DOT files
  - `d3-graphviz` library based on `Viz.js` and `D3.js` that renders DOT graphs and supports animated transitions between graphs and interactive graph manipulation
  - `Vis.js` library that accept DOT as input for network graphs
  - `Viz.js` Graphviz port providing a wrapper for browser rendering
  - `hpcc-js/wasm` Graphviz a fast WASM library for Graphviz similar to `Viz.js`
* Other
  - `Beluging` Python- & Google Cloud Platform-based viewer of DOT and Beluga extensions
  - `dot2tex` a program to convert files from DOT to PGF/TikZ or PSTricks, both of which are rendered in LaTeX




## Resources

* graphviz

Docs
https://www.graphviz.org/documentation/

Attributes
https://www.graphviz.org/doc/info/attrs.html

Arrow Shapes
https://www.graphviz.org/doc/info/arrows.html

Gallery
https://www.graphviz.org/gallery/

Playground
http://magjac.com/graphviz-visual-editor/

* Huffman trees   
http://huffman.ooz.ie/    
Webapp generating DOT descriptions of Huffman trees

* `Agl` - Automatic Graph Layout   
https://rise4fun.com/agl   
Agl is built on the principle of the Sugiyama scheme; it produces so called layered, or hierarchical layouts. This kind of a layout naturally applies to graphs with some flow of information.
