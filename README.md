DWGridController
================

The DWGridController allows you to display cells in a grid view where rows and columns can be (infinitely) scrolled seperatly

The project is a work in progress, so bear with me... The biggest flaw right now is a bug that sometimes occurs when the modulus of the Grid View's frame and the number of columns / rows isn't equal to 0. In other words, the cell width & hight should preferably be a whole value. 

Priorities:
- Prettify code
- Merge duplicate code
- Improve subclassing support
- Fix rounding errors