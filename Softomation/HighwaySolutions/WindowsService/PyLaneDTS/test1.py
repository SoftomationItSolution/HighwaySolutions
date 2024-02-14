def matrix_to_list(matrix):
    result_list = []
    rows = len(matrix)
    cols = len(matrix[0])

    for col in range(cols):
        col_values = [matrix[row][col] for row in range(rows)]

        # Extend the result list with chunks of 8 values
        result_list.extend(col_values)

        # If the length of the list is a multiple of 8, start a new chunk
        if len(result_list) % 8 == 0:
            # Process the chunk (you can perform additional operations here if needed)
            print(f"Chunk: {result_list[-8:]}")

    return result_list

# Example usage with a 4x4 matrix
example_matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
]

result_list = matrix_to_list(example_matrix)
print("Final Result List:", result_list)
