
```
pacman -S noto-fonts-{cjk,emoji,extra} ttf-hack-nerd wl-clipboard plasma-{desktop,pa} dolphin kscreen fcitx5-{im,chinese-addons} alacritty
```

tools
```
code rnote bottom scrcpy clang mold rustup
```

install cargo
```
rustup toolchain install nightly
mkdir .cargo
vi .cargo/config.toml
```
    
add following things
```
[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=/bin/mold"]
```

config clangd
```
cd .config
mkdir clangd
vi clangd/config.yaml
```

add following things
```
CompileFlags:
  Add: -Wall
```

config alacritty
```
mkdir -p alacritty/themes
git clone https://github.com/alacritty/alacritty-theme alacritty/themes
vi alacritty/alacritty.toml
```

add following things
```
import = [
    "~/.config/alacritty/themes/themes/tokyo-night-storm.toml"
]
```

install paru
```
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

disable wacom
```
sudo rmmod wacom
```

