package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Stack;
import java.util.Arrays;
import java.lang.StringBuilder;
import java.util.Collections;

public class InheritanceGraph {

    /* Member variables */
    // Index in the graph list where root node is stored
    private static final int ROOT_CLASS_INDEX = 0;

    // List of nodes in the graph
    private List<Node> graph;
    
    // This map is used to find the index of particular class
    // in graph list
    private Map<String,Integer> classNameToIndexMap;

    /* Constructor */
    public InheritanceGraph() {
        graph = new ArrayList<>();
        classNameToIndexMap = new HashMap<>();
        // addBaseClasses();
    }

    /* Method definitions */

    public Node getRootNode() {
        for(Node node: graph) {
            if(Global.Constants.ROOT_TYPE.equals(node.getAstClass().name)) {
                return node;
            }
        }
        return null;
    }

    public boolean hasClass(String className) {
        return classNameToIndexMap.containsKey(className);
    }

    public List<Node> getNodeList() {
        return graph;
    }

    // * Returns the name of parent class of the given class name
    // * The existance of the passed class name in the graph
    //   has to be checked manually using 'hasClass' before
    //   calling this function
    public String getParentClassName(String className) {
        Node classNode = graph.get(classNameToIndexMap.get(className));
        return classNode.getAstClass().parent;
    }

    // Restricted base classes for redefinition
    private boolean isRestrictedClass(String name) {
        return Global.Constants.IO_TYPE.equals(name) || Global.Constants.INT_TYPE.equals(name) 
        || Global.Constants.STRING_TYPE.equals(name) || Global.Constants.BOOL_TYPE.equals(name);
    }

    // Restricted base classes for inheritance
    private boolean isRestrictedInheritanceClass(String name) {
        return Global.Constants.INT_TYPE.equals(name) || Global.Constants.STRING_TYPE.equals(name) 
        || Global.Constants.BOOL_TYPE.equals(name);
    }

    // Base classes with no methods in it
    public boolean isNoMethodClass(String name) {
        return Global.Constants.INT_TYPE.equals(name) || Global.Constants.BOOL_TYPE.equals(name);
    }

    // Used to add a class to the graph
    public void addClass(AST.class_ astClass) {
        classNameToIndexMap.put(astClass.name, graph.size());
        graph.add(new Node(astClass, graph.size()));
    }

    public void update() {
        updateParents();
    }

    // Updates the links between parents and child
    private void updateParents() {
        for(Node cl: graph) {
            if(cl.getAstClass().parent!=null) {
                // node has a parent
                int parentIndex = classNameToIndexMap.get(cl.getAstClass().parent);
                cl.setParent(graph.get(parentIndex));
                graph.get(parentIndex).addChild(cl);
            }
        }
    }

    // The basic node in the graph
    public static class Node {

        public static final int NO_PARENT = -1;

        private AST.class_ astClass;
        private int index;
        private Node parent;
        private List<Node> children;
        private boolean isInitiated;

        public Node(AST.class_ astClass, int index) {
            this.isInitiated = false;
            init(astClass, index);
        }

        private void init(AST.class_ astClass, int index) {
            if(isInitiated) return;
            this.astClass = astClass;
            this.index = index;
            this.children = new ArrayList<>();
            this.parent = null;
            this.isInitiated = true;
        }

        public void addChild(Node child) {
            children.add(child);
        }

        public AST.class_ getAstClass() {
            return astClass;
        }

        public int getIndex() {
            return index;
        }

        public boolean parentExists() {
            return parent!=null;
        }

        public Node getParent() {
            return parent;
        }

        public void setParent(Node parent) {
            this.parent = parent;
        }

        public List<Node> getChildren() {
            return children;
        }
        
        public boolean equals(Node node) {
            return this.index == node.getIndex();
        }
    }
}
