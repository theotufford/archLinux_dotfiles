keebDir=/run/media/theo/CIRCUITPY
sudo mount -o remount,rw $keebDir 
if [[ "$1" == "-b" ]]; then
	cp -f ./backup/main.py "$keebDir/"
fi

cp -f "$keebDir/"main.py ./backup/ 
cp -f main.py "$keebDir/"
