# Para este exercício liste todos os grupos do seu Linux com este comando:

#   $ cut -d : -f 1 /etc/group

# Envie a saída do comando acima para o comando grep (use o PIPE "|") e faça as seguintes Expressões Regulares:
# Grupos que começam com a letra "r" no arquivo /etc/group
cut -d : -f 1 /etc/group | grep "^r"
# Grupos que terminem com a letra "t"
cut -d : -f 1 /etc/group | grep "t$"
# Grupos que comecem com a letra "r" e terminem com a letra "t"
cut -d : -f 1 /etc/group | grep "^r.*t$"
# Grupos que terminam com a letra "e" ou "d"
cut -d : -f 1 /etc/group | grep "[ed]$"
# Grupos que não terminam com a letra "e" ou "d"
cut -d : -f 1 /etc/group | grep "[^ed]$"
# Grupos que começam com qualquer dígito e a segunda letra seja um "u" ou "d"
cut -d : -f 1 /etc/group | grep "^.[ud]"
# Grupos que tenha seu nome de 2 a 4 dígitos de tamanho
cut -d : -f 1 /etc/group | egrep "^.{2,4}$"
# Grupos que comecem com "r" ou "s" (use o operador OR)
cut -d : -f 1 /etc/group | egrep "^(r|s)"
