#Inicializa ambiente progress
. dlc

#Lista de AppServers
listaAppServer="app1 app2 app3"

arquivoLog=/opt/suporte/scripts/scom/monitorias/verificaAppServerTempo.log
pastaProtrace=/opt/suporte/scripts/scom/monitorias/

tempoErroSegundos=600

mes=$(date  | awk '{print $2}')
dia=$(date  | awk '{print $3}')
horaAtual=$( date )
segundoAtual=$(date -d "$horaAtual" '+%s')
mesDia=$(echo "$mes" "$dia")

if [ -f $arquivoLog ];
        then
                rm $arquivoLog
fi


for APP in $listaAppServer
do
        consulta=$(asbman -name $APP -query | grep -e "LOCKED" -e "RUNNING" | grep "$comparar")

        while read -r linha; do

                horaAgente=$(echo "$linha" | awk '{print $12 "-" $11  "-" $13 " " $14}')
                horaAgente=$(echo "$horaAgente" | sed 's/,//g')
                segundoAgente=$(date -d "$horaAgente" '+%s')
                agente=$(echo "$linha" | awk '{print $1}')
                diferenca=$(echo "$segundoAtual-$segundoAgente" | bc )

#diferenca em segundos
                if [ "$diferenca" -gt "$tempoErroSegundos" ] && [ "$consulta" != "" ] ; then

                        if [ ! -d $pastaProtrace$APP ]; then
                                mkdir $pastaProtrace$APP
                        fi

#                       proGetStack $agente
                        sleep 3
#remove zeros do lado esquedo, pois o arquivo do trace é gerado sem eles
#                       agente=$(echo $agente | sed 's/^0*//')
                        log=$(asbman -name $APP -agentdetail $agente)
                        logSCOM=$(echo "$log" | grep "\-\->")

#                       programa=$(cat /opt/suporte/logs/$APP/temp/protrace.$agente | grep "\-\->")
#                       mv /opt/suporte/logs/$APP/temp/protrace.$agente $pastaProtrace$APP"/"
                        echo "$log" >  $pastaProtrace$APP"/trace."$agente

                        echo O AppServer $agente do serviço $APP "está executando a mais de $diferenca segundo(s) - Programa $logSCOM" >> $arquivoLog

                fi

        done <<< "$consulta"

done
