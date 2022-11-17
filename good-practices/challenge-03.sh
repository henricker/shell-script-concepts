#!/usr/bin/env bash
#
# challenge.sh - Print a tree with '*' character
#
# Site:       https://4fasters.com.br
# Author:      Henrique Vieira
# Maintenance: Henrique Vieira - henricker@email.com
#
# ------------------------------------------------------------------------ #
#  This program will print a tree with '*' character.
#
#  Exemplos:
#      $ ./challenge.sh
#      In this example, the script will print a tree with '*' character.
#       **********
#       *********
#       ********
#       *******
#       ******
#       *****
#       ****
#       ***
#       **
#       *
# ------------------------------------------------------------------------ #
# History:
#
#   v1.0 03/10/2018, Mateus:
#       - Início do programa
#       - Conta com a funcionalidade X
#   v1.1 10/10/2022, Henricker:
#       - Improve code and add header on project
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
# Agradecimentos:
#
# 	Joãozinho - Encontrou um bug na parte de login.
#	 Mariazinha - Enviou uma sugestão de adicionar o -h.
# ------------------------------------------------------------------------ #

# GLOBAL VARIABLES
START=0 END=100

# TESTS
[ $START -ge $END ] && exit 1

# EXECUTION
for i in $(seq $START $END); do
    for j in $(seq $i $END); do printf "*"; done
    printf "\n"
done
