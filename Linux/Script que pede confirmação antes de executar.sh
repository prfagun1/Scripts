executa(){
        ls
}
clear

echo "Voce tem certeza? (S/N)"
read resposta
        case $resposta in
                S) executa
esac
echo "Saindo..."