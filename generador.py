import numpy as np 
def randomgraph(N, seed): 
    np.random.seed(seed)
    adj = np.zeros((N,N), int)
    for i in range(4*N): 
        n1 = np.random.randint(0, N)
        n2 = np.random.randint(0, N)
        while n1 == n2: 
            n2 = np.random.randint(0, N)
        adj[n1,n2]=1
        adj[n2,n1]=1
    
    print("int: N =", N, ";")
    print("array[1..N,1..N] of 0..1: adyacncia = [|", end='' )
    for i in range(N): 
        for j in range(N-1): 
            print(str(adj[i,j])+",", end='')
        print(str(adj[i,N-1])+"/", end='')
    print("];")
    print("")

n = input("Nº de nodos")
s = input("Semilla")
randomgraph(n, s)