#!/bin/bash
echo "    _________   ____________  ____________________  __";
echo "   / ____/   | / ____/  _/ / /_  __/ ____/ ____/ / / /";
echo "  / /_  / /| |/ /    / // /   / / / __/ / /   / /_/ / ";
echo " / __/ / ___ / /____/ // /___/ / / /___/ /___/ __  /  ";
echo "/_/   /_/  |_\____/___/_____/_/ /_____/\____/_/ /_/   ";
echo "                                                      ";
echo "https://github.com/faciltech"
if [ "$1" == "" ];   
then
	echo "Use o script da seguinte forma: "
	echo "Ex1: ./achardir.sh dominio.com.br"
	echo "Ex2: ./achardir.sh dominio.com.br /usr/share/dirb/wordlist/common.txt /usr/share/dirb/wordlist/small.txt"

else     
	clear
echo "    _________   ____________  ____________________  __";
echo "   / ____/   | / ____/  _/ / /_  __/ ____/ ____/ / / /";
echo "  / /_  / /| |/ /    / // /   / / / __/ / /   / /_/ / ";
echo " / __/ / ___ / /____/ // /___/ / / /___/ /___/ __  /  ";
echo "/_/   /_/  |_\____/___/_____/_/ /_____/\____/_/ /_/   ";
echo "                                                      ";
echo "https://github.com/faciltech"

	echo "########################################################"
	echo "$(tput setaf 3)" "$(tput blink)" "########## Autor: Eduardo Amaral ##############" "$(tput sgr0)"
	echo "########################################################"
	echo "[+]  Se nao usar nenhuma wordlist o programa usa a lista padrao como no exemplo"
	echo "[+]  Ex1: ./recondomain dominio.com.br "
	echo "[+]  Caso queira usar uma wordlist propria pode fazer como no exemplo usando duas"
	echo "     uma para diretorios e outra para tipo de arquivo"
	echo "[+]  Ex2: ./recondomain site.com.br diretorios.txt arquivos.txt"
	sleep 2
	echo " "
	echo "Escolha um das opcoes de wordlist para extensoes de arquivo"
	echo "1 - somente php"
	echo "2 - somente html"
	echo "3 - somente sql"
	echo "4 - somente txt"
	echo "5 - All [E BASTANTE DEMORADA, VAI LEVAR HORAS"
	echo "Digite o numero correspondente: "
	read tipo
	mkdir -p $1
	cd $1
	case $tipo in
		1) extensao=$(echo "../ext1") ;;
		2) extensao=$(echo "../ext2");;
		3) extensao=$(echo "../ext3");;
		4) extensao=$(echo "../ext4");;
		5) extensao=$(echo "../ext5");;
	esac
		touch diretorios arquivos
		#echo $extensao
		echo " "
		echo "Iniciando a coleta de diretorios ..."
		echo "############ Diretorios Encontrados ##################"
		echo " "
if [ "$2" == "" ]; then         
        for dir in $(cat ../dir.txt)
        do
                resposta=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir")
                #echo  "$dir => $resposta"
                if [ "$resposta" != "404" ];
                then
                        echo "Diretorio encontrado =>  $dir [$resposta]"
                        echo $dir >> diretorios
                fi
        done
        echo " "
        echo "Iniciando a coleta de arquivos .... "
        echo " "
        echo "########### Arquivos Encontrados #####################"

	for arq in $(cat ../arq.txt)
	do
		for ext in $(cat $extensao)
         	do
			        resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$arq""$ext")
                               # echo "$1"/"$arq""$ext = $resp"
                                if [ "$resp" != "404" ] && [ "$resp" != "403" ];
                                then
                                        echo "Arquivo encontrado => $1/$arq$ext [$resp]"
					echo $1/$arq$ext >> arquivos
                                fi
		done
	done
	for dir in $(cat diretorios)
	do
		for arq in $(cat ../arq.txt)
        	do
			for ext in $(cat $extensao)
			do
                                resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir"/"$arq""$ext")
                                #echo "$1"/"$dir"/"$arq""$ext = $resp"
                                if [ "$resp" != "404" ] && [ "$resp" != "403" ];
                                then
                                        echo "Arquivo encontrado => $1/$dir/$arq$ext [$resp]"
					echo $1/$dir/$arq$ext >> arquivos
                                fi
			done
        	done

	done
else
        echo "" > diretorios
        echo "" > arquivos
        for dir in $(cat $2)
        do
                resposta=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir")
                if [ "$resposta" != "404" ];
                then
                        echo "Diretorio encontrado =>  $dir [$resposta]"
                        echo $dir >> diretorios
                fi
        done
        echo " "
        echo "Iniciando a coleta de arquivos..."
        echo "########### Arquivos Encontrados #####################"
        for arq in $(cat $3)
        do
                for ext in $(cat $extensao)
                do
                        resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$arq""$ext")
                        #echo "$1"/"$arq$ext = $resp"
                        if [ "$resp" != "404" ] && [ "$resp" != "403" ];
                        then
                                echo "Arquivo encontrado => $1/$arq$ext [$resp]"
                                echo $arq$ext >> arquivos
                        fi
                done
        done


        for dir in $(cat diretorios)
        do
                for  arq in $(cat arquivos)
                do
                        for ext in $(cat $extensao)
                        do
                                resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir"/"$arq""$ext")
                                #echo "$1"/"$dir"/"$arq$ext = $resp"
                                if [ "$resp" != "404" ] && [ "$resp" != "403" ];
                                then
                                        echo "Arquivo encontrado => $1/$dir/$arq$ext [$resp]"
                                 fi
                        done
                done
        done
fi
echo "########################################################"
echo "#################### FIM DA CONSULTA ###################"
echo "########################################################"
fi
