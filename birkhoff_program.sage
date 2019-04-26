def transportation_mat(n):
    A = Matrix(QQ,2*n,n^2)
    for i in range(n):
        for j in range(n):
            A[i,i*n+j]=1
            A[n+i,j*n+i]=1
    return A

def symmetric_transportation_mat(n):
    A = Matrix(QQ,n+n*(n-1)/2,n^2)
    for i in range(n):
        for j in range(n):
            A[i,i*n+j]=1
    L = [(i,j) for i in range(n) for j in range(n)]
    M = [s for s in L if s[0]>s[1]]
    for k, s in enumerate(M):
        A[n+k,L.index((s[0],s[1]))]=1
        A[n+k,L.index((s[1],s[0]))]=-1
    return A

def birkhoff_program(n):
    P = MixedIntegerLinearProgram()
    x = P.new_variable(nonnegative=True)
    for i in range(n):
        P.add_constraint(sum([x[i,j] for j in range(n)])==1)
        P.add_constraint(sum([x[j,i] for j in range(n)])==1)
    return P
