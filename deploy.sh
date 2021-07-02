docker build -f Dockerfile -t kittyfarm/amm  ./
docker tag kittyfarm/amm reg.excodus.com/kittyfarm/amm
docker push reg.excodus.com/kittyfarm/amm