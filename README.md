# Fedora 39

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   (\_/)   +---------+ Cansei de pular de distro em distro e criei esse
  =('°-°)= |   Quê?  | script de pós instalação para o fedora. Use para  
   (> ¥ )☭ +---------+ facilitar o dia a dia. Testado e validado arduamente!
  ********             
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> (Último teste: 20/11/2023) ★ 
  
Feito com muita atenção, pensando na praticidade e software livre.
Pode ser usado por qualquer pessoa, basta executar o script e já terá um sistema otimizado
com um fluxo pensado no GNOME, por isso a escolha do Fedora, que entrega uma experiência ímpar,
tanto em desempenho quanto em estabilidade. 

Como usar:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wget -O - https://raw.githubusercontent.com/xaeioux/MeuFedora/main/ESSE_AQUI.sh | bash
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Recursos:
* Otimização no download de atualizações
* Configurações no GNOME:
   * Mostra a porcentagem da bateria.
   * Clica com o mousepad.
   * Rolagem natural desabilitada.
   * Volume acima de 100%.
   * Centraliza novas janelas.
   * Tema Escuro.
   * Atalho para o terminal ( Ctrl + Alt + T ).
   * Desabilitado fontes de pesquisa no Gnom e.
   * Removidos aplicativos favoritos.
* Wallpaper dinâmico
   * [8 Bit Day](https://bitday.me/download/).
* Gerenciador de área de transferência.
   * [Pano](https://github.com/oae/gnome-shell-pano). 
* Desenhe na tela ( Super + Alt + D ) ***Não está funcionando no gnome 45***
   * [Draw on Your Screen 2](https://github.com/zhrexl/DrawOnYourScreen2).
* Sincronização de arquivos com Nuvem
   * [MegaSync](https://github.com/meganz/MEGAsync). 
* Terminal
   * [Kitty](https://github.com/kovidgoyal/kitty).
* Zsh:
   * [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
   * [Powerlevel 10k](https://github.com/romkatv/powerlevel10k).
   * [Fish-like Autosuggestion](https://github.com/zsh-users/zsh-autosuggestions).
   * [Zsh Syntax Highlight](https://github.com/zsh-users/zsh-syntax-highlighting).
   * [Zsh History Substring Search](https://github.com/zsh-users/zsh-history-substring-search).
* Top da próxima geração.
   * [BpyTop](https://github.com/aristocratos/bpytop). 
* Ícones e cores em arquivos e diretórios.
   * [LSDeluxe](https://github.com/lsd-rs/lsd).
* Editor de texto
   * [NeoVim](https://github.com/neovim/neovim).
* IDE
   * [VSCodium](https://github.com/VSCodium/vscodium).
* Tema do Grub
   * [Distro Grub Themes](https://github.com/AdisonCavani/distro-grub-themes). 
* Skype
* Steam
* Melhorias no histórico do Zsh
* Gerador de senha aleatória ( mkpass )
* Checagem automática da instalação ( O script verifica se tudo rodou corretamente )

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⢻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠁⠘⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⣤⣤⣤⣤⣤⣤⣤⣤⣾⡏⠀⠀⢻⣷⣤⣤⣤⣤⣤⣤⣤⣤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣶⣄⠀⠀⠀⠀⠀⠀⣠⣴⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡟⠀⠀⠀⠀⠀⠀⢻⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⣠⣾⣷⣤⡀⠈⣿⡇⠀⠀⠀⠀⠀⠀⠠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⠏⠁⠀⠀⠀⠀⠀⠀⢀⣾⣧⣴⡿⠋⠁⠈⠙⢿⣦⣽⣿⡀⠀⠀⠀⠀⠀⠀⠈⢿⣶⣄⢀⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⡶⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠟⠉⠀⠀⠀⠀⠀⠀⠉⠻⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⣽⣿⣿⡹⣦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⣸⣿⢠⡿⣫⡾⠁⠀⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀⠀⠀⠲⣄⠀⠀⠀⠀⠀⠙⠂⠀⠀⠀⠀⠀⠀⠀⠹⣮⡻⣷⢹⣷⣤⡀⠀⠀⠀
⠀⠀⣰⠃⣿⣇⣭⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣷⣌⣿⡇⣷⡀⠀⠀
⠀⠀⣿⡀⣿⣾⢟⣵⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣝⠿⣿⡇⣿⡇⠀⠀
⠀⢸⣿⡇⣿⣵⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⡿⠛⠀⠀⠀⠀⠀⠙⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣷⣝⠃⣿⣿⠀⠀
⢸⡆⣿⣇⣿⡿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⡿⣿⣧⣿⡇⢸⠀
⢸⣇⢹⣿⡟⣹⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⣿⡿⠻⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣷⡘⢿⣿⢠⣿⠀
⢸⣿⡄⡟⣰⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠋⠀⠀⠈⠻⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢸⣷⡌⠇⣼⣿⠀
⣸⣿⣿⢰⣿⡏⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣿⣷⣄⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⡤⣿⣿⢸⣿⡏⡄
⢻⡘⣿⣾⣿⢁⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣄⠀⠀⣰⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢀⣇⢸⣿⣿⠏⣰⠃
⠸⣷⡌⢻⡏⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣰⣶⣄⡀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣴⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⢸⣿⢀⡿⢁⣼⡿⠀
⠀⠻⣿⣧⡁⢸⣿⡷⡄⠀⠀⠀⠀⠀⠀⠀⣨⣿⣿⠉⠻⣿⣿⣷⣶⣤⣤⣤⣤⣴⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⢀⡞⣿⣿⢈⣵⣿⡿⠁⠀
⠀⠀⣟⢿⣿⣾⣿⡇⢻⣆⠀⠀⠀⢀⣴⣿⣿⠋⠀⠀⠀⠀⠉⠻⠿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣷⣄⡀⠀⠀⠀⢠⣾⠃⣿⣏⣾⡿⢋⡆⠀⠀
⠀⠀⠘⣧⣌⠛⢿⣷⢸⣿⡆⡀⠀⢾⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠻⣿⣿⠋⠀⠀⣀⣿⣿⢰⡿⠛⣁⣴⡟⠀⠀⠀
⠀⠀⠀⠈⢻⣷⣶⣬⡃⢿⣿⡹⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡞⣹⣿⢃⣩⣶⣿⡿⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⣟⢿⣿⣷⣿⣷⡘⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡟⣱⣿⣷⣿⡿⢟⡽⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⢳⣦⣬⣭⣍⣛⣈⠻⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⠟⣋⣘⣭⣭⣤⣶⡶⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⣻⠿⠿⠿⠿⠟⠛⢋⣩⣽⣶⣾⠟⣛⣿⠶⢾⣿⡛⠻⣿⣶⣯⣍⡙⠛⠛⠻⠿⠟⢛⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢶⣶⣶⣶⣿⣿⡿⠟⢋⣴⡾⠋⠁⠀⠀⠈⠻⣷⣌⡙⠻⢿⣿⣿⣶⣶⡶⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠀⡀⢴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⠆⢀⣀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
