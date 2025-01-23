#!/bin/bash
# Curitiba 23 de Janeiro de 2025
# Editor Jeverson Dias da Silva
# @JCGAMESCLASSICOS
# Criar diretórios necessários
mkdir -p "/userdata/system/.dev/apps"
mkdir -p "/userdata/system/.local/share"
mkdir -p "/userdata/system/.config"
mkdir -p "/userdata/system/.dev/scripts"

# Entrar no diretório de aplicativos
cd "/userdata/system/.dev/apps" || { echo "Erro: falha ao acessar o diretório '/userdata/system/.dev/apps'"; exit 1; }

# Baixar o arquivo SYS.1.1
echo "Baixando o arquivo SYS.1.1..."
curl -L -o SYS.1.1 https://github.com/JeversonDiasSilva/EXTRAIR-AQUI/releases/download/v1.0/SYS.1.1 || { echo "Erro: falha ao baixar o arquivo SYS.1.1"; exit 1; }

# Extrair o conteúdo do arquivo usando unsquashfs
echo "Extraindo o arquivo SYS.1.1..."
unsquashfs -d EXTRAIR SYS.1.1 || { echo "Erro: falha ao extrair o arquivo SYS.1.1"; exit 1; }

# Garantir que os arquivos extraídos tenham permissão de execução
echo "Aplicando permissões de execução aos arquivos extraídos..."
find EXTRAIR -type f -exec chmod +x {} \; || { echo "Erro: falha ao aplicar permissões de execução"; exit 1; }

# Entrar no diretório EXTRAIR
cd EXTRAIR || { echo "Erro: falha ao acessar o diretório EXTRAIR"; exit 1; }

# Remover arquivos antigos
echo "Removendo arquivos antigos (se existirem)..."
rm -f "/userdata/system/.config/mimeapps.list"
rm -rf "/userdata/system/.local/share/applications"

# Mover arquivos e diretórios necessários para os locais corretos
echo "Movendo arquivos e diretórios..."
mv extrair "/userdata/system/.dev/scripts" || { echo "Erro: falha ao mover o arquivo 'extrair'"; exit 1; }
mv python3 "/userdata/system/.dev/scripts" || { echo "Erro: falha ao mover o arquivo 'python3'"; exit 1; }

# Mover o arquivo mimeapps.list para a pasta de configuração
echo "Movendo o mimeapps.list..."
mv RESOURCES/mimeapps.list "/userdata/system/.config" || { echo "Erro: falha ao mover o mimeapps.list"; exit 1; }

# Mover o diretório applications para o diretório correto
echo "Movendo o diretório applications..."
mv "/userdata/system/.dev/apps/EXTRAIR/RESOURCES/applications" /userdata/system/.local/share || { echo "Erro: falha ao mover o diretório applications"; exit 1; }

# Baixar e executar o script RUN.sh
echo "Baixando e executando o script RUN.sh..."
curl -L https://raw.githubusercontent.com/JeversonDiasSilva/7Z/main/RUN.sh | bash || { echo "Erro: falha ao executar o script RUN.sh"; exit 1; }

echo "Script executado com sucesso!"
