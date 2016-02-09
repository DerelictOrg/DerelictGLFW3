DerelictGLFW3
=============

A dynamic binding to version 3.1 of the [GLFW 3][1] library for the D Programming Language.

Please see the [DerelictGLFW3 documentation][2] and the page [Using Derelict][3] for information on how to build DerelictGLFW3 and load the GLFW3 library at run time. In the meantime, here's some sample code.

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
[2]: http://derelictorg.github.io/packages/glfw3.html
[3]: http://derelictorg.github.io/using.html