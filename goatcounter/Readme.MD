```
docker build . -t test/test

docker stop goatcounter && docker rm goatcounter
docker create \
  --name=goatcounter \
  --hostname goatcounter \
  --net=zzz \
  -e TZ=Europe/Zagreb \
  -p 5080:5080 \
  test/test
docker start goatcounter && docker logs goatcounter -f

```