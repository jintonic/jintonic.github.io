---
layout: note
category: cs
title: python
---

# Virtual Environment

- Rationale and the official solution: <https://docs.python.org/3/tutorial/venv.html>
- [Conda]-based:
  - install [miniforge] instead of [miniconda]
  - run `conda` [init] `$((basename $SHELL))` to create a `conda` shell function in `~/.?shrc`
  - run `conda config --set auto_activate_base false` to avoid turning your shell into the base environment automatically.
  - run `conda create -n g4 geant4` to create an virtual environment called `g4` with package [geant4] installed in it. (NOTE: this doesn't work for Windows)
  - run `conda activate g4` to get into the `g4` virtual environment
    - Geant4 datasets installed through [Conda] do not have `G4` in front of their folder names. This lets `geant4-config --check-datasets` report errors.
    - use `cmake -DCMAKE_PREFIX_PATH=/path/to/miniforge/base/folder/ -B build` to let [cmake] use [miniforge]-based libraries.
    - [HDF5] installed by [Conda] is not thread safe, while [geant4] installed by [Conda] is multithread enabled. This causes trouble to compile geant4 applications.
  - run `conda deactivate` to quit the virtual environment
  - way to uninstall:
    - `conda init --reverse $((basename $SHELL))` to remove `conda` function in `~/.?shrc`
    - `brew remove miniforge` on MacOS or simply delete folder `/path/to/miniforge` on Linux
- [Docker]-based.

[Conda]: https://conda.org
[miniforge]: https://github.com/conda-forge/miniforge/blob/main/README.md#install
[miniconda]: https://stackoverflow.com/a/62454946
[init]: https://docs.conda.io/projects/conda/en/stable/dev-guide/deep-dives/activation.html
[geant4]: https://anaconda.org/conda-forge/geant4
[HDF5]: https://web.mit.edu/fwtools_v3.1.0/www/TechNotes/ThreadSafeLibrary.html
[Docker]: https://www.docker.com

# python in cygwin

python is provided in cygwin. One can follow
[this](http://stackoverflow.com/questions/18641438/installing-pip-3-2-on-cygwin)
question in stackoverfow to install python packages.

# Libraries

## SimpleHTTPServer

The following command will serve the contents of the directory where the command is executed at port 8080:

~~~sh
python -m SimpleHTTPServer 8080
~~~

By default the server is running at port 8000. No root access is required to run this command.

# Web socket

It is used to establish a permanent connection between the web server and a client through which the server can push data to the client. There is no need to have an update loop on the client side.

# Kill script with ctrl-C when there is thread in it

<https://stackoverflow.com/questions/11815947/cannot-kill-python-script-with-ctrl-c>

# Show modules available
In python:
```py
help('modules')
```

In shell:
```sh
pydoc3 modules
```

# plotting
## xkcd style

<https://en.wikipedia.org/wiki/Xkcd>
<https://matplotlib.org/api/_as_gen/matplotlib.pyplot.xkcd.html>
