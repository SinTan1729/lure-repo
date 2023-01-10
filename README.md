![Number of packages](https://img.shields.io/github/directory-file-count/SinTan1729/lure-repo?label=number%20of%20packages&type=dir)
## LURE Repository

This is a repository for my personal [LURE](https://github.com/Arsen6331/lure) build scripts. Of course, anyone else is welcome to use these.

These are written for RPM-based distros (I'm testing on AlmaLinux 9.1), but should work with most other distros as well.

## Notes
- Most of the scripts here are not what you'd usually expect in the sense that they don't have a hardcoded version. Since this is mostly for personal use, I wrote these so that they update to the latest version automatically. Otherwise, it just defeats the purpose. \
That said, for this very reason, some of the installers may break from time to time. If they do, do not hesitate to open an issue.
- Since these don't have a hardcoded version (instead, they have a placeholder `VERSION`), the `lure up` command does not detect their updates. \
To get them updated, it's recommended that you either update them manually using `lure up <package>` or use my [update script](https://github.com/SinTan1729/random/blob/main/lure-update.sh).