#!/bin/bash
for dir in $(cat $2)
        do
                for  arq in $(cat $3)
                do
                        for ext in $(cat ext.txt)
                        do
                                resp=$(curl -H "User-Agent: Amaraltool" -s -o /dev/null -w "%{http_code}" "$1"/"$dir"/"$arq""$ext")
                                 echo "$1"/"$dir"/"$arq$ext = $resp"
                                if [ "$resp" != "404" ] && [ "$resp" != "403" ];
                                then
                                        echo "Arquivo encontrado => $1/$dir/$arq$ext [$resp]"
                                 fi
                        done
                done
        done

