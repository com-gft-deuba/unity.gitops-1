cat kubernetes-token.txt

kubectl proxy --port 8001

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
