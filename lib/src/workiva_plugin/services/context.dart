//abstract class AbstractContext {
//  ContextNode get root;
//
//  ContextNode findNode(String identifier);
//
//  void addNode(String identifier, String parentIdentifier);
//}

class ContextTree {
  final ContextNode root;

  ContextTree() : this.root = new ContextNode(null, ContextConstants.root);

  /// Searches the [ContextTree] for a Node with the given identifier. Returns
  /// the appropriate [ContextNode] if found, otherwise <null>.
  ContextNode findNode(String identifier) {
    return _findNode(identifier, root);
  }

  /// Constructs a context tree from the given templates.
  ContextTree.fromList(List<ContextTemplate> templates)
      : this.root = new ContextNode(null, ContextConstants.root) {
    for (final template in templates) {
      getOrAddNode(template.identifier, template.parentIdentifier);
    }
  }

  /// Adds a node with [identifier], if it doesn't already
  /// exist in the tree. If it does, this is a no-op
  ContextNode getOrAddNode(String identifier, String parentIdentifier) {
    // check if the node already exists, no-op if so
    var node = _findNode(identifier, root);
    if (node != null) {
      return node;
    }

    final parent = _findNode(parentIdentifier, root);
    if (parent == null) {
      print('Error! no parent found for $identifier');
    }

    node = new ContextNode(parent, identifier);
    parent.children.add(node);
    return node;
  }

  void printTree() {
    void _printTree(ContextNode node) {
      // currently we assume that each node has a unique identifier. todo: handle embedded use case
      for (final child in node.children) {
        _printTree(child);
      }
      print(node.identifier);
    }

    _printTree(root);
  }

  ContextNode _findNode(String identifier, ContextNode node) {
    // currently we assume that each node has a unique identifier. todo: handle embedded use case
    if (node.identifier == identifier) {
      return node;
    } else if (node.children.isEmpty) {
      return null;
    } else {
      for (final child in node.children) {
        final _node = _findNode(identifier, child);
        if (_node != null) {
          return _node;
        }
      }
    }
  }
}

class ContextTemplate {
  final String identifier;
  final String parentIdentifier;

  ContextTemplate(this.identifier, this.parentIdentifier);
}

class ContextNode {
  final ContextNode parent;
  final List<ContextNode> children;
  final String identifier;

  ContextNode(this.parent, this.identifier, {children})
      : this.children = children ?? <ContextNode>[];
}

class ContextConstants {
  static const String root = 'appRoot';
  static const String comments = 'comments';
  static const String document = 'document';
}