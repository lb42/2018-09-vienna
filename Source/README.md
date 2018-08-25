# Source files
Place only TEI XML files in this folder, please. Place (generated) presentation versions in the folder ../Slides

The recommended convertor is *teitoslides*, which goes via LaTeX to PDF, but other methods
(e.g. Slidy) also work. See further https://github.com/lb42/TEIslides

Graphics file are a headache. LaTeX requires them to be in local storage, so `<graphic
url="https://whatever"/>` won't work. I cheat by creating a link to the right directory in local
storage, (like this: `ln -s ../2016-08-vilnius/images Images`) but I don't think github likes that much.





