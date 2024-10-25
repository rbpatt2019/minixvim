rbpatt2019's nixvim setup
#########################

I was trying to port my LazyVim configuration. That was a pain, so instead I committed
to `NixVim`_. Now, the entire thing is in ``nix``, so everything plays nicely with
everything else. Also, by making it an independent flake, I can install it with
``HomeManager`` and access it on any system that runs ``Nix``.

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

Testing Changes
===============

Another major advantage of this being a flake is that we can directly test changes
with:

.. code:: bash

   nix run .# -- <file>
