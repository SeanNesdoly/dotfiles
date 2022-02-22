# Snippets with `yasnippet` in Spacemacs

- [AndreaCrotti/yasnippet-snippets](https://github.com/AndreaCrotti/yasnippet-snippets)
  provides a collection of useful defaults to invoke with
  [joaotavora/yasnippet](https://github.com/joaotavora/yasnippet).

- Spacemacs will look for custom snippets in directories stored under
  `~/.emacs.d/private/snippets`; as such, copy all snippets to that location to
  ensure proper detection.

- The name of the directory is used to invoke a set of snippets for a particular
  Emacs major mode. For example, snippets stored under
  `~/.emacs.d/private/snippets/org-mode` will be loaded when in `org-mode`.

- To reload snippets, call `yas-recompile-all`, then `yas-reload-all`.
