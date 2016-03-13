# holgersson-overlay

## Main
This is my "private" [overlay][holgersson-overlay]. There will be different ebuilds from different sources,
mostly temporary before submitting to the [main gentoo bugtracker][bgo].

## Setup & synchronisation

Just run layman from `app-portage/layman` with needed privileges, e.g. root:
```sh
$ layman -f -o https://git.holgersson.xyz/holgersson-overlay/plain/repository.xml -a holgersson-overlay
```
and optional for global updates:
```sh
$ layman -S
$ emerge --sync
```
You might set `USE="sync-plugin-portage"` for layman, too.

## Maintainer
If you encounter Bugs, send a mail to
```
nils [dot] freydank [ascii-symbol-no64] posteo [dot] de
```
Bug descriptions, suggestions, patches, critics and chorus of praise
are all welcome!


License
---
- The contents of this document are licensed under the `CC-BY-SA-3.0 license`. The ebuilds are licensed under the `GNU General Public License v2`.
- Source files might have different licenses; these should be outlined in the ebuilds themselves.
- The licenses are choosen to fit into the main gentoo licenses pool; if you suggest other licenses, please contact the author (see section Maintainer above).

[holgersson-overlay]: https://git.holgersson.xyz/holgersson-overlay.git
[bgo]: https://bugs.gentoo.org