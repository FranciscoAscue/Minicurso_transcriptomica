sudo apt-get install libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client

Despues de isntalar algunas dependencias de jupyter, debes abrir R, procura que sean con permisos SUDO, una vez ahi debes correr los siguientes comandos, va ha tomar tiempo ejecutarlos

install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')

IRkernel::installspec()

IRkernel::installspec(user = FALSE)
