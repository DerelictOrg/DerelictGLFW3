DerelictGLFW3
=============

A dynamic binding to [GLFW 3](http://www.glfw.org/) for the D Programming Language.

For information on how to build DerelictGLFW3 and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

For information on how to load the GLFW 3 library via DerelictGLFW3, see the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki. In the meantime, here's some sample code.

```D
import derelict.glfw3.glfw3;

void main() {
    // Load the GLFW 3 library.
    DerelictGLFW3.load();
    
    // Now GLFW 3 functions can be called.
    ...
}
```
