# vimcore
This is a very basic vim plugin for the encore programming language.

![Example](/example.png)

## Features
### Syntax Highlighting
This plugin provides syntax highlighting, some error checking and some fancypantsy unicode magic.

### Error checking
The error checking can as of now only mark parse errors due to me not being any good
fixing `syntstic` formatting expressions. Other errors still gets displayed in the location 
list but they are not located in the code.

### Macros
Vimcore provides some basic but awesome macros!

- `<leader>ec`    Adds a comments out the current line in normal mode
                  and the entire block in visual mode.
- `<leader>eC`    Removes comment. Works in the same way as `<leader>ec`
- `<leader>ed`    Creates a method definition template.
- `<leader>ei`    Creates an if-statement template.
- `<leader>eie`   Creates an if-then-else template.
- `<leader>er`    Creates a repeat template.
- `<leader>ef`    Creates a for each template.
- `<leader>em`    Creates a match template.

**NOTE**
When you create a template `<++>` will appear in the template. These
may look strange but they are super awesome. You jump to the next `<++>` and change
it with `<leader>-` in normal mode and `<c-_>` in insert mode.
They make the templates awesome :D

##Installation
Just clone this repo into your `.vim/bundles/` directory and it should be working.
You need [syntastic](https://github.com/scrooloose/syntastic) for the error checking to work.


