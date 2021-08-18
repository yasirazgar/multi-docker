docker build -t yasir6403/multi-client:latest -f ./client/Dockerfiler:$SHA ./client
docker build -t yasir6403/multi-server:latest -f ./server/Dockerfiler:$SHA ./server
docker build -t yasir6403/multi-worker:latest -f ./worker/Dockerfiler:$SHA ./worker
docker push yasir6403/multi-client:latest
docker push yasir6403/multi-server:latest
docker push yasir6403/multi-worker:latest
docker push yasir6403/multi-client:latest:$SHA
docker push yasir6403/multi-server:latest:$SHA
docker push yasir6403/multi-worker:latest:$SHA
kubctl apply -f k8s
kubectl set image deployments/server-deployment server=yasir6403/multi-server:$SHAR
kubectl set image deployments/client-deployment client=yasir6403/multi-client:$SHAR
kubectl set image deployments/worker-deployment worker=yasir6403/multi-worker:$SHAR