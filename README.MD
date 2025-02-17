# Deltaforge example

This packs a (trivial) Python environment, containing a single pure Python
package for demonstration reasons.

This wraps pixi-pack and the environment .tar it creates with an Inno Setup
installer.

pixi-pack: https://github.com/Quantco/pixi-pack

Inno Setup: https://jrsoftware.org/isinfo.php

pixi-pack can be installed via pixi: 

```
pixi global install pixi-pack
```

Inno Setup can be installed via scoop: 

```
scoop bucket add extras
scoop install extras/inno-setup
```

Download the pixi-pack ``.exe`` from their [Github Releases
page](https://github.com/Quantco/pixi-pack/releases), and put it in the
``./bin`` folder.
