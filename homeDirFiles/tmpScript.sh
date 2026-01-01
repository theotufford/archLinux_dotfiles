for obj in $(ls -a ./ | grep 'rc|zsh' | tr  '\n' ' '); do
	rm  ~/$obj
	ln ~/.config/homeDirFiles/$obj -s ~/$obj
done
