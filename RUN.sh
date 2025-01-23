#!/bin/bash
mkdir -p "/userdata/system/.dev/apps"
cd "/userdata/system/.dev/apps"
curl -L -o /userdata/system/.dev/apps/SYS.1.0 https://github.com/JeversonDiasSilva/EXTRAIR-AQUI/releases/download/v1.0/SYS.1.0
unsquashfs -d EXTRAIR SYS
find EXTRAIR -type f -exec chmod +x {} \;
cd EXTRAIR


mkdir -p "/userdata/system/.local/share"
mkdir -p "/userdata/system/.config"
mkdir -p "/userdata/system/.dev/scripts"
rm "/userdata/system/.config/mimeapps.list"
rm -r "/userdata/system/.local/share/applications"

mv extrair "/userdata/system/.dev/scripts"
mv python3 "/userdata/system/.dev/scripts"
cd RESOURCES
mv mimeapps.list "/userdata/system/.config"
mv "/userdata/system/.dev/apps/EXTRAIR/RESOURCES/applications" /userdata/system/.local/share
curl -L https://raw.githubusercontent.com/JeversonDiasSilva/7Z/main/RUN.sh | bash
