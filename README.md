# vimcore
This is a very basic vim plugin for the encore programming language.

![Example](/example.png)

## Features
This plugin provides syntax highlighting, some error checking and some fancypantsy unicode magic.

The error checking can as of now only mark parse errors due to me not being any good
fixing `syntstic` formatting expressions. Other errors still gets displayed in the location 
list but they are not located in the code.

##Installation
Just clone this repo into your `.vim/bundles/` directory and it should be working.
You need [syntastic](https://github.com/scrooloose/syntastic) for vimcore to work.
