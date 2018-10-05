# Löve2D Gameshell Template

> A simple template to quickly create Löve2D games for the [Gameshell](https://clockworkpi.com/)!

## Features

- Complete hump library ready to go!
- Super simple self-made Screen Manager to organize everything!
- Object-oriented coding with hump.class!
- Compatibility with Löve2D v11.x colors! No more struggeling with 0-1 colors! Just use a 0-255 range everywhere!

## Install

Just clone this repository:
```
$ git clone https://github.com/Skayo/Gameshell-Love2D-Template.git
```

## Usage

### Directory Structure

```
assets/  -  All your game assets like images, fonts, sprites, sounds, etc.
lib/     -  All your game libraries. Contains the hump library and the Screen-Manager by default
screens/ -  All your game screens for the Screen-Manager! I have provided two example files.
ui/      -  All your UI Elements. Like menus and other reusable stuff. I have provided an example file.
conf.lua -  Löve2D configuration. Set things like window title or disable/enable specific modules.
main.lua -  The main file that starts the whole thing.
```

### Screen Manager

The Screen-Manager is pretty easy! It basically works with paths. Just like a web-server!

**ScreenManager.register(path, screen)**

Register a new screen.

##### Arguments:

- ``path`` (string) - The path of the screen. For example ``/menu/settings``
- ``screen`` (table) - The screen's class. Get's automatically initialized by the Screen-Manager. (Look in the ``main.lua`` file)

**ScreenManager.view(path, ...)**

Switch to a screen.

##### Arguments:

- ``path`` (string) - The path of the screen to switch to. Same as in ``ScreenManager.register()``.

*All arguments after ``path`` are being passed to the ``activate()`` method of the screen class you are switching to.*

**Screen Class?**

A "Screen Class" is a class that uses hump.class and must have a method named ``activate()`` (Look in the ``.lua`` files in the ``screens/`` directory).  
This "activate"-method gets called every time the Screen-Manager switches to that screen.  
Useful for loading stuff.  
  
> Note that the ``init()`` method of a screen class gets called at love.load(). So you have to decide what to load/initialize in ``activate()`` and what to load/initialize in ``init()``!


## Bugs / Issues / Feature-Requests

If any bugs or issues occur while developing, report them in the [issue tracker](https://github.com/Skayo/Gameshell-Love2D-Template/issues)!
If you feel like you are missing a feature, you can also create an issue! I'm open for any kind of suggestions!
