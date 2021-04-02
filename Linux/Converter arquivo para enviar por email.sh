sed 's/^M/\n/g' email.tmp | iconv -f iso-8859-1 -t UTF-8  | mail -s "oi" email@dominio.com

#Observação: para informar o ^M digitar "Control V e M"