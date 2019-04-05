def transportation_net(r,s):
    G = DiGraph()
    G.add_vertices(['u','v'])
    G.add_vertices([(0,i) for i in range(r)])
    G.add_vertices([(1,j) for j in range(s)])
    G.add_edges([('u',(0,i)) for i in range(r)])
    G.add_edges([((1,j),'v') for j in range(s)])
    G.add_edges([((0,i),(1,j)) for i in range(r) for j in range(s)])
    d = dict()
    d['u'] = (0,0)
    for i in range(r):
        d[(0,i)] = (i,-1)
    for j in range(s):
        d[(1,j)] = (j,-2)
    d['v'] = (s-1,-3)
    return G, d

def draw_transporation_net(r,s):
    G, d = transportation_net(r,s)
    def lab_fn(inp):
        if inp == 'u' or inp == 'v':
            return inp
        elif inp[0] == 0:
            return str(inp[1]+1)
        else:
            return str(inp[1]+1)+"\'"
    H = G.relabel(lab_fn, inplace=False)
    print H.vertices()
    e = dict()
    for n in G.vertices():
        e[lab_fn(n)] = d[n]
    return H.plot(pos=e, vertex_size=400)
        
