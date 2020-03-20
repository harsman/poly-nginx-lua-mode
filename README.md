poly-nginx-lua-mode
===========

poly-nginx-lua-mode is a [polymode](https://github.com/polymode/polymode)
minor mode for editing [nginx](https://www.nginx.com) configuration files with embedded
[Lua](https://www.lua.org) code. It uses polymode to support dual major modes
in one file.

This is very useful when using e.g. [OpenResty](https://openresty.org).

Get the latest version of poly-nginx-lua-mode at https://github.com/harsman/poly-nginx-lua-mode

Features
--------

Installation
------------

### From MELPA ###

Since version 24.1, Emacs includes a package management system. Using the
[MELPA](http://melpa.org) package repository is the easiest way to install and
update poly-nginx-lua-mode.

If you have installed packages from Melpa before, all you have to do is:

`M-x package-install RET poly-nginx-lua-mode RET`

If you haven't used Melpa before, then you have to configure `package.el`
first. Add the following to your
[init file](http://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html)

```lisp
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
```

Restart Emacs and update the package cache by running:

`M-x package-refresh-contents RET`

You can now install poly-nginx-lua-mode by running `M-x package-install`, as above.

#### Installing in older versions of Emacs ####

If you have an older version of Emacs, please follow the
[instructions from MELPA](http://melpa.org/#/getting-started).

### Installing manually

To install manually, clone the
[git repository](https://github.com/harsman/poly-nginx-lua-mode) and add the
following to your init file:

```lisp
(autoload 'poly-nginx-lua-mode 
          "/path/to/poly-nginx-lua-mode.el"
          "Edit Nginx configs with embedded Lua" t)
```

#### Dependencies ####

If you install with `package.el` then dependencies are automatically
installed. If you install manually, you have to install dependencies manually
as well.

* `polymode` is used to enable multiple major modes in a single buffer. Get it
  [here](https://github.com/polymode/polymode).
* `nginx-mode` is the mode used for editing the non-Lua parts of the nginx
  configuration. Get it [here](https://github.com/ajc/nginx-mode)

Getting started
---------------

To get started, just open any nginx configuration file and do `M-x
poly-nginx-lua-mode`.
