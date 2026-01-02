conf.d
======

Various configuration files and scripts.

Clone the repository to your home directory:

`git clone https://github.com/gbThreepwood/conf.d.git`

Add symbolic links in the appropriate location (**This overwrites any existing file**):

`ln -sfn <path to file> <symlink location>`

Caps Lock
---------

Use the caps-lock button for something slightly more useful by swapping it with Ctrl for Emacs use:

`setxkbmap -option 'ctrl:swapcaps'`

For a more advanced alternative, see the next section.

Kmonad
-----------

Kmonad is nice when you do not have a QMK keyboard, such as when you are using your laptop internal keyboard. If you want to use Kmonad you should configure it to start automatically upon boot of your computer.

You need to be member of the `input` group to capture the keyboard events from the real keyboard, and member of the uinput group to generate the key events from software.

```
sudo usermod -aG input $USER
sudo groupadd uinput
sudo usermod -aG uinput $USER
```

Add the following udev rule:

```
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
```

Make sure the uinput kernel module is loaded:

```
echo uinput | sudo tee /etc/modules-load.d/uinput.conf
```



SOFTWARE
--------

The repository keeps configurations for at least the following software:

* Emacs
* zsh
* i3
* rofi
* ranger
* zathura
* sxiv
* vim and neovim
* Dunst (https://dunst-project.org/)
