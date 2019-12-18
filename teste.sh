#!/bin/bash
echo "    _________   ____________  ____________________  __";
echo "   / ____/   | / ____/  _/ / /_  __/ ____/ ____/ / / /";
echo "  / /_  / /| |/ /    / // /   / / / __/ / /   / /_/ / ";
echo " / __/ / ___ / /____/ // /___/ / / /___/ /___/ __  /  ";
echo "/_/   /_/  |_\____/___/_____/_/ /_____/\____/_/ /_/   ";
echo "                                                      ";

echo " #######################################################"
echo "$(tput setaf 3)" "$(tput blink)" "########## Eduardo Amaral ##############" "$(tput sgr0)"
echo "########################################################"
echo "[+]  Se nao usar nenhuma wordlist o programa usa a lista padrao como no exemplo"
echo "[+]  Ex1: ./recondomain dominio.com.br "
echo "[+]  Caso queira usar uma wordlist propria pode fazer como no exemplo usando duas"
echo "     uma para diretorios e outra para tipo de arquivo"
echo "[+]  Ex2: ./recondomain site.com.br diretorios.txt arquivos.txt ext.txt"
sleep 3
echo " "
echo "Iniciando a coleta de diretorios ..."
echo "############ Diretorios Encontrados ##################"
#Codigo responsavel pela descoberta de diretorios
if [ "$2" == "" ]; then 
	for dir in $(cat dir.txt)
	do
		resposta=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir")
		if [ "$resposta" != "404" ];
		then
			echo "Diretorio encontrado =>  $dir [$resposta]"
		fi
	done
	echo "Iniciando a coleta de arquivos .... "
	echo "########### Arquivos Encontrados #####################"
	for arq in $(cat arq.txt)
	do
		for ext in $(cat ext.txt)
		do
			resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$arq""$ext")
			#echo "$1"/"$arq$ext = $resp"
			if [ "$resp" != "404" ] && [ "$resp" != "403" ];
			then
				echo "Arquivo encontrado => $1/$arq$ext [$resp]"
			fi
		done
	done
	for dir in $(cat dir.txt)
        do
                for  arq in $(cat arq.txt)
                do
                        for ext in $(cat ext.txt)
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

else
	for dir in $(cat $2)
        do
                resposta=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir")
                if [ "$resposta" != "404" ];
                then
                        echo "Diretorio encontrado =>  $dir [$resposta]"
                fi
        done
	echo "Iniciando a coleta de arquivos..."
        echo "########### Arquivos Encontrados #####################"
        for arq in $(cat $3)
        do
                for ext in $(cat $4)
                do
                        resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$arq""$ext")
                        #echo "$1"/"$arq$ext = $resp"
                        if [ "$resp" != "404" ] && [ "$resp" != "403" ];
                        then
                                echo "Arquivo encontrado => $1/$arq$ext [$resp]"
                        fi
                done
        done


	for dir in $(cat $2)
        do
		for  arq in $(cat $3)
		do
                	for ext in $(cat ext.txt)
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
