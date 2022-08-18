#!/bin/bash
Gitpull(){
  git clone https://github.com/sudoskys/Tool-Asoul-Music
  cd Tool-Asoul-Music || (echo "Cant find !?";exit 1)
  pip3 install --upgrade pip ; pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
  echo "Ok"
}
dataBack="$(pwd)/Music_data"
dir="$(pwd)/Tool-Asoul-Music"
data="$(pwd)/Tool-Asoul-Music/data"
echo "=============Setup============"
run(){
if [ ! -d "$dir" ]; then
  Gitpull
  else
  echo "Attention!!"
  read -r -p "Danger:Have already exist a project here ,remove its data? if not ,we will update your app with old data[Y/n] " input
  case $input in
	    [yY][eE][sS]|[yY])
			echo "Remove it"
			rm -r Tool-Asoul-Music
      Gitpull
      exit 0
			;;

	    [nN][oO]|[nN])
      if [ ! -f "$data" ]; then
         echo "cant find ${data} ,we will reinstall app...."
         rm -r Tool-Asoul-Music
         Gitpull
         else
         mkdir "$dataBack"
         echo "copy data...."
         cp -r "$data" "$dataBack"
         rm -r Tool-Asoul-Music
         Gitpull
         mkdir "$data"
         cp -r "$dataBack" "$data"
         echo "Down....."
      fi
			exit 0
			;;

	    *)
			echo "Invalid input"
			;;
	esac
fi
}

run || { echo "command failed"; exit 1; }





