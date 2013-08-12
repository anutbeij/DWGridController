DWGridController
================

The DWGridController allows you to display cells in a grid view where rows and columns can be (infinitely) scrolled separately.

The project is a work in progress, so bear with me... It is, however, very much usuable for most situations with possibly a little bit of tweaking. The biggest flaw right now is a bug that sometimes occurs when the modulus of the Grid View's frame and the number of columns / rows isn't equal to 0. In other words, the cell width & hight should preferably be a whole value. 

Priorities:
- Prettify code
- Merge duplicate code
- Improve subclassing support
- Fix rounding errors
 
 
LICENSE
=======
Copyright (c) 2013 Devwire

 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
