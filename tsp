#tsp
from itertools import permutations

def travelling_salesman():
    n = int(input("Enter number of cities: "))
    print("Enter distance matrix row-wise:")
    
    graph = []
    for i in range(n):
        row = list(map(int, input().split()))
        graph.append(row)

    start = 0
    cities = list(range(n))
    cities.remove(start)

    min_cost = float('inf')
    best_path = []

    # Generate all permutations of remaining cities
    for perm in permutations(cities):
        current_cost = 0
        current_path = [start] + list(perm) + [start]

        # Calculate cost of the path
        for i in range(len(current_path) - 1):
            current_cost += graph[current_path[i]][current_path[i + 1]]

        # Update minimum
        if current_cost < min_cost:
            min_cost = current_cost
            best_path = current_path

    print("\nOptimal Route:", " -> ".join(map(str, best_path)))
    print("Minimum Travel Cost:", min_cost)

# Run the program
travelling_salesman()
