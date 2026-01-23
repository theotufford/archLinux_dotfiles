config_files=$(ls -a ./ | grep -E "bash|rc|zsh" | grep "^\." | tr '\n' ' ')

mkdir -p ~/homeDirFilesBackup/
for con_file_name in $config_files; do
  con_file="$HOME/$con_file_name"
  if [[ -L $con_file ]]; then
    continue
  elif [[ -f $con_file ]]; then
    cp $con_file "$HOME/homeDirFilesBackup/"
    rm $con_file
  fi
  echo "linking local $con_file_name home dir"
  ln -s "$PWD/$con_file_name" $con_file
done
