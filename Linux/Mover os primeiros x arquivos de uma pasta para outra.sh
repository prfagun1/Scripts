find . -type f -print | head -10000 | cut -d'/' -f2 | xargs -I{} mv {} /opt/integracoes/