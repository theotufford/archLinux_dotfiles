config_files=$(ls -a ./ | grep -E "bash|rc|zsh" | grep "^\." | tr '\n' ' ')

mkdir -p ~/homeDirFilesBackup/
for con_file_name in $config_files; do
  con_file="$HOME/$con_file_name"
  if [[ -f $con_file ]]; then
    cp $con_file "$HOME/homeDirFilesBackup/"
  fi
  rm $con_file
  echo "linking local $con_file_name home dir"
  ln -s "$PWD/$con_file_name" $con_file
done
