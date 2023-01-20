# Algoritmos
Algoritmos más usados en las pruebas técnicas

https://www.geeksforgeeks.org/top-10-algorithms-in-interview-questions/

## Índice
1. [Graph](#graph)
	1.	[BFS](#bfs) - *Breadth First Search*
	2.	[DFS](#dfs) - *Depth First Search*
	3.	[Dijkstra](#dijkstra) - Shortest Path
	4.	[Floyd Warshall](#floyd-warshall)
	5.	[Union-Find](#union-find)
	6.	[Prim](#prim)
	7.	[Kruskal](#kruskal)
	8.	[Topological Sorting](#topological-sorting)
	9. [Boggle](#boggle)
	10. 

[Prim vs Kruskal](https://www.geeksforgeeks.org/difference-between-prims-and-kruskals-algorithm-for-mst/)

## Graph
### BFS

[Explanation](https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/)

[Playground](Algoritmos/Playgrounds/BFS.playground/Contents.swift)

- Encontrar el camino más corto entre 2 nodos, medido por el número de nodos conectados
- Probar si un grafo de nodos es bipartito (si se puede dividir en 2 conjuntos)
- Encontrar el árbol de expansión mínima en un grafo no ponderado
- Hacer un Web Crawler
- Sistemas de navegación GPS, para encontrar localizaciones vecinas
- En grafos no ponderados (los nodos no tienen una medida o peso), mediante el algoritmo BFS es posible encontrar el camino más corto. Por ejemplo, si tenemos un conjunto de actividades representadas por nodos y deseamos llegar a una actividad específica realizando la menor cantidad de actividades posibles, podemos usar este algoritmo; en el caso que tengamos un grafo ponderado para el ejemplo anterior donde las actividades tengan un tiempo estimado, podemos modificar el algoritmo BFS, llegando a obtener el  algoritmo Dijkstra.  

- En teoría de códigos, para decodificar palabras-código, es posible usar BFS para probar si el grafo de nodos es bipartito con el objetivo de verificar que la información no esté corrompida. Por ejemplo, en el grafo de Tanner, en donde los nodos de un lado de la bipartición se representan por dígitos de una palabra-código y los nodos del otro lado representan las combinaciones de los dígitos que se espera que sumen cero en una palabra-código sin errores.

- Encontrar el árbol de expansión mínima en un grafo no ponderado es otra aplicación del algoritmo BFS. Por ejemplo si se desea recorrer un conjunto de lugares sin pasar dos veces por el mismo lugar, se puede usar este algoritmo.

- Si queremos realizar un buscador de sitios web como Google, podemos acceder al DOM (Document Object Model) mediante un Web Crawler, un algoritmo que suele usar búsquedas en anchura para recorrer las etiquetas HTML, de modo que podemos limitar los niveles de búsquedas en el DOM.

- En sistemas de Navegación GPS, podemos usar BFS para encontrar lugares cercanos de interés. Por ejemplo, si tenemos un conjunto de lugares turísticos y servicios representados por nodos conectados entre sí en base a su proximidad geográfica, entonces podemos obtener un listado de lugares turísticos cercanos, lo cual puede ser utilizado para planear un viaje o una excursión.

### DFS

[Explanation](https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/)

[Playground](Algoritmos/Playgrounds/DFS.playground/Contents.swift)

- Encontrar nodos conectados en un grafo
- Ordenamiento topológico en un grafo acíclico dirigido
- Encontrar puentes en un grafo de nodos
- Resolver puzzles con una sola solución, como los laberintos
- Encontrar nodos fuertemente conectados
- En un grafo acíclico dirigido, es decir un conjunto de nodos donde cada nodo tiene una sola dirección que no es consigo mismo, se puede realizar un ordenamiento topológico mediante el algoritmo DFS. Por ejemplo, se puede aplicar para organizar actividades que tienen por lo menos alguna dependencia entre sí, a fin de organizar eficientemente la ejecución de una lista de actividades.

- Los puentes en grafos son 2 nodos conectados de tal manera que para llegar a cada uno de sus extremos solo se puede a través de uno de esos nodos. Es decir, si removemos uno de los nodos ya no podremos acceder al otro nodo porque se han desconectado completamente. Esto se puede usar en la priorización de actividades que son representadas por nodos.

- Si se quiere resolver un ‘puzzle’ o un laberinto, se puede resolver a través de DFS; los pasos de la solución pueden ser representados por nodos, donde cada nodo es dependiente del nodo predecesor. Es decir, cada paso de la solución del puzzle depende del anterior paso.

- A veces será importante conocer qué tan conectados están ciertas actividades o componentes a fin de disminuir la dependencia de actividades o acoplamiento de componentes. Ésto con el objetivo de organizar en una mejor forma las actividades o agrupar de mejor modo los componentes porque así será más entendible el sistema; ésto también se puede resolver a través del algoritmo DFS.

### Dijkstra

[Explanation](https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/)

[Playground](Algoritmos/Playgrounds/Dijkstra.playground/Contents.swift)

- Con el algoritmo de Dijkstra, puedes encontrar la ruta más corta o el camino más corto entre los nodos de un grafo. Específicamente, puedes encontrar el camino más corto desde un nodo (llamado el nodo de origen) a todos los otros nodos del grafo, generando un árbol del camino más corto.

- Este algoritmo es usado por los dispositivos GPS para encontrar el camino más corto entre la ubicación actual y el destino del usuario. Tiene amplias aplicaciones en la industria, especialmente en aquellas áreas que requieren modelar redes.

### Floyd Warshall

[Explanation](https://www.geeksforgeeks.org/floyd-warshall-algorithm-dp-16/)

[Playground](Algoritmos/Playgrounds/FloydWarshall.playground/Contents.swift)

- Camino mínimo en grafos dirigidos (algoritmo de Floyd).
- Cierre transitivo en grafos dirigidos (algoritmo de Warshall). Es la formulación original del algoritmo de Warshall. El grafo es un grafo no ponderado y representado por una matriz booleana de adyacencia. Entonces la operación de adición es reemplazada por la conjunción lógica(AND) y la operación menor por la disyunción lógica (OR).
- Encontrar una expresión regular dada por un lenguaje regular aceptado por un autómata finito (algoritmo de Kleene).
- Inversión de matrices de números reales (algoritmo de Gauss-Jordan).
- Ruta óptima. En esta aplicación es interesante encontrar el camino del flujo máximo entre 2 vértices. Esto significa que en lugar de tomar los mínimos con el pseudocodigo anterior, se coge el máximo. Los pesos de las aristas representan las limitaciones del flujo. Los pesos de los caminos representan cuellos de botella; por ello, la operación de adición anterior es reemplazada por la operación mínimo.
- Comprobar si un grafo no dirigido es bipartito.

### Union-Find

[Explanation](https://www.geeksforgeeks.org/introduction-to-disjoint-set-data-structure-or-union-find-algorithm/)

[Playground](Algoritmos/Playgrounds/UnionFind.playground/Contents.swift)

- Implementando Algoritmo de Kruskal para encontrar el árbol de expansión mínimo de un graph.

- Ciclo de detección en un graph no dirigido

### Prim

[Explanation](https://www.geeksforgeeks.org/prims-minimum-spanning-tree-mst-greedy-algo-5/)

[Playground](Algoritmos/Playgrounds/Prim.playground/Contents.swift)

- Ahorrar recursos, su aplicación más común es la implementación de cables de redes, de servidores, de postes de luz entre otros.

- Hallar el «árbol recubridor mínimo», en un grafo conexo no dirigido.

- The standard application is to a problem like phone network design. You have a business with several offices; you want to lease phone lines to connect them up with each other, and the phone company charges different amounts of money to connect different pairs of cities. You want a set of lines that connects all your offices with a minimum total cost. It should be a spanning tree, since if a network isn’t a tree you can always remove some edges and save money. 

- A less obvious application is that the minimum spanning tree can be used to approximately solve the traveling salesman problem. A convenient formal way of defining this problem is to find the shortest path that visits each point at least once. Note that if you have a path visiting all points exactly once, it’s a special kind of tree. For instance in the example above, twelve of sixteen spanning trees are actually paths. If you have a path visiting some vertices more than once, you can always drop some edges to get a tree. So in general the MST weight is less than the TSP weight, because it’s a minimization over a strictly larger set. On the other hand, if you draw a path tracing around the minimum spanning tree, you trace each edge twice and visit all points, so the TSP weight is less than twice the MST weight. Therefore this tour is within a factor of two of optimal. 

- Max bottleneck paths 
- LDPC codes for error correction 
- Image registration with Renyi entropy 
- Learning salient features for real-time face verification 
- Reducing data storage in sequencing amino acids in a protein 
- Model locality of particle interactions in turbulent fluid flows 
- Autoconfig protocol for Ethernet bridging to avoid cycles in a network

### Kruskal

[Explanation](https://www.geeksforgeeks.org/kruskals-minimum-spanning-tree-algorithm-greedy-algo-2/)

[Playground](Algoritmos/Playgrounds/Kruskal.playground/Contents.swift)

- Same as Prim

### Topological Sorting

[Explanation](https://www.geeksforgeeks.org/topological-sorting/)

[Playground](Algoritmos/Playgrounds/TopologicalSorting.playground/Contents.swift)

- Topological Sorting is mainly used for scheduling jobs from the given dependencies among jobs. 
- In computer science, applications of this type arise in:
- Instruction scheduling
- Ordering of formula cell evaluation when recomputing formula values in spreadsheets
- Logic synthesis
- Determining the order of compilation tasks to perform in make files
- Data serialization
- Resolving symbol dependencies in linkers

### Boggle

[Explanation](https://www.geeksforgeeks.org/boggle-find-possible-words-board-characters/)

[Playground](Algoritmos/Playgrounds/Boggle.playground/Contents.swift)

- Find anagrams