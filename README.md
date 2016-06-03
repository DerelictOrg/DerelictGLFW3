DerelictGLFW3
=============

A dynamic and static binding to version 3.2 of the [GLFW 3][1] library for the D Programming Language.

The dynamic binding is the default configuration and allows you to load the GLFW3 shared library manually at runtime. Please see the [DerelictGLFW3 documentation][2] and the page [Using Derelict][3] for information on how to build DerelictGLFW3 and load the GLFW3 library at run time. Here's some sample code.

```D
import derelict.glfw3.glfw3;

void main() {
    // Load the GLFW 3 library.
    DerelictGLFW3.load();

    // Now GLFW 3 functions can be called.
    ...
}
```

The static binding allows you to link with the GLFW3 library both dynamically and statically. To enable this configuration, you must specify it as a subConfiguration in your dub.sdl file, or compile DerelictGLFW3 manually with -version=DerelictGLFW3Static. See the [DerelictGLFW3 documentation][4] for more information on this configuration.

[1]: http://www.glfw.org/
[2]: https://derelictorg.github.io/packages/glfw3.html
[3]: https://derelictorg.github.io/using.html
[4]: https://derelictorg.github.io/packages/glfw3.html#statbind