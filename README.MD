# Deltaforge example

This packs a (trivial) Python environment, containing a single pure Python
package for demonstration reasons.

This wraps pixi-pack and the environment .tar it creates with an Inno Setup
installer.

pixi-pack: https://github.com/Quantco/pixi-pack

Inno Setup: https://jrsoftware.org/isinfo.php

pixi-pack can be installed via pixi: `pixi global install pixi-pack`

Inno Setup can be installed via scoop: `scoop install inno-setup`

Note: it may be easier to pull a pixi-pack exe from a github release, since
inno setup needs the path. Currently, update this line:

```
Source: "Z:/bin/pixi-pack.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
```

in the `installer.iss` file.

