lib=$(ls -a ~/ | grep -E "rc|zsh" | grep "^\." | tr  '\n' ' ')
for obj in $lib; do
	mkdir -p ~/homeDirFilesBackup
	if ! [[ -L "$HOME/$obj" ]]; then 
	echo "moving $obj to internal folder"
	cp ~/$obj ~/homeDirFilesBackup/
	mv ~/$obj ./$obj 
	else 
	echo "ensuring origin of $obj"
		rm ~/$obj || rm -rf 
	fi
	ln -sf ~/.config/homeDirFiles/$obj ~/$obj
done
