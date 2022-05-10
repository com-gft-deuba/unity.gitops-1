kubectl port-forward -n istio-system service/kiali 20001:20001 > /dev/null 2>&1 &

http://localhost:20001/kiali/console/graph/namespaces/?traffic=grpc%2CgrpcRequest%2Chttp%2ChttpRequest%2Ctcp%2CtcpSent&graphType=versionedApp&namespaces=com-gft-deuba-unity-gitops-1&duration=60&refresh=10000&animation=true&idleEdges=true&idleNodes=true&layout=dagre
