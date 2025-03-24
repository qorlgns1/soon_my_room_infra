#!/bin/bash

# 개발 환경 배포 스크립트
echo "Deploying development environment..."

# 개발 브랜치 체크아웃
cd ../services/frontend/client && git checkout develop && cd ../../../scripts
cd ../services/backend/client-api && git checkout main && cd ../../../scripts

# 도커 컨테이너 빌드 및 실행
cd ..
docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build

echo "Development environment deployed successfully!"