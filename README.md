DerelictGLFW3
=============

A dynamic binding to [GLFW 3][1] for the D Programming Language.

For information on how to build DerelictGLFW3 and link it with your programs, please see the post [Using Derelict][2] at The One With D.

For information on how to load the GLFW 3 library via DerelictGLFW3, see the page [DerelictUtil for Users][3] at the DerelictUtil Wiki. In the meantime, here's some sample code.

```D
import derelict.glfw3.glfw3;

void main() {
    // Load the GLFW 3 library.
    DerelictGLFW3.load();
    
    // Now GLFW 3 functions can be called.
    ...
}
```

[1]: http://www.glfw.org/
[2]: http://dblog.aldacron.net/derelict-help/using-derelict/
[3]: https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users