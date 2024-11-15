.. _contributing:

Contributing
############

If you'd like to contribute, please do so!

Development
===========

This takes advantage of the flake development environments to use pre-commit and checks.
The included ``.envrc`` will activate an environment that installs the pre-commit checks
when you enter the directory - presuming you use ``direnv``. If you don't, you may
install these manually with:

.. code:: bash

   nix develop

Formatting may be applied with:

.. code:: bash

   nix fmt

A full check that the flake is correct can be run with:

.. code:: bash

   nix flake check .

Testing changes
---------------

Another major advantage of this being a flake is that we can directly test changes
with:

.. code:: bash

   nix run .# -- <file>

This will spin up an instance of neovim using the nixvim config.

Create a PR
===========

Once your work is done, please submit a PR. A github workflow will run on the PR to
lint, format, and update the codebase. I'll review it as soon as I can and get back to
you if I have any questions!
