#!/bin/bash

# Nome do arquivo que deseja excluir
FILE_NAME="lib\stores\shopping_cart.store.g.dart"

# Caminho completo para o arquivo lcov.info
LCOV_FILE="coverage/lcov.info"

# Verifica se o arquivo lcov.info existe
if [ -f "$LCOV_FILE" ]; then
    # Remove a linha que contém o arquivo que deseja excluir do lcov.info
    sed -i "/SF:${FILE_NAME}/d" "$LCOV_FILE"
else
    echo "Arquivo $LCOV_FILE não encontrado."
    exit 1
fi