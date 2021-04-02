#gnome padrao
yum groupinstall "X Window System" Desktop

#kde
yum groupremove "Kde Desktop"
yum groupremove "X Window System"
	
startx para iniciar interface grafica