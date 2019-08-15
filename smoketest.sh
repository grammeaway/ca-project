docker container stop $(docker ps -a -q)
docker container prune -f
docker pull grameaway/codechan:latest
docker container run -d -p 5000:5000 --rm --name codechan grameaway/codechan

curl -sL -w "%{http_code}" -I "localhost:5000" -o /dev/null > response.txt
if grep -q 200 "response.txt"; then
    exit 0
fi
exit N
