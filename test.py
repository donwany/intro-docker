class Node:
    __slots__ = ['val', 'left', 'right']

    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

    def addLeft(self, node):
        self.left = node

    def addRight(self, node):
        self.right = node

def binaryTreePaths(root):
    # List to store all root-to-leaf paths
    paths = []

    def dfs(node, path):
        if not node:
            return
        # Append current node value to path
        if path:
            path += "->" + str(node.val)
        else:
            path = str(node.val)

        # If leaf node, add path to results
        if not node.left and not node.right:
            paths.append(path)
            return

        # Recurse on left and right children
        dfs(node.left, path)
        dfs(node.right, path)

    dfs(root, "")
    return paths




if __name__ == "__main__":
    root = Node(10)
    root.addLeft(Node(2))
    root.addRight(Node(3))
    root.left.addRight(Node(5))
    root.right.addRight(Node(4))

    print(binaryTreePaths(root))  # Output: ["10->2->5", "10->3->4"]


    root = Node(1)

    root.addLeft(Node(2))
    root.addRight(Node(3))

    root.left.addLeft(Node(4))
    root.left.addRight(Node(5))

    root.right.addLeft(Node(6))
    root.right.addRight(Node(7))

    print(binaryTreePaths(root)) # Output: ["1->2->4", "1->2->5", "1->3->6", "1->3->7"]

    print(binaryTreePaths(None)) # Output: []