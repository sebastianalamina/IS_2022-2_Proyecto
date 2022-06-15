#/bin/bash

git clone https://davidalencia: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@github.com/sebastianalamina/IS_2022-2_Proyecto
cd IS_2022-2_Proyecto
git pull origin feature/docker
git checkout feature/docker
docker compose up -d --build --force-recreate
