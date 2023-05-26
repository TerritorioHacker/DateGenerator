#!/bin/bash

# Creación de diccionarios de fechas de 8 dígitos en formato dd/mm/yyyy --> ddmmyyyy

# SINTAXIS: ./dateGenerator.sh AñoInicial AñoFinal
# Ejemplo:  ./dateGenerator.sh 1995 2005


# Colores
verde="\e[0;32m\033[1m"
finColor="\033[0m\e[0m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"

# Variables de Tiempo
# Años
yearI=$1
yearF=$2

# Meses
monthI=1
monthF=12

# Días
dayI=1
dayF=31

function ctrl_c(){
    echo -e "\n\n [!] Saliendo... \n"
    exit 1
}

# Ctrl_c
trap ctrl_c SIGINT
echo -e "\n${verde}[+] Creando biblioteca de fechas: ${azul}ddmmyyyy${finColor}${verde}"
echo -e "\n${verde}[+] Generando biblioteca de<sde ${azul}01/01/$yearI${verde} hasta ${azul}01/01/$yearF ${finColor}${verde}"


# En caso de existir el arhcivo datelist lo eliminamos para volver a crearlo.
if [ -f "datelist.txt" ]; then
    rm ./datelist.txt
fi

if [[ $yearI =~ ^[1-9][0-9]{3}$ ]] && [[ $yearF =~ ^[1-9][0-9]{3}$ ]]; then
#if [ -n "$yearI" ] && [ -n "$yearF" ]; then
    for (( year=$yearI; year<=$yearF; year++ )); do
        for (( month=$monthI; month<=$monthF; month++ )); do
            for (( day=$dayI; day<=$dayF; day++ )); do
            # Formatear los valores de día, mes y año con ceros a la izquierda si es necesario
            formatted_day=$(printf "%02d" $day)
            formatted_month=$(printf "%02d" $month)
            formatted_year=$(printf "%04d" $year)
            echo "$formatted_day$formatted_month$formatted_year" >> datelist.txt
            done
        done
    done
    wordcount=$(wc -l datelist.txt | awk '{print $1}')
    echo -e "\n${verde}[+] Creado diccionario ${azul}datelist.txt${verde} con ${azul}$wordcount${verde} líneas. \n"
else
    echo -e "\n${rojo}[!] Error...${finColor}\n"
    echo -e "\n${verde}[!] Se requieren los valores:${azul} $0 [StartYear] [FinalYear]${finColor}"
    echo -e "\n${verde}   [-] Ejemplo:${azul} $0 1995 2005 ${finColor}\n"
fi
