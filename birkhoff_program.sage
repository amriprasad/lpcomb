def birkhoff_mat(n):
    A = Matrix(QQ,2*n,n^2)
    for i in range(n):
        for j in range(n):
            A[i,i*n+j]=1
            A[n+i,j*n+i]=1
    return A
