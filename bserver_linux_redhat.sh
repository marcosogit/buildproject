#!/bin/bash

##################################################
#                                                #
# Script Build Server - Coleta de dados          #
# Autor: Marcos Fábio Mesquita de Oliveira       #
# Data: 27/12/2022                               #
# Execução: bserver_linux.sh                     #
# Objetivo: Coletar dados de novos servidores    #
#						 #
#                                                #
##################################################


# Variáveis de Ambiente

REPORT=/tmp/bserver_linux_.$(hostname).log


# 1.0 - Hostname do servidor


printf "%sVerificando o hostname do servidor !!!\n"

echo "hostname:" > $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n"

        hostname -A >> $REPORT

    printf "\n" >> $REPORT

# 1.1 - Verificando se o servidor é Físico ou Virtual

printf "%sVerificando se o servidor é físico ou virtual !!!\n"

echo "Virtual / Físico:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        dmidecode -s system-manufacturer >> $REPORT

    printf "\n" >> $REPORT

# 1.2 - Verificando Systema Operacional Instalado

printf "%sVerificando o sistema operacional instalado !!!\n"

echo "Versão do Sistema Operacional:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        cat /etc/*release >> $REPORT

    printf "\n" >> $REPORT


# 1.3 - Verificando subscriptions ativas

printf "%sVerificando subscriptions ativas (RedHat) !!!\n"

echo "Nome das Subscriptions:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        subscription-manager list --available --all |grep -i "Subscription Name" >> $REPORT

    printf "\n" >> $REPORT

# 1.4 - Verificando se o cockpit está ativo



printf "%sVerificando se o cockpit insights está ativo (RedHat) !!!\n"

echo "Verificando status do Cockpit:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        rhc status  |grep daemon >> $REPORT

    printf "\n" >> $REPORT

# 1.5 - Verificando se o update foi aplicado



printf "%sVerificando data do último update (RedHat) !!!\n"

echo "Verificando data do último update:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        cat /var/log/yum.log |tail -n 10 >> $REPORT 2>&1

    printf "\n" >> $REPORT


# 1.6 - Determinando versão do Vmtools



printf "%sVerificando versão do vmtools !!!\n"

echo "Verificando versão do vmtools :" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        vmware-toolbox-cmd -v >> $REPORT

    printf "\n" >> $REPORT


# 1.7 - Determinando versão do Python3



printf "%sVerificando versões do Python3 Instaladas !!!\n"

echo "Verificando versões do Python3 Instaladas:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        python3 --version >> $REPORT

    printf "\n" >> $REPORT


# 1.8 - Determinando versão do Python2



printf "%sVerificando versões do Python2 Instaladas !!!\n"

echo "Verificando versões do Python2 Instaladas:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        python2 --version >> $REPORT

    printf "\n" >> $REPORT



# 1.9 - Verificando status do SELINUX



printf "%sVerificando status do SELINUX (RedHat) !!!\n"

echo "Verificando status do SELINUX:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        getenforce >> $REPORT

    printf "\n" >> $REPORT



# 1.10 - Verificando quantidade de CPUs



printf "%sVerificando quantidade de CPUs !!!\n"

echo "Verificando quantidade de CPUs:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        cat /proc/cpuinfo |grep processor |wc -l >> $REPORT

    printf "\n" >> $REPORT


# 1.11 - Verificando quantidade de Memória



printf "%sVerificando quantidade de Memória !!!\n"

echo "Verificando quantidade de Memória:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        free -g >> $REPORT

    printf "\n" >> $REPORT




# 1.12 - Verificando se está implementado com LVM



printf "%sVerificando se está implementado com LVM !!!\n"

echo "Verificando se está implementado com LVM:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        vgs >> $REPORT

    printf "\n" >> $REPORT



# 1.13 - Verificando se possui multipath



printf "%sVerificando se possui multipath !!!\n"

echo "Verificando se possui multipath:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        multipath -ll |wc -l >> $REPORT 2>&1

    printf "\n" >> $REPORT



# 1.14 - Verificando o timezone configurado



printf "%sVerificando o timezone configurado !!!\n"

echo "Verificando o timezone configurado:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        timedatectl >> $REPORT

    printf "\n" >> $REPORT



# 1.15 - Verificando o chrony configurado



printf "%sVerificando o chrony configurado !!!\n"

echo "Verificando o chrony configurado:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        cat /etc/chrony.conf |grep -i server >> $REPORT

    printf "\n" >> $REPORT



# 1.16 - Verificando o ntp configurado



printf "%sVerificando o ntp configurado !!!\n"

echo "Verificando o ntp configurado:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        cat /etc/ntp.conf |grep -i server >> $REPORT

    printf "\n" >> $REPORT



# 1.17 - Verificando o DNS configurado



printf "%sVerificando o DNS configurado !!!\n"

echo "Verificando o DNS configurado:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        cat /etc/resolv.conf >> $REPORT

    printf "\n" >> $REPORT



# 1.18 - Verificando se existe NFS montado



printf "%sVerificando se existe NFS montado !!!\n"

echo "Verificando se existe NFS montado:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

        mount |grep -i nfs >> $REPORT

    printf "\n" >> $REPORT



# 1.19 - Verificando se existe NFS configurado no fstab



printf "%sVerificando se existe NFS configurado no fstab !!!\n"

echo "Verificando se existe NFS configurado no fstab:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

       cat /etc/fstab |grep -i nfs >> $REPORT

    printf "\n" >> $REPORT



# 1.20 - Verificando se os templates sudo foram implementados



printf "%sVerificando se os templates sudo foram implementados !!!\n"

echo "Verificando se os templates sudo foram implementados:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

       ls -lt /etc/sudoers.d >> $REPORT

    printf "\n" >> $REPORT



# 1.21 - Verificando se existe erros na configuração do sudoers



printf "%sVerificando se existe erros na configuração do sudoers !!!\n"

echo "Verificando se existe erros na configuração do sudoers:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

       visudo -c -f /etc/sudoers >> $REPORT

    printf "\n" >> $REPORT



# 1.24 - Verificando se o motd está configurado no padrão



printf "%sVerificando se o motd está configurado no padrão !!!\n"

echo "Verificando se o motd está configurado no padrão:" >> $REPORT
echo "____________________________________________________" >> $REPORT
    printf "\n" >> $REPORT

       cat /etc/motd >> $REPORT

    printf "\n" >> $REPORT
