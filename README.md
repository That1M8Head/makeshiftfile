# Makeshiftfile

Makeshiftfile is an automated shell script that compiles and runs each file in
your current working directory.

Makeshift file includes two editions - the \*nix Edition for Linux, macOS and
the BSD family, and the Windows Edition, for, uh, Windows.

Makeshiftfile is written in Bash for the \*nix Edition, and Batch for the
Windows Edition.

Makeshiftfile will default to compiling C++ source files, so if you're working
with anything else, please see the [Configuration](#configuration) section.

## Configuration

By default, Makeshiftfile is set up with these settings:

| Setting | *nix Edition | Windows Edition |
| --- | --- | --- |
| Compiler | g++ | g++ |
| Compile flags | -O3 -Wall | -O3 -Wall |
| Execute command | sh | call |
| Source files | cpp | cpp |
| Require confirmation | Yes | Yes |

You can configure these by editing the `Configuration` section of your
Makeshiftfile script.

## Cross-Compatibility (or lack thereof)

It's important you understand that the *nix Edition and Windows Edition are not
cross-compatible. The Windows Edition naturally won't work on \*nix anyway and
the \*nix Edition won't work on Windows because of \*nix-specific features.

You can still use the *nix Edition through Cygwin or WSL.

## Name Origin

I got the name "Makeshiftfile" from combining "makeshift" with "Makefile".

## License

tl;dr GPL-3.0

Makeshiftfile is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any later
version.
