docker build -t vundb/multi-docker-client:latest -t vundb/multi-docker-client:$SHA -f ./client/Dockerfile ./client
docker build -t vundb/multi-docker-server:latest -t vundb/multi-docker-server:$SHA -f ./server/Dockerfile ./server
docker build -t vundb/multi-docker-worker:latest -t vundb/multi-docker-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vundb/multi-docker-client:latest
docker push vundb/multi-docker-server:latest
docker push vundb/multi-docker-worker:latest

docker push vundb/multi-docker-client:$SHA
docker push vundb/multi-docker-server:$SHA
docker push vundb/multi-docker-worker:$SHA

kubectl apply -f k8s

kubectl set iamge deployments/client-deployment client=vundb/multi-docker-client:$SHA
kubectl set image deployments/server-deployment server=vundb/multi-docker-server:$SHA
kubectl set image deployments/worker-deployment worker=vundb/multi-docker-worker:$SHA
