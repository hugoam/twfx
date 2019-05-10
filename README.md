![libtwfx](media/libtwfx.png?raw=true)

tgfx is a full-feature mid-level rendering library built on top of [bgfx](https://github.com/bkaradzic/bgfx)  
it is part of the encompassing [two](https://github.com/hugoam/two) library 

![samples](media/samples0.gif?raw=true)

# building
Here are the basic build instructions to get tgfx up and running on linux/osx/windows:
- `git clone --recursive https://github.com/hugoam/tgfx`
- `cd tgfx`
- for linux (make):
  - `bin/linux/genie --gcc=linux-gcc gmake`
  - `cd build/projects/gmake-linux`
  - `make config=debug64 -j8`
- for osx (make): `bin/darwin/genie --gcc=osx gmake`
- for osx (xcode): `bin/darwin/genie --xcode=osx xcode9`
- for windows (visual studio): `bin/windows/genie vs2017`
