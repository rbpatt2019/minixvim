##########
 minixvim
##########

A (nearly) fully ``mini``-aturised vestion of nixvim_.

********
 Design
********

The aim here was to create a nvim_ distribution that used a family of
well configured plugins to produce a setup requiring minimatl
configuration. To that end, I have set-up mini.nvim_ with nixvim_.
Nearly everything is direct through ``mini.nivm``, which has very sane
defaults and requires very little in the way of configuration. If a
feature was not available through mini, an alternative was found. In a
few select cases, I chose not to use the equivalent ``mini.nvim``
plugin. These are documented below:

#. noice_ is used for notifications as it also beatifies the command
   prompts and allows for customisation of notifications (ie errors
   using notify, info using mini).

#. cmp_ is used completions, as mini's does not yet support snippets. I
   will likely switch once this is in.

**************
 Known Issues
**************

#. Files launched through Mini.Pick, Mini.Files, or Mini.Starter don't
   use Mini.Clue
#. Snippets not picked up for cmp.
#. Color is rubbish on python files

I'm pretty sure this is related to NixVim, as I can't replicate these in
a plain Lua setup.

**************
 Installation
**************

To use this flake, add it as an input:

.. code::

   {
     inputs = {
       nixvim.url = "github:rbpatt2019/minixvim"
     };
   }

Then, install the package. For home-manager_, this would be:

.. code::

   home-manager.users.<user>.home.packages = [
     inputs.nixvim.packages.x86_64-linux.default
   ];

**************
 Contributing
**************

Please see our guide on :ref:`contributing`.

.. _cmp: https://github.com/hrsh7th/nvim-cmp

.. _home-manager: https://github.com/nix-community/home-manager

.. _mini.nvim: https://github.com/echasnovski/mini.nvim

.. _nixvim: https://github.com/nix-community/nixvim?tab=readme-ov-file

.. _noice: https://github.com/folke/noice.nvim

.. _nvim: https://neovim.io/
