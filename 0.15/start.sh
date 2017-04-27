sudo docker run -d -p 34197:34197/udp -p 27015:27015/tcp \
  -v factorio:/factorio \
  --name factorio \
  --restart=always  \
  factorio
