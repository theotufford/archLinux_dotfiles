for obj in $(ls -a ./ | grep rc | tr  '\n' ' '); do
	rm  ~/$obj
	ln ~/.config/homeDirFiles/$obj -s ~/$obj
done
