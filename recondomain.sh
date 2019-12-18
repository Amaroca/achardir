#!/bin/bash
echo "####################################################"
echo "########## Autor: Eduardo Amaral #################"
echo "###################################################"
echo
echo "Ex: ./recondomain site.com.br php ext.txt wordlista.txt"
sleep 2
echo
echo "############ Diretorios Encontrados ##################"
for dir in $(cat dir.txt)
do
resposta=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir")
if [ "$resposta" != "404" ];
then
echo "Diretorio encontrado =>  $dir [$resposta]"
fi
done
echo
echo "########### Arquivos Encontrados #####################"
for arq in $(cat arq.txt)
do
for ext in $(cat ext.txt)
do
arquivo=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$arq""$ext")
#echo "$1"/"$arq$ext = $arquivo"
if [ "$arquivo" != "404" ];
then
echo "Arquivo encontrado => $1/$arq$ext [$arquivo]"
fi
done
done
