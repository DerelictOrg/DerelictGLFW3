/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.glfw3.glfw3;

private {
    import derelict.util.loader;
    import derelict.util.system;

    static if( Derelict_OS_Windows )
        enum libNames = "glfw3.dll";
    else static if( Derelict_OS_Mac )
        enum libNames = "libglfw.3.dylib,libglfw3.dylib";
    else static if( Derelict_OS_Posix )
        enum libNames = "libglfw3.so,libglfw.so.3,/usr/local/lib/libglfw3.so,/usr/local/lib/libglfw.so.3";
    else
        static assert( 0, "Need to implement GLFW libNames for this operating system." );
}

enum {
    GLFW_VERSION_MAJOR = 3,
    GLFW_VERSION_MINOR = 0,
    GLFW_VERSION_REVISION = 0
}

enum {
    GLFW_RELEASE = 0,
    GLFW_PRESS = 1,
    GLFW_REPEAT = 2,
}

enum {
    GLFW_KEY_UNKNOWN               = -1,
    GLFW_KEY_SPACE                 = 32,
    GLFW_KEY_APOSTROPHE            = 39,
    GLFW_KEY_COMMA                 = 44,
    GLFW_KEY_MINUS                 = 45,
    GLFW_KEY_PERIOD                = 46,
    GLFW_KEY_SLASH                 = 47,
    GLFW_KEY_0                     = 48,
    GLFW_KEY_1                     = 49,
    GLFW_KEY_2                     = 50,
    GLFW_KEY_3                     = 51,
    GLFW_KEY_4                     = 52,
    GLFW_KEY_5                     = 53,
    GLFW_KEY_6                     = 54,
    GLFW_KEY_7                     = 55,
    GLFW_KEY_8                     = 56,
    GLFW_KEY_9                     = 57,
    GLFW_KEY_SEMICOLON             = 59,
    GLFW_KEY_EQUAL                 = 61,
    GLFW_KEY_A                     = 65,
    GLFW_KEY_B                     = 66,
    GLFW_KEY_C                     = 67,
    GLFW_KEY_D                     = 68,
    GLFW_KEY_E                     = 69,
    GLFW_KEY_F                     = 70,
    GLFW_KEY_G                     = 71,
    GLFW_KEY_H                     = 72,
    GLFW_KEY_I                     = 73,
    GLFW_KEY_J                     = 74,
    GLFW_KEY_K                     = 75,
    GLFW_KEY_L                     = 76,
    GLFW_KEY_M                     = 77,
    GLFW_KEY_N                     = 78,
    GLFW_KEY_O                     = 79,
    GLFW_KEY_P                     = 80,
    GLFW_KEY_Q                     = 81,
    GLFW_KEY_R                     = 82,
    GLFW_KEY_S                     = 83,
    GLFW_KEY_T                     = 84,
    GLFW_KEY_U                     = 85,
    GLFW_KEY_V                     = 86,
    GLFW_KEY_W                     = 87,
    GLFW_KEY_X                     = 88,
    GLFW_KEY_Y                     = 89,
    GLFW_KEY_Z                     = 90,
    GLFW_KEY_LEFT_BRACKET          = 91,
    GLFW_KEY_BACKSLASH             = 92,
    GLFW_KEY_RIGHT_BRACKET         = 93,
    GLFW_KEY_GRAVE_ACCENT          = 96,
    GLFW_KEY_WORLD_1               = 161,
    GLFW_KEY_WORLD_2               = 162,

    GLFW_KEY_ESCAPE                = 256,
    GLFW_KEY_ENTER                 = 257,
    GLFW_KEY_TAB                   = 258,
    GLFW_KEY_BACKSPACE             = 259,
    GLFW_KEY_INSERT                = 260,
    GLFW_KEY_DELETE                = 261,
    GLFW_KEY_RIGHT                 = 262,
    GLFW_KEY_LEFT                  = 263,
    GLFW_KEY_DOWN                  = 264,
    GLFW_KEY_UP                    = 265,
    GLFW_KEY_PAGE_UP               = 266,
    GLFW_KEY_PAGE_DOWN             = 267,
    GLFW_KEY_HOME                  = 268,
    GLFW_KEY_END                   = 269,
    GLFW_KEY_CAPS_LOCK             = 280,
    GLFW_KEY_SCROLL_LOCK           = 281,
    GLFW_KEY_NUM_LOCK              = 282,
    GLFW_KEY_PRINT_SCREEN          = 283,
    GLFW_KEY_PAUSE                 = 284,
    GLFW_KEY_F1                    = 290,
    GLFW_KEY_F2                    = 291,
    GLFW_KEY_F3                    = 292,
    GLFW_KEY_F4                    = 293,
    GLFW_KEY_F5                    = 294,
    GLFW_KEY_F6                    = 295,
    GLFW_KEY_F7                    = 296,
    GLFW_KEY_F8                    = 297,
    GLFW_KEY_F9                    = 298,
    GLFW_KEY_F10                   = 299,
    GLFW_KEY_F11                   = 300,
    GLFW_KEY_F12                   = 301,
    GLFW_KEY_F13                   = 302,
    GLFW_KEY_F14                   = 303,
    GLFW_KEY_F15                   = 304,
    GLFW_KEY_F16                   = 305,
    GLFW_KEY_F17                   = 306,
    GLFW_KEY_F18                   = 307,
    GLFW_KEY_F19                   = 308,
    GLFW_KEY_F20                   = 309,
    GLFW_KEY_F21                   = 310,
    GLFW_KEY_F22                   = 311,
    GLFW_KEY_F23                   = 312,
    GLFW_KEY_F24                   = 313,
    GLFW_KEY_F25                   = 314,
    GLFW_KEY_KP_0                  = 320,
    GLFW_KEY_KP_1                  = 321,
    GLFW_KEY_KP_2                  = 322,
    GLFW_KEY_KP_3                  = 323,
    GLFW_KEY_KP_4                  = 324,
    GLFW_KEY_KP_5                  = 325,
    GLFW_KEY_KP_6                  = 326,
    GLFW_KEY_KP_7                  = 327,
    GLFW_KEY_KP_8                  = 328,
    GLFW_KEY_KP_9                  = 329,
    GLFW_KEY_KP_DECIMAL            = 330,
    GLFW_KEY_KP_DIVIDE             = 331,
    GLFW_KEY_KP_MULTIPLY           = 332,
    GLFW_KEY_KP_SUBTRACT           = 333,
    GLFW_KEY_KP_ADD                = 334,
    GLFW_KEY_KP_ENTER              = 335,
    GLFW_KEY_KP_EQUAL              = 336,
    GLFW_KEY_LEFT_SHIFT            = 340,
    GLFW_KEY_LEFT_CONTROL          = 341,
    GLFW_KEY_LEFT_ALT              = 342,
    GLFW_KEY_LEFT_SUPER            = 343,
    GLFW_KEY_RIGHT_SHIFT           = 344,
    GLFW_KEY_RIGHT_CONTROL         = 345,
    GLFW_KEY_RIGHT_ALT             = 346,
    GLFW_KEY_RIGHT_SUPER           = 347,
    GLFW_KEY_MENU                  = 348,
    GLFW_KEY_LAST                  = GLFW_KEY_MENU,

    GLFW_KEY_ESC           = GLFW_KEY_ESCAPE,
    GLFW_KEY_DEL           = GLFW_KEY_DELETE,
    GLFW_KEY_PAGEUP        = GLFW_KEY_PAGE_UP,
    GLFW_KEY_PAGEDOWN      = GLFW_KEY_PAGE_DOWN,
    GLFW_KEY_KP_NUM_LOCK   = GLFW_KEY_NUM_LOCK,
    GLFW_KEY_LCTRL         = GLFW_KEY_LEFT_CONTROL,
    GLFW_KEY_LSHIFT        = GLFW_KEY_LEFT_SHIFT,
    GLFW_KEY_LALT          = GLFW_KEY_LEFT_ALT,
    GLFW_KEY_LSUPER        = GLFW_KEY_LEFT_SUPER,
    GLFW_KEY_RCTRL         = GLFW_KEY_RIGHT_CONTROL,
    GLFW_KEY_RSHIFT        = GLFW_KEY_RIGHT_SHIFT,
    GLFW_KEY_RALT          = GLFW_KEY_RIGHT_ALT,
    GLFW_KEY_RSUPER        = GLFW_KEY_RIGHT_SUPER,

    GLFW_MOD_SHIFT = 0x0001,
    GLFW_MOD_CONTROL = 0x0002,
    GLFW_MOD_ALT = 0x0004,
    GLFW_MOD_SUPER = 0x0008,

    GLFW_MOUSE_BUTTON_1     = 0,
    GLFW_MOUSE_BUTTON_2     = 1,
    GLFW_MOUSE_BUTTON_3     = 2,
    GLFW_MOUSE_BUTTON_4     = 3,
    GLFW_MOUSE_BUTTON_5     = 4,
    GLFW_MOUSE_BUTTON_6     = 5,
    GLFW_MOUSE_BUTTON_7     = 6,
    GLFW_MOUSE_BUTTON_8     = 7,
    GLFW_MOUSE_BUTTON_LAST  = GLFW_MOUSE_BUTTON_8,
    GLFW_MOUSE_BUTTON_LEFT   = GLFW_MOUSE_BUTTON_1,
    GLFW_MOUSE_BUTTON_RIGHT  = GLFW_MOUSE_BUTTON_2,
    GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3,

    GLFW_JOYSTICK_1         = 0,
    GLFW_JOYSTICK_2         = 1,
    GLFW_JOYSTICK_3         = 2,
    GLFW_JOYSTICK_4         = 3,
    GLFW_JOYSTICK_5         = 4,
    GLFW_JOYSTICK_6         = 5,
    GLFW_JOYSTICK_7         = 6,
    GLFW_JOYSTICK_8         = 7,
    GLFW_JOYSTICK_9         = 8,
    GLFW_JOYSTICK_10        = 9,
    GLFW_JOYSTICK_11        = 10,
    GLFW_JOYSTICK_12        = 11,
    GLFW_JOYSTICK_13        = 12,
    GLFW_JOYSTICK_14        = 13,
    GLFW_JOYSTICK_15        = 14,
    GLFW_JOYSTICK_16        = 15,
    GLFW_JOYSTICK_LAST      = GLFW_JOYSTICK_16,
}

enum {
    GLFW_NOT_INITIALIZED      = 0x00010001,
    GLFW_NO_CURRENT_CONTEXT   = 0x00010002,
    GLFW_INVALID_ENUM         = 0x00010003,
    GLFW_INVALID_VALUE        = 0x00010004,
    GLFW_OUT_OF_MEMORY        = 0x00010005,
    GLFW_API_UNAVAILABLE      = 0x00010006,
    GLFW_VERSION_UNAVAILABLE  = 0x00010007,
    GLFW_PLATFORM_ERROR       = 0x00010008,
    GLFW_FORMAT_UNAVAILABLE   = 0x00010009,

    GLFW_FOCUSED              = 0x00020001,
    GLFW_ICONIFIED            = 0x00020002,
    GLFW_RESIZABLE            = 0x00020003,
    GLFW_VISIBLE              = 0x00020004,
    GLFW_DECORATED            = 0x00020005,

    GLFW_RED_BITS               = 0x00021001,
    GLFW_GREEN_BITS             = 0x00021002,
    GLFW_BLUE_BITS              = 0x00021003,
    GLFW_ALPHA_BITS             = 0x00021004,
    GLFW_DEPTH_BITS             = 0x00021005,
    GLFW_STENCIL_BITS           = 0x00021006,
    GLFW_ACCUM_RED_BITS         = 0x00021007,
    GLFW_ACCUM_GREEN_BITS       = 0x00021008,
    GLFW_ACCUM_BLUE_BITS        = 0x00021009,
    GLFW_ACCUM_ALPHA_BITS       = 0x0002100A,
    GLFW_AUX_BUFFERS            = 0x0002100B,
    GLFW_STEREO                 = 0x0002100C,
    GLFW_SAMPLES                = 0x0002100D,
    GLFW_SRGB_CAPABLE           = 0x0002100E,
    GLFW_REFRESH_RATE           = 0x0002100F,

    GLFW_CLIENT_API           = 0x00022001,
    GLFW_CONTEXT_VERSION_MAJOR = 0x00022002,
    GLFW_CONTEXT_VERSION_MINOR = 0x00022003,
    GLFW_CONTEXT_REVISION = 0x00022004,
    GLFW_CONTEXT_ROBUSTNESS   = 0x00022005,
    GLFW_OPENGL_FORWARD_COMPAT = 0x00022006,
    GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007,
    GLFW_OPENGL_PROFILE       = 0x00022008,

    GLFW_OPENGL_API             = 0x00030001,
    GLFW_OPENGL_ES_API          = 0x00030002,

    GLFW_NO_ROBUSTNESS                   = 0,
    GLFW_NO_RESET_NOTIFICATION  = 0x00031001,
    GLFW_LOSE_CONTEXT_ON_RESET  = 0x00031002,

    GLFW_OPENGL_NO_PROFILE               = 0,
    GLFW_OPENGL_CORE_PROFILE    = 0x00032001,
    GLFW_OPENGL_COMPAT_PROFILE  = 0x00032002,

    GLFW_CURSOR                 = 0x00033001,
    GLFW_STICKY_KEYS            = 0x00033002,
    GLFW_STICKY_MOUSE_BUTTONS   = 0x00033003,

    GLFW_CURSOR_NORMAL          = 0x00034001,
    GLFW_CURSOR_HIDDEN          = 0x00034002,
    GLFW_CURSOR_DISABLED        = 0x00034003,

    GLFW_CONNECTED              = 0x00040001,
    GLFW_DISCONNECTED           = 0x00040002,
}

extern( C ) nothrow alias void function() GLFWglproc;

struct GLFWmonitor;
struct GLFWwindow;

extern( C ) nothrow {
    alias GLFWerrorfun = void function( int, const( char )* );
    alias GLFWwindowposfun = void function( GLFWwindow*, int, int );
    alias GLFWwindowsizefun = void function( GLFWwindow*, int, int );
    alias GLFWwindowclosefun = void function( GLFWwindow* );
    alias GLFWwindowrefreshfun = void function( GLFWwindow* );
    alias GLFWwindowfocusfun = void function( GLFWwindow*, int );
    alias GLFWwindowiconifyfun = void function( GLFWwindow*, int );
    alias GLFWframebuffersizefun = void function( GLFWwindow*, int, int );
    alias GLFWmousebuttonfun = void function( GLFWwindow*, int, int, int );
    alias GLFWcursorposfun = void function( GLFWwindow*, double, double );
    alias GLFWcursorenterfun = void function( GLFWwindow*, int );
    alias GLFWscrollfun = void function( GLFWwindow*, double, double );
    alias GLFWkeyfun = void function( GLFWwindow*, int, int, int, int );
    alias GLFWcharfun = void function( GLFWwindow*, uint );
    alias GLFWmonitorfun = void function( GLFWmonitor*, int );
}

struct GLFWvidmode {
    int width;
    int height;
    int redBits;
    int greenBits;
    int blueBits;
    int refreshRate;
}

struct GLFWgammaramp {
    ushort* red;
    ushort* green;
    ushort* blue;
    uint size;
}

extern( C ) nothrow {
    alias da_glfwInit = int function();
    alias da_glfwTerminate = void function();
    alias da_glfwGetVersion = void function( int*, int*, int* );
    alias da_glfwGetVersionString = const( char )* function();

    alias da_glfwSetErrorCallback = GLFWerrorfun function( GLFWerrorfun );

    alias da_glfwGetMonitors = GLFWmonitor** function( int* );
    alias da_glfwGetPrimaryMonitor = GLFWmonitor* function();
    alias da_glfwGetMonitorPos = void function( GLFWmonitor*, int*, int* );
    alias da_glfwGetMonitorPhysicalSize = void function( GLFWmonitor*, int*, int* );
    alias da_glfwGetMonitorName = const( char )* function( GLFWmonitor* );
    alias da_glfwSetMonitorCallback = GLFWmonitorfun function( GLFWmonitorfun );

    alias da_glfwGetVideoModes = const( GLFWvidmode )* function( GLFWmonitor*, int* );
    alias da_glfwGetVideoMode = const( GLFWvidmode )* function( GLFWmonitor* );

    alias da_glfwSetGamma = void function( GLFWmonitor*,float );
    alias da_glfwGetGammaRamp = const( GLFWgammaramp* ) function( GLFWmonitor* );
    alias da_glfwSetGammaRamp = void function( GLFWmonitor*,const( GLFWgammaramp )* );

    alias da_glfwDefaultWindowHints = void function();
    alias da_glfwWindowHint = void function( int, int );
    alias da_glfwCreateWindow = GLFWwindow* function( int, int, const( char )*, GLFWmonitor*, GLFWwindow* );
    alias da_glfwDestroyWindow = void function( GLFWwindow* );
    alias da_glfwWindowShouldClose = int function( GLFWwindow* );
    alias da_glfwSetWindowShouldClose = void function( GLFWwindow*, int );
    alias da_glfwSetWindowTitle = void function( GLFWwindow*, const( char )* );
    alias da_glfwGetWindowPos = void function( GLFWwindow*, int*, int* );
    alias da_glfwSetWindowPos = void function( GLFWwindow*, int, int );
    alias da_glfwGetWindowSize = void function( GLFWwindow*, int*, int* );
    alias da_glfwSetWindowSize = void function( GLFWwindow*, int, int );
    alias da_glfwGetFramebufferSize = void function( GLFWwindow*, int*, int* );
    alias da_glfwIconifyWindow = void function( GLFWwindow* );
    alias da_glfwRestoreWindow = void function( GLFWwindow* );
    alias da_glfwShowWindow = void function( GLFWwindow* );
    alias da_glfwHideWindow = void function( GLFWwindow* );
    alias da_glfwGetWindowMonitor = GLFWmonitor* function( GLFWwindow* );
    alias da_glfwGetWindowAttrib = int function( GLFWwindow*, int );
    alias da_glfwSetWindowUserPointer = void function( GLFWwindow*, void* );
    alias da_glfwGetWindowUserPointer = void* function( GLFWwindow* );
    alias da_glfwSetWindowPosCallback = GLFWwindowposfun function( GLFWwindow*, GLFWwindowposfun );
    alias da_glfwSetWindowSizeCallback = GLFWwindowsizefun function( GLFWwindow*, GLFWwindowsizefun );
    alias da_glfwSetWindowCloseCallback = GLFWwindowclosefun function( GLFWwindow*, GLFWwindowclosefun );
    alias da_glfwSetWindowRefreshCallback = GLFWwindowrefreshfun function( GLFWwindow*, GLFWwindowrefreshfun );
    alias da_glfwSetWindowFocusCallback = GLFWwindowfocusfun function( GLFWwindow*, GLFWwindowfocusfun );
    alias da_glfwSetWindowIconifyCallback = GLFWwindowiconifyfun function( GLFWwindow*, GLFWwindowiconifyfun );
    alias da_glfwSetFramebufferSizeCallback = GLFWframebuffersizefun function( GLFWwindow*, GLFWframebuffersizefun );

    alias da_glfwPollEvents = void function();
    alias da_glfwWaitEvents = void function();

    alias da_glfwGetInputMode = int function( GLFWwindow*, int );
    alias da_glfwSetInputMode = void function( GLFWwindow*, int, int );
    alias da_glfwGetKey = int function( GLFWwindow*, int );
    alias da_glfwGetMouseButton = int function( GLFWwindow*, int );
    alias da_glfwGetCursorPos = void function( GLFWwindow*, double*, double* );
    alias da_glfwSetCursorPos = void function( GLFWwindow*, double, double );
    alias da_glfwSetKeyCallback = GLFWkeyfun function( GLFWwindow*, GLFWkeyfun );
    alias da_glfwSetCharCallback = GLFWcharfun function( GLFWwindow*, GLFWcharfun );
    alias da_glfwSetMouseButtonCallback = GLFWmousebuttonfun function( GLFWwindow*, GLFWmousebuttonfun );
    alias da_glfwSetCursorPosCallback = GLFWcursorposfun function( GLFWwindow*, GLFWcursorposfun );
    alias da_glfwSetCursorEnterCallback = GLFWcursorenterfun function( GLFWwindow*, GLFWcursorenterfun );
    alias da_glfwSetScrollCallback = GLFWscrollfun function( GLFWwindow*, GLFWscrollfun );

    alias da_glfwJoystickPresent = int function( int );
    alias da_glfwGetJoystickAxes = float* function( int, int* );
    alias da_glfwGetJoystickButtons = ubyte* function( int, int* );
    alias da_glfwGetJoystickName = const( char )* function( int );

    alias da_glfwSetClipboardString = void function( GLFWwindow*, const( char )* );
    alias da_glfwGetClipboardString = const( char )* function( GLFWwindow* );

    alias da_glfwGetTime = double function();
    alias da_glfwSetTime = void function( double );

    alias da_glfwMakeContextCurrent = void function( GLFWwindow* );
    alias da_glfwGetCurrentContext = GLFWwindow* function();
    alias da_glfwSwapBuffers = void function( GLFWwindow* );
    alias da_glfwSwapInterval = void function( int );
    alias da_glfwExtensionSupported = int function( const( char )* );
    alias da_glfwGetProcAddress = GLFWglproc function( const( char )* );
}

__gshared {
    da_glfwInit glfwInit;
    da_glfwTerminate glfwTerminate;
    da_glfwGetVersion glfwGetVersion;
    da_glfwGetVersionString glfwGetVersionString;
    da_glfwSetErrorCallback glfwSetErrorCallback;
    da_glfwGetMonitors glfwGetMonitors;
    da_glfwGetPrimaryMonitor glfwGetPrimaryMonitor;
    da_glfwGetMonitorPos glfwGetMonitorPos;
    da_glfwGetMonitorPhysicalSize glfwGetMonitorPhysicalSize;
    da_glfwGetMonitorName glfwGetMonitorName;
    da_glfwSetMonitorCallback glfwSetMonitorCallback;
    da_glfwGetVideoModes glfwGetVideoModes;
    da_glfwGetVideoMode glfwGetVideoMode;
    da_glfwSetGamma glfwSetGamma;
    da_glfwGetGammaRamp glfwGetGammaRamp;
    da_glfwSetGammaRamp glfwSetGammaRamp;
    da_glfwDefaultWindowHints glfwDefaultWindowHints;
    da_glfwWindowHint glfwWindowHint;
    da_glfwCreateWindow glfwCreateWindow;
    da_glfwDestroyWindow glfwDestroyWindow;
    da_glfwWindowShouldClose glfwWindowShouldClose;
    da_glfwSetWindowShouldClose glfwSetWindowShouldClose;
    da_glfwSetWindowTitle glfwSetWindowTitle;
    da_glfwGetWindowPos glfwGetWindowPos;
    da_glfwSetWindowPos glfwSetWindowPos;
    da_glfwGetWindowSize glfwGetWindowSize;
    da_glfwSetWindowSize glfwSetWindowSize;
    da_glfwGetFramebufferSize glfwGetFramebufferSize;
    da_glfwIconifyWindow glfwIconifyWindow;
    da_glfwRestoreWindow glfwRestoreWindow;
    da_glfwShowWindow glfwShowWindow;
    da_glfwHideWindow glfwHideWindow;
    da_glfwGetWindowMonitor glfwGetWindowMonitor;
    da_glfwGetWindowAttrib glfwGetWindowAttrib;
    da_glfwSetWindowUserPointer glfwSetWindowUserPointer;
    da_glfwGetWindowUserPointer glfwGetWindowUserPointer;
    da_glfwSetWindowPosCallback glfwSetWindowPosCallback;
    da_glfwSetWindowSizeCallback glfwSetWindowSizeCallback;
    da_glfwSetWindowCloseCallback glfwSetWindowCloseCallback;
    da_glfwSetWindowRefreshCallback glfwSetWindowRefreshCallback;
    da_glfwSetWindowFocusCallback glfwSetWindowFocusCallback;
    da_glfwSetWindowIconifyCallback glfwSetWindowIconifyCallback;
    da_glfwSetFramebufferSizeCallback glfwSetFramebufferSizeCallback;
    da_glfwPollEvents glfwPollEvents;
    da_glfwWaitEvents glfwWaitEvents;
    da_glfwGetInputMode glfwGetInputMode;
    da_glfwSetInputMode glfwSetInputMode;
    da_glfwGetKey glfwGetKey;
    da_glfwGetMouseButton glfwGetMouseButton;
    da_glfwGetCursorPos glfwGetCursorPos;
    da_glfwSetCursorPos glfwSetCursorPos;
    da_glfwSetKeyCallback glfwSetKeyCallback;
    da_glfwSetCharCallback glfwSetCharCallback;
    da_glfwSetMouseButtonCallback glfwSetMouseButtonCallback;
    da_glfwSetCursorPosCallback glfwSetCursorPosCallback;
    da_glfwSetCursorEnterCallback glfwSetCursorEnterCallback;
    da_glfwSetScrollCallback glfwSetScrollCallback;
    da_glfwJoystickPresent glfwJoystickPresent;
    da_glfwGetJoystickAxes glfwGetJoystickAxes;
    da_glfwGetJoystickButtons glfwGetJoystickButtons;
    da_glfwGetJoystickName glfwGetJoystickName;
    da_glfwSetClipboardString glfwSetClipboardString;
    da_glfwGetClipboardString glfwGetClipboardString;
    da_glfwGetTime glfwGetTime;
    da_glfwSetTime glfwSetTime;
    da_glfwMakeContextCurrent glfwMakeContextCurrent;
    da_glfwGetCurrentContext glfwGetCurrentContext;
    da_glfwSwapBuffers glfwSwapBuffers;
    da_glfwSwapInterval glfwSwapInterval;
    da_glfwExtensionSupported glfwExtensionSupported;
    da_glfwGetProcAddress glfwGetProcAddress;
}

class DerelictGLFW3Loader : SharedLibLoader {
    public this() {
        super( libNames );
    }

    protected override void loadSymbols() {
        bindFunc( cast( void** )&glfwInit, "glfwInit" );
        bindFunc( cast( void** )&glfwTerminate, "glfwTerminate" );
        bindFunc( cast( void** )&glfwGetVersion, "glfwGetVersion" );
        bindFunc( cast( void** )&glfwGetVersionString, "glfwGetVersionString" );
        bindFunc( cast( void** )&glfwSetErrorCallback, "glfwSetErrorCallback" );
        bindFunc( cast( void** )&glfwGetMonitors, "glfwGetMonitors" );
        bindFunc( cast( void** )&glfwGetPrimaryMonitor, "glfwGetPrimaryMonitor" );
        bindFunc( cast( void** )&glfwGetMonitorPos, "glfwGetMonitorPos" );
        bindFunc( cast( void** )&glfwGetMonitorPhysicalSize, "glfwGetMonitorPhysicalSize" );
        bindFunc( cast( void** )&glfwGetMonitorName, "glfwGetMonitorName" );
        bindFunc( cast( void** )&glfwSetMonitorCallback, "glfwSetMonitorCallback" );
        bindFunc( cast( void** )&glfwGetVideoModes, "glfwGetVideoModes" );
        bindFunc( cast( void** )&glfwGetVideoMode, "glfwGetVideoMode" );
        bindFunc( cast( void** )&glfwSetGamma, "glfwSetGamma" );
        bindFunc( cast( void** )&glfwGetGammaRamp, "glfwGetGammaRamp" );
        bindFunc( cast( void** )&glfwSetGammaRamp, "glfwSetGammaRamp" );
        bindFunc( cast( void** )&glfwDefaultWindowHints, "glfwDefaultWindowHints" );
        bindFunc( cast( void** )&glfwWindowHint, "glfwWindowHint" );
        bindFunc( cast( void** )&glfwCreateWindow, "glfwCreateWindow" );
        bindFunc( cast( void** )&glfwDestroyWindow, "glfwDestroyWindow" );
        bindFunc( cast( void** )&glfwWindowShouldClose, "glfwWindowShouldClose" );
        bindFunc( cast( void** )&glfwSetWindowShouldClose, "glfwSetWindowShouldClose" );
        bindFunc( cast( void** )&glfwSetWindowTitle, "glfwSetWindowTitle" );
        bindFunc( cast( void** )&glfwGetWindowPos, "glfwGetWindowPos" );
        bindFunc( cast( void** )&glfwSetWindowPos, "glfwSetWindowPos" );
        bindFunc( cast( void** )&glfwGetWindowSize, "glfwGetWindowSize" );
        bindFunc( cast( void** )&glfwSetWindowSize, "glfwSetWindowSize" );
        bindFunc( cast( void** )&glfwGetFramebufferSize, "glfwGetFramebufferSize" );
        bindFunc( cast( void** )&glfwIconifyWindow, "glfwIconifyWindow" );
        bindFunc( cast( void** )&glfwRestoreWindow, "glfwRestoreWindow" );
        bindFunc( cast( void** )&glfwShowWindow, "glfwShowWindow" );
        bindFunc( cast( void** )&glfwHideWindow, "glfwHideWindow" );
        bindFunc( cast( void** )&glfwGetWindowMonitor, "glfwGetWindowMonitor" );
        bindFunc( cast( void** )&glfwGetWindowAttrib, "glfwGetWindowAttrib" );
        bindFunc( cast( void** )&glfwSetWindowUserPointer, "glfwSetWindowUserPointer" );
        bindFunc( cast( void** )&glfwGetWindowUserPointer, "glfwGetWindowUserPointer" );
        bindFunc( cast( void** )&glfwSetWindowPosCallback, "glfwSetWindowPosCallback" );
        bindFunc( cast( void** )&glfwSetWindowSizeCallback, "glfwSetWindowSizeCallback" );
        bindFunc( cast( void** )&glfwSetWindowCloseCallback, "glfwSetWindowCloseCallback" );
        bindFunc( cast( void** )&glfwSetWindowRefreshCallback, "glfwSetWindowRefreshCallback" );
        bindFunc( cast( void** )&glfwSetWindowFocusCallback, "glfwSetWindowFocusCallback" );
        bindFunc( cast( void** )&glfwSetWindowIconifyCallback, "glfwSetWindowIconifyCallback" );
        bindFunc( cast( void** )&glfwSetFramebufferSizeCallback, "glfwSetFramebufferSizeCallback" );
        bindFunc( cast( void** )&glfwPollEvents, "glfwPollEvents" );
        bindFunc( cast( void** )&glfwWaitEvents, "glfwWaitEvents" );
        bindFunc( cast( void** )&glfwGetInputMode, "glfwGetInputMode" );
        bindFunc( cast( void** )&glfwSetInputMode, "glfwSetInputMode" );
        bindFunc( cast( void** )&glfwGetKey, "glfwGetKey" );
        bindFunc( cast( void** )&glfwGetMouseButton, "glfwGetMouseButton" );
        bindFunc( cast( void** )&glfwGetCursorPos, "glfwGetCursorPos" );
        bindFunc( cast( void** )&glfwSetCursorPos, "glfwSetCursorPos" );
        bindFunc( cast( void** )&glfwSetKeyCallback, "glfwSetKeyCallback" );
        bindFunc( cast( void** )&glfwSetCharCallback, "glfwSetCharCallback" );
        bindFunc( cast( void** )&glfwSetMouseButtonCallback, "glfwSetMouseButtonCallback" );
        bindFunc( cast( void** )&glfwSetCursorPosCallback, "glfwSetCursorPosCallback" );
        bindFunc( cast( void** )&glfwSetScrollCallback, "glfwSetScrollCallback" );
        bindFunc( cast( void** )&glfwSetCursorEnterCallback, "glfwSetCursorEnterCallback" );
        bindFunc( cast( void** )&glfwJoystickPresent, "glfwJoystickPresent" );
        bindFunc( cast( void** )&glfwGetJoystickAxes, "glfwGetJoystickAxes" );
        bindFunc( cast( void** )&glfwGetJoystickButtons, "glfwGetJoystickButtons" );
        bindFunc( cast( void** )&glfwGetJoystickName, "glfwGetJoystickName" );
        bindFunc( cast( void** )&glfwSetClipboardString, "glfwSetClipboardString" );
        bindFunc( cast( void** )&glfwGetClipboardString, "glfwGetClipboardString" );
        bindFunc( cast( void** )&glfwGetTime, "glfwGetTime" );
        bindFunc( cast( void** )&glfwSetTime, "glfwSetTime" );
        bindFunc( cast( void** )&glfwMakeContextCurrent, "glfwMakeContextCurrent" );
        bindFunc( cast( void** )&glfwGetCurrentContext, "glfwGetCurrentContext" );
        bindFunc( cast( void** )&glfwSwapBuffers, "glfwSwapBuffers" );
        bindFunc( cast( void** )&glfwSwapInterval, "glfwSwapInterval" );
        bindFunc( cast( void** )&glfwExtensionSupported, "glfwExtensionSupported" );
        bindFunc( cast( void** )&glfwGetProcAddress, "glfwGetProcAddress" );
    }
}

__gshared DerelictGLFW3Loader DerelictGLFW3;

shared static this() {
    DerelictGLFW3 = new DerelictGLFW3Loader();
}
