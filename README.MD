# Protoforge example

This packs a (trivial) Python environment, containing a single pure Python
package for demonstration reasons.

This wraps pixi-pack and the environment .tar it creates with a WiX MSI
installer.

pixi-pack: https://github.com/Quantco/pixi-pack

pixi-pack can be installed via a pixi task: 

```
pixi run install-pixi-pack
```

This will download the latest pixi-pack release from GitHub.

The WiX toolset can be installed via scoop: 

```
scoop install wixtoolset
```

This will install a modern WiX toolset, version 5. Consequently, you can need to
install the UI extension.

```
wix extension add WixToolset.UI.wixext/5.0.2
```
