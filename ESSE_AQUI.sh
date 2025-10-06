#!/bin/bash
function _Barra() {
  SEMCOR=$(tput sgr0)
  VERMELHOG='\E[31;1m'
  VERDEG='\E[32;1m'
  SUBLINHADO="\E[4m"
  FUNDO=("$(tput bold)\033[48;5;7m\033[38;5;0m" "$(tput bold)\033[48;5;8m\033[38;5;0m")
  BARRA=$(
  for i in $(seq 1 $(stty size | cut -d' ' -f2)); do echo -n "="; done
  echo
)
echo $BARRA
}

#wget -q --spider http://pudim.com.br
#if [ $? -eq 0 ]; then
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( °▽°)=  Iniciando a instalação'
  echo -e $VERMELHOG '  〜( \¥/)〜'$SEMCOR
  _Barra

  sudo tee /etc/sudoers.d/$USER <<END
$USER ALL=(ALL) NOPASSWD: ALL
END

cd ~/Downloads;

function _ConfiguraRepositorios() {
  echo 'clean_requirements_on_remove=True' | sudo tee -a /etc/dnf/dnf.conf
  echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
  echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
  echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf


  sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf update -y
}

function _InstalaDependencias() {
  sudo dnf install -y neovim most zsh lsd bat gnome-extensions-app bpytop vlc telegram-desktop  nmap libgda libgda-sqlite fragments
}

function _ConfiguraGnome() {
  gsettings set org.gnome.desktop.interface show-battery-percentage 'true'
  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
  gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll 'false'
  gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'
  gsettings set org.gnome.mutter center-new-windows 'true'
  gsettings set org.gnome.desktop.wm.preferences resize-with-right-button 'true'
  # gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.shell.app-switcher current-workspace-only 'true'
  gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'

  sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface show-battery-percentage 'true'
  sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
  sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll 'false'
  sudo -u gdm dbus-launch gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'
  sudo -u gdm dbus-launch gsettings set org.gnome.mutter center-new-windows 'true'
  sudo -u gdm dbus-launch gsettings set org.gnome.desktop.wm.preferences resize-with-right-button 'true'
  # sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
  sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  sudo -u gdm dbus-launch gsettings set org.gnome.shell.app-switcher current-workspace-only 'true'
  sudo -u gdm dbus-launch gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'

  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/ name 'Kitty'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/ command 'kitty'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/ binding '<Control><Alt>T'

  gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Contacts.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Characters.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Software.desktop', 'org.gnome.Photos.desktop', 'firefox.desktop']"
  gsettings set org.gnome.shell favorite-apps "[]"
  gsettings set org.gnome.shell disabled-extensions "[]"
  gsettings set org.gnome.shell enabled-extensions "['hidetopbar@mathieu.bidon.ca', 'windowIsReady_Remover@nunofarruca@gmail.com', 'appindicatorsupport@rgcjonas.gmail.com', 'firefox-pip@bennypowers.com', 'caffeine@patapon.info', 'draw-on-your-screen2@zhrexl.github.com', 'pip-on-top@rafostar.github.com', 'pano@elhan.io']"
  gsettings set org.gnome.shell.extensions.hidetopbar mouse-sensitive 'true'
  gsettings set org.gnome.shell.extensions.hidetopbar mouse-sensitive-fullscreen-window 'false'
  #gsettings set org.gnome.shell.extensions.hidetopbar pressure-threshold 75
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ apps "['gnome-system-monitor.desktop', 'nvim.desktop', 'org.fedoraproject.MediaWriter.desktop', 'org.gnome.Cheese.desktop', 'org.gnome.Connections.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.eog.desktop', 'org.gnome.Terminal.desktop', 'simple-scan.desktop']"
  gsettings set org.gnome.shell app-picker-layout "[{'org.mozilla.firefox.desktop': <{'position': <0>}>, 'kitty.desktop': <{'position': <1>}>, 'chromium-browser.desktop': <{'position': <2>}>, 'org.telegram.desktop.desktop': <{'position': <3>}>, 'com.discordapp.Discord.desktop': <{'position': <4>}>, 'org.gnome.Nautilus.desktop': <{'position': <5>}>, 'org.gnome.Boxes.desktop': <{'position': <6>}>, 'org.gnome.TextEditor.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'com.stremio.Stremio.desktop': <{'position': <9>}>, 'steam.desktop': <{'position': <10>}>, 'org.gnome.Extensions.desktop': <{'position': <11>}>, 'org.gnome.Settings.desktop': <{'position': <12>}>}, {'org.gnome.Loupe.desktop': <{'position': <0>}>, 'org.gnome.Weather.desktop': <{'position': <1>}>, 'org.gnome.Maps.desktop': <{'position': <2>}>, 'org.gnome.Calendar.desktop': <{'position': <3>}>, 'org.gnome.clocks.desktop': <{'position': <4>}>, 'org.gnome.Contacts.desktop': <{'position': <5>}>, 'org.gnome.Snapshot.desktop': <{'position': <6>}>, 'org.gnome.Totem.desktop': <{'position': <7>}>, 'vlc.desktop': <{'position': <8>}>, 'libreoffice-writer.desktop': <{'position': <9>}>, 'libreoffice-impress.desktop': <{'position': <10>}>, 'libreoffice-calc.desktop': <{'position': <11>}>, 'org.gnome.Software.desktop': <{'position': <12>}>, 'org.gnome.Characters.desktop': <{'position': <13>}>, 'org.gnome.Evince.desktop': <{'position': <14>}>, 'megasync.desktop': <{'position': <15>}>, 'org.gnome.Ptyxis.desktop': <{'position': <16>}>, 'de.haeckerfelix.Fragments.desktop': <{'position': <17>}>, 'yelp.desktop': <{'position': <18>}>, 'org.gnome.Tour.desktop': <{'position': <19>}>, 'org.gnome.font-viewer.desktop': <{'position': <20>}>, 'Utilities': <{'position': <21>}>, 'System': <{'position': <22>}>}]"

  sudo grubby --update-kernel=ALL --args="mitigations=off"
  sudo grubby --update-kernel=ALL --args="mem_sleep_default=s2idle"
  sudo systemctl disable NetworkManager-wait-online.service
  sudo rm /etc/xdg/autostart/org.gnome.Software.desktop

  #https://www.bitday.me/download/
  mkdir -p ~/.local/share/backgrounds/8BitDay
  cd ~/.local/share/backgrounds/8BitDay
  wget https://raw.githubusercontent.com/xaeioux/MeuFedora/main/Fundo/8BitDay.xml
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/01-Inicio-Manha.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/02-Meio-Manha.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/03-Fim-Manha.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/04-Inicio-Tarde.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/05-Meio-Tarde.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/06-Fim-Tarde.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/07-Inicio-Crepusculo.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/08-Meio-Crepusculo.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/09-Fim-Crepusculo.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/10-Inicio-Noite.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/11-Meio-Noite.png
  wget https://github.com/xaeioux/MeuFedora/raw/main/Fundo/12-Fim-Noite.png
  sed -i "s/MUDAR/\/home\/$USER/g" /home/$USER/.local/share/backgrounds/8BitDay/8BitDay.xml

  echo '<?xml version="1.0"?>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '<wallpapers>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '  <wallpaper deleted="false">' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '    <name>8BitDay</name>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo "    <filename>/home/$USER/.local/share/backgrounds/8BitDay/8BitDay.xml</filename>" | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo "    <filename-dark>/home/$USER/.local/share/backgrounds/8BitDay/8BitDay.xml</filename-dark>" | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '    <options>stretched</options>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '    <shade_type>solid</shade_type>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '    <pcolor>#3071AE</pcolor>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '    <scolor>#000000</scolor>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '  </wallpaper>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml
  echo '</wallpapers>' | sudo tee -a /usr/share/gnome-background-properties/8BitDay.xml

  gsettings set org.gnome.desktop.background picture-uri "file://$HOME/.local/share/backgrounds/8BitDay/8BitDay.xml"
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.local/share/backgrounds/8BitDay/8BitDay.xml"
  gsettings set org.gnome.desktop.background picture-options 'stretched'

  mkdir /$HOME/Trabalho
}

function _InstalaExtensions() {
  wget -N -q "https://raw.githubusercontent.com/ToasterUwU/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./install-gnome-extensions.sh
  chmod +x install-gnome-extensions.sh
  ./install-gnome-extensions.sh --enable 615 545 517 4937 5278 1007
  rm -f ./install-gnome-extensions.sh
  # V - 615  = AppIndicator and KStatusNotifierItem Support
  # X - 545  = Hide Top Bar
  # V - 517  = Caffeine
  # X - 4937 = Draw On Your Screen 2
  # V - 5278 = Pano - Clipboard Manager
  # V - 1007 = Window Is Ready - Notification remover
}

function _InstalaMegasync() {
  wget https://mega.nz/linux/repo/Fedora_$(rpm -E %fedora)/x86_64/megasync-Fedora_$(rpm -E %fedora).x86_64.rpm
  sudo dnf install -y megasync-Fedora_$(rpm -E %fedora).x86_64.rpm
  wget https://mega.nz/linux/repo/Fedora_$(rpm -E %fedora)/x86_64/nautilus-megasync-Fedora_$(rpm -E %fedora).x86_64.rpm
  sudo dnf install -y nautilus-megasync-Fedora_$(rpm -E %fedora).x86_64.rpm
}

function _InstalaKitty() {
  sudo dnf install kitty -y
  if [ ! -d /home/$USER/.config/kitty/ ]; then
    mkdir -p /home/$USER/.config/kitty/
  fi
  {
    echo 'export TERM=xterm-256color'
    echo 'hide_window_decoration yes'
    echo 'scrollback_lines -1'
    echo ""
    echo '# CORES'
    echo 'color4 #15539e'
    echo ""
    echo '# ATALHOS'
    echo 'map alt+left resize_window narrower'
    echo 'map alt+right resize_window wider'
    echo 'map alt+up resize_window taller'
    echo 'map alt+down resize_window shorter'
    echo 'map page_up scroll_page_up'
    echo 'map page_down scroll_page_down'
    echo 'map ctrl+down detach_tab'
    echo 'map f2 set_tab_title'
    echo 'map ctrl+k send_text all ~.'
    echo ""
    echo '# TEMA ADWAITA'
    echo 'foreground            #b8bcb9'
    echo 'background            #262626'
    echo 'selection_foreground  #1e1e1e'
    echo 'selection_background  #4a90d9'
    echo ""
    echo 'url_color #8be9fd'
    echo 'detect_url yes'
    echo 'url_style curly'
    echo ""
    echo '# CORES DO CURSOR'
    echo 'cursor            #f8f8f2'
    echo 'cursor_text_color background'
    echo ""
    echo '# BORDAS'
    echo 'active_border_color #0d73cc'
    echo 'inactive_border_color #031769'
    echo ""
    echo '# BARRA DE ABAS'
    echo 'tab_bar_style powerline'
    echo 'tab_powerline_style slanted'
    echo 'tab_title_template {sup.index} {title}'
    echo 'tab_bar_min_tabs 1'
    echo 'tab_bar_margin_height 1.5 0.0'
    echo ""
    echo '# CORES DAS ABAS'
    echo 'active_tab_foreground   #f8f8f2'
    echo 'active_tab_background   #0d73cc'
    echo 'active_tab_font_style   bold-italic'
    echo 'inactive_tab_foreground #b3b3b3'
    echo 'inactive_tab_background #10417b'
    echo 'inactive_tab_font_style normal'
    echo ""
    echo '# FONTES'
    echo 'bold_font        auto'
    echo 'italic_font      auto'
    echo 'bold_italic_font auto'
    echo ""
    echo 'linux_display_server x11'
  } >/home/$USER/.config/kitty/kitty.conf
  wget https://raw.githubusercontent.com/xaeioux/MeuFedora/main/Confs/bpytop.conf
  mkdir /home/$USER/.config/bpytop/
  mv bpytop.conf /home/$USER/.config/bpytop/
}

function _ConfiguraZsh() {
  wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/LiberationMono/LiterationMonoNerdFont-Regular.ttf
  mkdir /home/$USER/.local/share/fonts
  sudo cp LiterationMonoNerdFont-Regular.ttf /home/$USER/.local/share/fonts
  sudo mv LiterationMonoNerdFont-Regular.ttf /usr/share/fonts
  mkdir /home/$USER/.config/.zsh/
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$USER/.config/.zsh/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USER/.config/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$USER/.config/.zsh/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-history-substring-search /home/$USER/.config/.zsh/zsh-history-substring-search
  {
    echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then'
    echo 'source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"'
    echo 'fi'
    echo ""
    echo 'function set-term-title-precmd() {'
    echo 'emulate -L zsh'
    echo "print -rn -- \$'\e]0;'\${(V%):-'%~'}\$'\\a' >\$TTY"
    echo '}'
    echo ""
    echo 'function set-term-title-preexec() {'
    echo 'emulate -L zsh'
    echo "print -rn -- \$'\e]0;'\${(V)1}\$'\a' >\$TTY"
    echo '}'
    echo ""
    echo 'autoload -Uz add-zsh-hook'
    echo 'add-zsh-hook preexec set-term-title-preexec'
    echo 'add-zsh-hook precmd set-term-title-precmd'
    echo 'set-term-title-precmd'
    echo ""
    echo 'export PAGER="most"'
    echo "export LESS_TERMCAP_mb=\$'\e[1;32m'"
    echo "export LESS_TERMCAP_md=\$'\e[1;32m'"
    echo "export LESS_TERMCAP_me=\$'\e[0m'"
    echo "export LESS_TERMCAP_se=\$'\e[0m'"
    echo "export LESS_TERMCAP_so=\$'\e[01;33m'"
    echo "export LESS_TERMCAP_ue=\$'\e[0m'"
    echo "export LESS_TERMCAP_us=\$'\e[1;4;31m'"
    echo ""
    echo 'export TERM=xterm-256color'
    echo 'export EDITOR=nvim'
    echo ""
    echo 'alias ls="lsd"'
    echo 'alias history="history -f"'
    echo 'alias more="bat"'
    echo 'alias less="bat"'
    echo 'alias diff="diff --color=auto"'
    echo 'alias top="bpytop"'
    echo 'alias hss="ssh -i ~/Documentos/vaps.key"'
    echo 'alias vim="nvim"'
    echo ""
    echo 'export HISTFILE=~/.histfile'
    echo 'export HISTSIZE=1000000'
    echo 'export SAVEHIST=1000000'
    echo ""
    echo 'setopt INC_APPEND_HISTORY_TIME'
    echo 'setopt EXTENDED_HISTORY'
    echo 'setopt NO_BEEP'
    echo 'unsetopt NO_MATCH'
    echo 'setopt AUTO_CD'
    echo 'setopt BEEP'
    echo 'setopt NOMATCH'
    echo 'setopt NOTIFY'
    echo 'setopt INC_APPEND_HISTORY'
    echo 'setopt SHARE_HISTORY'
    echo 'setopt HIST_EXPIRE_DUPS_FIRST'
    echo 'setopt HIST_IGNORE_DUPS'
    echo 'setopt HIST_IGNORE_ALL_DUPS'
    echo 'setopt HIST_FIND_NO_DUPS'
    echo 'setopt HIST_SAVE_NO_DUPS'
    echo 'setopt HIST_REDUCE_BLANKS'
    echo 'setopt HIST_VERIFY'
    echo 'setopt HIST_BEEP'
    echo 'setopt INTERACTIVE_COMMENTS'
    echo 'setopt MAGIC_EQUAL_SUBST'
    echo 'setopt NULL_GLOB'
    echo 'autoload compinit && compinit'
    echo ""
    echo 'bindkey "^[[2~" overwrite-mode'
    echo 'bindkey "^[[3~" delete-char'
    echo 'bindkey "^[[H" beginning-of-line'
    echo 'bindkey "^[[1~" beginning-of-line'
    echo 'bindkey "^[[F" end-of-line'
    echo 'bindkey "^[[4~" end-of-line'
    echo 'bindkey "^[[1;5C" forward-word'
    echo 'bindkey "^[[1;5D" backward-word'
    echo 'bindkey "^[[3;5~" kill-word'
    echo 'bindkey "^[[5~" beginning-of-buffer-or-history'
    echo 'bindkey "^[[6~" end-of-buffer-or-history'
    echo ""
    echo '# Use powerline'
    echo 'USE_POWERLINE="true"'
    echo 'source ~/.config/.zsh/powerlevel10k/powerlevel10k.zsh-theme'
    echo 'source ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'
    echo 'source ~/.config/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
    echo 'source ~/.config/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh'
    echo ""
    echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.'
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh'
    echo "alias mkpass='cd ~ && ./.mkpass.sh'"
    echo ""
    echo "bindkey '^[[A' history-substring-search-up"
    echo "bindkey '^[[B' history-substring-search-down"
  } >/home/$USER/.zshrc
  cd /home/$USER/
  {
    echo '#!/bin/bash'
    echo "VERMELHOG='\E[31;1m'"
    echo 'SEMCOR=$(tput sgr0)'
    echo ""
    echo 'case $1 in'
    echo "  ''|*[!0-9]*)"
    echo "echo -e \$VERMELHOG '    (\_/)'\$SEMCOR'      Ops!'"
    echo "echo -e \$VERMELHOG '   =( ⌐■-■)='\$SEMCOR'   Você precisa digitar o tamanho da senha.'"
    echo "echo -e \$VERMELHOG '    (乁\¥/)´'\$SEMCOR'   Ex: mkpass'\$VERMELHOG' 20 '\$SEMCOR;;"
    echo '  *) '
    echo 'RANDOMPASS=$(head /dev/urandom| tr -dc a-zA-Z0-9 | head -c$1);'
    echo 'CONT=`expr $1 + 1`'
    echo 'BARRA=''"$(seq -s '"'-' \$CONT|tr -d ""'[:digit:]')"'"'
    echo "CLR='\E[34;1m'"
    echo "RST='\E[0m'"
    echo ""
    echo "echo '+-'\$BARRA'-+'"
    echo 'echo -e "| $CLR$RANDOMPASS$RST |"'
    echo "echo '+-'\$BARRA'-+';;"
    echo 'esac'
  } >/home/$USER/.mkpass.sh
  chmod a+x .mkpass.sh
  sudo chsh $USER -s $(which zsh)
}

#function _InstalaSkype() {
#sudo dnf install -y https://repo.skype.com/latest/skypeforlinux-64.rpm 
#}

function _InstalaChromium() {
  sudo dnf install -y chromium
}

function _InstalaFlatpak() {
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  sudo flatpak remote-modify --enable flathub
  flatpak install -y com.discordapp.Discord
}

function _ConfiguraGrub() {
  HWVENDOR=$(hostnamectl | grep Vendor | awk {'print $3'})
  sudo mkdir /boot/grub2/themes
  git clone https://github.com/AdisonCavani/distro-grub-themes.git

  if [[ "$HWVENDOR" == "Lenovo" ]]; then
    mkdir distro-grub-themes/themes/lenovo  
    sudo tar -xf distro-grub-themes/themes/lenovo.tar -C distro-grub-themes/themes/lenovo
    sudo cp -r distro-grub-themes/themes/lenovo/ /boot/grub2/themes
    sudo chown root:root /boot/efi/EFI/fedora/themes/lenovo -Rf
    sudo sed -i 's/GRUB_TERMINAL_OUTPUT="console"/#GRUB_TERMINAL_OUTPUT="console"/' /etc/default/grub
    echo 'GRUB_GFXMODE="1920x1080,auto"' | sudo tee -a /etc/default/grub
    echo 'GRUB_FONT="/boot/grub2/fonts/unicode.pf2"' | sudo tee -a /etc/default/grub
    echo 'GRUB_THEME="/boot/grub2/themes/lenovo/theme.txt"' | sudo tee -a /etc/default/grub
  else
    mkdir distro-grub-themes/themes/fedora 
    sudo tar -xf distro-grub-themes/themes/fedora.tar -C distro-grub-themes/themes/fedora
    sudo cp -r distro-grub-themes/themes/fedora/ /boot/grub2/themes
    sudo chown root:root /boot/efi/EFI/fedora/themes/fedora -Rf
    sudo sed -i 's/GRUB_TERMINAL_OUTPUT="console"/#GRUB_TERMINAL_OUTPUT="console"/' /etc/default/grub
    echo 'GRUB_GFXMODE="1920x1080,auto"' | sudo tee -a /etc/default/grub
    echo 'GRUB_FONT="/boot/grub2/fonts/unicode.pf2"' | sudo tee -a /etc/default/grub
    echo 'GRUB_THEME="/boot/grub2/themes/fedora/theme.txt"' | sudo tee -a /etc/default/grub
  fi
  sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
}

function _InstalaSteam() {
  sudo dnf install -y steam --enablerepo=rpmfusion-nonfree-steam
}

function _ConfiguraNetwork() {
  { 
    echo '#!/bin/bash'
    echo 'ip link add virbr0 type bridge'
    echo 'ip address add 192.168.122.1/24 dev virbr0'
    echo 'ip link set dev virbr0 up'
    echo 'ip route add 192.168.122.0/24 via 0.0.0.0 dev virbr0' 
  } >/usr/bin/bridge.sh
  chmod a+x /usr/bin/bridge.sh
  chown root:root /usr/bin/bridge.sh

  {
    echo '[Unit]'
    echo 'Description=Up bridge routes'
    echo ""
    echo '[Service]'
    echo 'User=root'
    echo 'WorkingDirectory=/usr/bin'
    echo 'ExecStart=bridge.sh'
    echo 'Restart=always'
    echo ""
    echo '[Install]'
    echo 'WantedBy=multi-user.target'
  } >/etc/systemd/system/bridge.service
  chmod a+x /etc/systemd/system/bridge.service
  chown root:root /etc/systemd/system/bridge.service

  sudo systemctl daemon-reload
  sudo systemctl enable bridge.service
}

function _ConfereSistema() {
  x=0
  function _Fundo() {
    if [ $x -gt 0 ]; then
      x=0
    else
      x=$((x+1))
    fi
  }

  _ConferePacotes() {
    i=0
    PACOTES=(neovim most zsh lsd bat gnome-extensions-app bpytop vlc telegram-desktop  nmap libgda libgda-sqlite fragments)
    while [ "$i" -ne 14 ]
    do
      INVESTIGADOR=`dnf list installed ${PACOTES[$i]} 2>/dev/null | grep -v inst | wc -l`

      if [ "$INVESTIGADOR" -eq "1" ]; then
        _Fundo
        echo -e $VERDEG "✔ INSTALADO$SEMCOR   - ${FUNDO[$x]} ${PACOTES[$i]} $SEMCOR"
      else
        _Fundo
        echo -e $VERMELHOG "✘ FALTANDO$SEMCOR    - ${FUNDO[$x]} ${PACOTES[$i]} $SEMCOR" 
        echo -e "Quer tentar reinstalar o $SUBLINHADO$VERMELHOG${PACOTES[$i]}$SEMCOR? (s/n)"
        read RESPOSTA 
        if [ "$RESPOSTA" == "s" ] || [ "$RESPOSTA" == "S" ]; then
          sudo dnf install -y ${PACOTES[$i]}
        fi
      fi
      i=$((i+1))
    done 
  }

  _ConfereExtensoes() {
    i=0
    EXTENSOES=("pano@elhan.io" "appindicatorsupport@rgcjonas.gmail.com" "hidetopbar@mathieu.bidon.ca" "windowIsReady_Remover@nunofarruca@gmail.com" "caffeine@patapon.info" "draw-on-your-screen2@zhrexl.github.com")
    while [ "$i" -ne 6 ]
    do
      INVESTIGADOR=`gnome-extensions list | grep ${EXTENSOES[$i]} | wc -l`

      if [ "$INVESTIGADOR" -eq "1" ]; then
        _Fundo
        echo -e $VERDEG "✔ INSTALADO$SEMCOR   - ${FUNDO[$x]} ${EXTENSOES[$i]} $SEMCOR"
      else 
        _Fundo
        echo -e $VERMELHOG "✘ FALTANDO$SEMCOR    - ${FUNDO[$x]} ${EXTENSOES[$i]} $SEMCOR"
      fi
      i=$((i+1))
    done 
  
    i=0
    while [ "$i" -ne 6 ]
    do
      INVESTIGADOR=`gsettings get org.gnome.shell enabled-extensions | grep ${EXTENSOES[$i]} | wc -l`

      if [ "$INVESTIGADOR" -eq "1" ]; then
        _Fundo
        echo -e $VERDEG "✔ HABILITADO$SEMCOR  - ${FUNDO[$x]} ${EXTENSOES[$i]} $SEMCOR"
      else 
        _Fundo
        echo -e $VERMELHOG "✘ DESABILITADO$SEMCOR   - ${FUNDO[$x]} ${EXTENSOES[$i]} $SEMCOR"
      fi
      i=$((i+1))
    done 

  }

  _ConfereFlatpak() {
    i=0
    FLATPAK=(com.discordapp.Discord)

    while [ "$i" -ne 1 ]
    do
      INVESTIGADOR=`flatpak list | grep ${FLATPAK[$i]} | wc -l`

      if [ "$INVESTIGADOR" -eq "1" ]; then
        _Fundo
        echo -e $VERDEG "✔ INSTALADO$SEMCOR   - ${FUNDO[$x]} ${FLATPAK[$i]} $VERMELHOG(flatpak) $SEMCOR " 
      else
        _Fundo
        echo -e $VERMELHOG "✘ FALTANDO$SEMCOR   - ${FUNDO[$x]} ${FLATPAK[$i]} $VERMELHOG(flatpak) $SEMCOR" 
        echo -e $SUBLINHADO"Quer tentar reinstalar o $VERMELHOG${FLATPAK[$i]}?$SEMCOR (s/n)";read RESPOSTA 

        if [ "$RESPOSTA" == "s" ] || [ "$RESPOSTA" == "S" ]; then
          flatpak install -y ${FLATPAK[$i]}
        fi
      fi
      i=$((i+1))
    done }

    _ConfereGnome() {
      i=0
      GSETTINGS=("org.gnome.desktop.interface show-battery-percentage" "org.gnome.desktop.peripherals.touchpad tap-to-click" "org.gnome.desktop.sound allow-volume-above-100-percent" "org.gnome.mutter center-new-windows" "org.gnome.desktop.wm.preferences resize-with-right-button" "org.gnome.shell.app-switcher current-workspace-only" "org.gnome.shell.extensions.hidetopbar mouse-sensitive") 
      INVESTIGADOR=`gsettings get ${GSETTINGS[$i]} | grep 'true' | wc -l`

      while [ "$i" -ne 7 ]
      do
        if [ "$INVESTIGADOR" -eq "1" ]; then
          _Fundo
          echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $VERMELHOG(true) $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $VERMELHOG(true) $SEMCOR" 
        fi
        i=$((i+1))
      done
      i=0
      GSETTINGS=("org.gnome.desktop.peripherals.touchpad natural-scroll" "org.gnome.desktop.peripherals.touchpad tap-to-click") 
      INVESTIGADOR=`gsettings get ${GSETTINGS[$i]} | grep 'false' | wc -l`
      while [ "$i" -ne 2 ]
      do
        if [ "$INVESTIGADOR" -eq "1" ]; then
          _Fundo
          echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $VERMELHOG(false) $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $VERMELHOG(false) $SEMCOR" 
        fi
        i=$((i+1))
      done

      i=0
      GSETTINGS=("org.gnome.shell favorite-apps" "org.gnome.shell disabled-extensions") 
      INVESTIGADOR=`gsettings get ${GSETTINGS[$i]} | grep '\[\]' | wc -l`

      while [ "$i" -ne 2 ]
      do
        if [ "$INVESTIGADOR" -eq "1" ]; then
          _Fundo
          echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $SEMCOR" 
        fi
        i=$((i+1))
      done

      i=0
      GSETTINGS=("org.gnome.desktop.interface gtk-theme" "org.gnome.desktop.interface color-scheme") 
      INVESTIGADOR=`gsettings get ${GSETTINGS[$i]} | grep dark | wc -l`
      while [ "$i" -ne 2 ]
      do
        if [ "$INVESTIGADOR" -eq "1" ]; then
          _Fundo
          echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $SEMCOR" 
        fi
        i=$((i+1))
      done
      INVESTIGADOR=`gsettings get org.gnome.desktop.search-providers disabled | grep "'org.gnome.Contacts.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Characters.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Software.desktop', 'org.gnome.Photos.desktop'" | wc -l`
      if [ "$INVESTIGADOR" -eq "1" ]; then
        _Fundo
        echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} org.gnome.desktop.search-providers disabled $SEMCOR" 
      else
        _Fundo
        echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} org.gnome.desktop.search-providers disabled $SEMCOR" 
      fi

      INVESTIGADOR=`gsettings get org.gnome.shell.extensions.hidetopbar pressure-threshold`
      if [ "$INVESTIGADOR" -eq "75" ]; then
        _Fundo
        echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} org.gnome.shell.extensions.hidetopbar pressure-threshold $INVESTIGADOR $SEMCOR" 
      else
        _Fundo
        echo -e $VERMELHOG "✘ FALTANDO$SEMCOR    - ${FUNDO[$x]} org.gnome.shell.extensions.hidetopbar pressure-threshold $INVESTIGADOR $SEMCOR" 
      fi

      i=0

      GSETTINGS=("org.gnome.desktop.background picture-uri" "org.gnome.desktop.background picture-uri-dark") 
      INVESTIGADOR=`gsettings get ${GSETTINGS[$i]} | grep 8Bit | wc -l`
      while [ "$i" -ne 2 ]
      do
        if [ "$INVESTIGADOR" -eq "1" ]; then
          _Fundo
          echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $VERMELHOG'8BitDay' $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} ${GSETTINGS[$i]} $VERMELHOG'8BitDay' $SEMCOR" 
        fi
        i=$((i+1))
      done

      INVESTIGADOR=`gsettings get org.gnome.desktop.background picture-options | grep 'stretched' | wc -l`
      if [ "$INVESTIGADOR" -eq "1" ]; then
        _Fundo
        echo -e $VERDEG "✔ CONFIGURADO$SEMCOR - ${FUNDO[$x]} org.gnome.desktop.background picture-options $VERMELHOG'stretched' $SEMCOR" 
      else
        _Fundo
        echo -e $VERMELHOG "✘ FALTANDO$SEMCOR - ${FUNDO[$x]} org.gnome.desktop.background picture-options $VERMELHOG'stretched' $SEMCOR" 
      fi
    }

    function _ConfereArquivos() {
      i=0
      ARQUIVOS=('/usr/share/gnome-background-properties/8BitDay.xml' "/home/$USER/.local/share/backgrounds/8BitDay/8BitDay.xml" "/home/$USER/.config/kitty/kitty.conf" "/home/$USER/.config/bpytop/bpytop.conf" "/home/$USER/.zshrc" "/home/$USER/.mkpass.sh")
      DIRETORIOS=("/home/$USER/.local/share/backgrounds/8BitDay" "/home/$USER/.config/kitty/" "/home/$USER/.config/.zsh/powerlevel10k" "/home/$USER/.config/.zsh/zsh-autosuggestions" "/home/$USER/.config/.zsh/zsh-syntax-highlighting" "/home/$USER/.config/.zsh/zsh-history-substring-search")
      while [ "$i" -ne 6 ]
      do
        if  test -f "${ARQUIVOS[$i]}" ; then
          _Fundo
          echo -e $VERDEG "✔ EXISTE     $SEMCOR - ${FUNDO[$x]} ${ARQUIVOS[$i]} $VERMELHOG $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ NAO EXISTE $SEMCOR - ${FUNDO[$x]} ${ARQUIVOS[$i]} $VERMELHOG $SEMCOR" 
        fi
        i=$((i+1))
      done
      i=0
      while [ "$i" -ne 6 ]
      do
        if  [ -d "${DIRETORIOS[$i]}" ]; then
          _Fundo
          echo -e $VERDEG "✔ EXISTE     $SEMCOR - ${FUNDO[$x]} ${DIRETORIOS[$i]} $VERMELHOG $SEMCOR" 
        else
          _Fundo
          echo -e $VERMELHOG "✘ NAO EXISTE $SEMCOR - ${FUNDO[$x]} ${DIRETORIOS[$i]} $VERMELHOG $SEMCOR" 
        fi
        i=$((i+1))
      done
    }
    echo "";
    _ConferePacotes
    _Barra
    _ConfereExtensoes
    _Barra
    _ConfereFlatpak
    _Barra
    _ConfereGnome
    _Barra
    _ConfereArquivos
  }

  function _LimpaSistema() {
    sudo dnf -y remove gnome-shell-extension-background-logo util-linux-user rhythmbox gnome-shell-extension-gamemode
    sudo rm -rf /home/$USER/distro-grub-themes
    sudo rm -rf /home/$USER/Downloads/*
    sudo dnf -y autoremove
  }

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =(｡•ᵕ•｡)=  Configurando repositórios'
  echo -e $VERMELHOG '    (乁\¥/)っ━☆ﾟ*･｡*･｡･:*:･ﾟ’★,｡･:*:･ﾟ’☆'$SEMCOR
  _Barra
  _ConfiguraRepositorios

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)✧'
  echo -e $VERMELHOG '   =( ｡•̀ᴗ-)=  Instalando dependencias'
  echo -e $VERMELHOG '    (乁\¥/)┘'$SEMCOR
  _Barra
  _InstalaDependencias

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ٥ಠᴥಠ)=  Instalando algumas...extensões'
  echo -e $VERMELHOG '    (>\¥/<)'$SEMCOR
  _Barra
  _InstalaExtensions

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ◕ヮ◕)=  Instalando MEGASYNC'
  echo -e $VERMELHOG '    (>\¥/<)'$SEMCOR
  _Barra
  _InstalaMegasync

  echo "";
  _Barra
  echo -e $VERMELHOG '     /\_/\'
  echo -e $VERMELHOG '   =(๑ʘﻌʘ๑)=  Instalando e configurando o KITTY'
  echo -e $VERMELHOG '  〜(ฅ\¥/ฅ)'$SEMCOR
  _Barra
  _InstalaKitty

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ⌐■-■)=  Configurando o ZSH'
  echo -e $VERMELHOG '    (乁\¥/)´'$SEMCOR
  _Barra
  _ConfiguraZsh


  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ￣＾￣)=  Instalando o CHROMIUM'
  echo -e $VERMELHOG '    ( >\¥/<)'$SEMCOR
  _Barra
  _InstalaChromium

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ˘､˘)=  Instalando alguns FLATPAKs'
  echo -e $VERMELHOG '    (╮\¥/╭)'$SEMCOR
  _Barra
  _InstalaFlatpak

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ˶˘³˘˶)=  Configurando GRUB'
  echo -e $VERMELHOG '    ( >\¥/<)'$SEMCOR
  _Barra
  _ConfiguraGrub

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( ø-ø)=  Instalando a STEAM'
  echo -e $VERMELHOG '    (³\¥/)´'$SEMCOR
  _Barra
  _InstalaSteam

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =(#ಠ益ಠ)=  Dando uns tapas no GNOME'
  echo -e $VERMELHOG '    ( ง\¥/)ง'$SEMCOR
  _Barra
  _ConfiguraGnome
  echo "";
  _Barra
  _ConfereSistema

  echo "";
  _Barra
  echo -e $VERMELHOG '    (\_/)'
  echo -e $VERMELHOG '   =( >x<)=  Limpando o sistema'
  echo -e $VERMELHOG '    (>\¥/)占~~~~~~~~~~~~~~~~~~~~~'$SEMCOR
  _Barra
  _LimpaSistema

  touch 70-wooting.rules
  {
    echo '# Wooting One Legacy'
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"'
    echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"'
    echo ""
    echo '# Wooting One update mode'
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"'
    echo ""
    echo '# Wooting Two Legacy'
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"'
    echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"'
    echo ""
    echo '# Wooting Two update mode'
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1102", MODE:="0660", GROUP="input"'
    echo ""
    echo '# Generic Wootings'
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"'
    echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"'
  } > wooting.rules
  sudo mv 70-wooting.rules /etc/udev/rules.d/
  sudo udevadm control --reload-rules && sudo udevadm trigger

  _Barra
  echo -e $VERMELHOG '   ..zzZZ..   YAY!'
  echo -e $VERMELHOG '    (\_/)     Todo o trabalho foi concluído'
  echo -e $VERMELHOG '   =(  ᴗ_ᴗ)=  com sucesso, agora sim, você'
  echo -e $VERMELHOG '    ( >\¥/)◜  pode aproveitar seu sistema !!'$SEMCOR
  _Barra
  echo "";
  gsettings set org.gnome.shell app-picker-layout "[{'org.mozilla.firefox.desktop': <{'position': <0>}>, 'kitty.desktop': <{'position': <1>}>, 'chromium-browser.desktop': <{'position': <2>}>, 'org.telegram.desktop.desktop': <{'position': <3>}>, 'com.discordapp.Discord.desktop': <{'position': <4>}>, 'org.gnome.Nautilus.desktop': <{'position': <5>}>, 'org.gnome.Boxes.desktop': <{'position': <6>}>, 'org.gnome.TextEditor.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'com.stremio.Stremio.desktop': <{'position': <9>}>, 'steam.desktop': <{'position': <10>}>, 'org.gnome.Extensions.desktop': <{'position': <11>}>, 'org.gnome.Settings.desktop': <{'position': <12>}>}, {'org.gnome.Loupe.desktop': <{'position': <0>}>, 'org.gnome.Weather.desktop': <{'position': <1>}>, 'org.gnome.Maps.desktop': <{'position': <2>}>, 'org.gnome.Calendar.desktop': <{'position': <3>}>, 'org.gnome.clocks.desktop': <{'position': <4>}>, 'org.gnome.Contacts.desktop': <{'position': <5>}>, 'org.gnome.Snapshot.desktop': <{'position': <6>}>, 'org.gnome.Totem.desktop': <{'position': <7>}>, 'vlc.desktop': <{'position': <8>}>, 'libreoffice-writer.desktop': <{'position': <9>}>, 'libreoffice-impress.desktop': <{'position': <10>}>, 'libreoffice-calc.desktop': <{'position': <11>}>, 'org.gnome.Software.desktop': <{'position': <12>}>, 'org.gnome.Characters.desktop': <{'position': <13>}>, 'org.gnome.Evince.desktop': <{'position': <14>}>, 'megasync.desktop': <{'position': <15>}>, 'org.gnome.Ptyxis.desktop': <{'position': <16>}>, 'de.haeckerfelix.Fragments.desktop': <{'position': <17>}>, 'yelp.desktop': <{'position': <18>}>, 'org.gnome.Tour.desktop': <{'position': <19>}>, 'org.gnome.font-viewer.desktop': <{'position': <20>}>, 'Utilities': <{'position': <21>}>, 'System': <{'position': <22>}>}]"
  sudo /bin/rm /etc/sudoers.d/$USER
  sudo -k
#else
#  _Barra
#  echo -e $VERMELHOG '    (\_/)    Ops!'
#  echo -e $VERMELHOG '   =( ⇀‸↼)=  Você está sem internet'
#  echo -e $VERMELHOG '   ୧( \¥/ )୨  Para continuar é necessário ter internet'$SEMCOR
#  _Barra
#fi
