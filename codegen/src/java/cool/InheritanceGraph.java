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

    private static AST.class_ ROOT_AST_CLASS = new AST.class_(Global.Constants.ROOT_TYPE, null, null, new ArrayList<>(), 0);
    private static Node ROOT_AST_NODE;
    
    // This map is used to find the index of particular class
    // in graph list
    private Map<String,Integer> classNameToIndexMap;

    private Node rootNode;

    /* Constructor */
    public InheritanceGraph() {
        rootNode = null;
        graph = new ArrayList<>();
        classNameToIndexMap = new HashMap<>();
    }


    // Adds the root class Object into the graph
    private void addObject() {
        // methods of Object
        ROOT_AST_NODE = new Node(ROOT_AST_CLASS, graph.size());
        ROOT_AST_CLASS.features = new ArrayList<>();
        ROOT_AST_CLASS.features.add(new AST.method("abort", new ArrayList<>(), Global.Constants.ROOT_TYPE, null, 0));
        ROOT_AST_CLASS.features.add(new AST.method("type_name", new ArrayList<>(), Global.Constants.STRING_TYPE, null, 0));
        ROOT_AST_CLASS.features.add(new AST.method("copy", new ArrayList<>(), Global.Constants.ROOT_TYPE, null, 0));

        classNameToIndexMap.put(Global.Constants.ROOT_TYPE, graph.size());
        graph.add(ROOT_AST_NODE);
    }

    private void addInt() {
        AST.class_ intAstClass = new AST.class_(Global.Constants.INT_TYPE, null, Global.Constants.ROOT_TYPE, new ArrayList<>(), 0);
        Node intNode = new Node(intAstClass, 0);

        classNameToIndexMap.put(Global.Constants.INT_TYPE, graph.size());
        graph.add(intNode);
    }

    private void addBool() {
        AST.class_ boolAstClass = new AST.class_(Global.Constants.BOOL_TYPE, null, Global.Constants.ROOT_TYPE, new ArrayList<>(), 0);
        Node boolNode = new Node(boolAstClass, 0);

        classNameToIndexMap.put(Global.Constants.BOOL_TYPE, graph.size());
        graph.add(boolNode);
    }

    // Adds the base class IO into the graph
    private void addIO() {

        List<AST.formal> stringFormalList = new ArrayList<>(Arrays.asList(new AST.formal("x", Global.Constants.STRING_TYPE, 0)));

        List<AST.feature> ioFeatures = new ArrayList<>();
        List<AST.formal> intFormalList = new ArrayList<>(Arrays.asList(new AST.formal("x", Global.Constants.INT_TYPE, 0)));

        ioFeatures.add(new AST.method("out_string", stringFormalList, Global.Constants.IO_TYPE, null, 0));
        ioFeatures.add(new AST.method("out_int", intFormalList, Global.Constants.IO_TYPE, null, 0));
        ioFeatures.add(new AST.method("in_string", new ArrayList<>(), Global.Constants.STRING_TYPE, null, 0));
        ioFeatures.add(new AST.method("in_int", new ArrayList<>(), Global.Constants.INT_TYPE, null, 0));

        AST.class_ ioAstClass = new AST.class_(Global.Constants.IO_TYPE, null, Global.Constants.ROOT_TYPE, ioFeatures, 0);
        Node ioNode = new Node(ioAstClass, 0);

        classNameToIndexMap.put(Global.Constants.IO_TYPE, graph.size());
        graph.add(ioNode);
    }

    // Adds the base class String into the graph
    private void addString() {
        List<AST.formal> stringFormalList = new ArrayList<>(Arrays.asList(new AST.formal("x", Global.Constants.STRING_TYPE, 0)));

        List<AST.formal> intFormalList = new ArrayList<>(Arrays.asList(new AST.formal("x", Global.Constants.INT_TYPE, 0)
            ,new AST.formal("y", Global.Constants.INT_TYPE, 0)));
        List<AST.feature> stringFeatures = new ArrayList<>();

        stringFeatures.add(new AST.method("length", new ArrayList<>(), Global.Constants.INT_TYPE, null, 0));
        stringFeatures.add(new AST.method("concat", stringFormalList, Global.Constants.STRING_TYPE, null, 0));
        stringFeatures.add(new AST.method("substr", intFormalList, Global.Constants.STRING_TYPE, null, 0));

        AST.class_ stringAstClass = new AST.class_(Global.Constants.STRING_TYPE, null, Global.Constants.ROOT_TYPE, stringFeatures, 0);
        Node stringNode = new Node(stringAstClass, 0);

        classNameToIndexMap.put(Global.Constants.STRING_TYPE, graph.size());
        graph.add(stringNode);
        
    }

    /* Method definitions */

    public Node getRootNode() {
        // if(rootNode==null) {
        //     for(Node node: graph) {
        //         if(Global.Constants.ROOT_TYPE.equals(node.getAstClass().name)) {
        //             rootNode = node;
        //             break;
        //         }
        //     }
        // }
        // return rootNode;
        return ROOT_AST_NODE;
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
    public boolean isRestrictedInheritanceClass(String name) {
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
        addObject();
        addIO();
        addString();
        addInt();
        addBool();
        updateParents();
    }

    // Updates the links between parents and child
    private void updateParents() {
        for(Node cl: graph) {
            if(cl.getAstClass().parent!=null) {
                // node has a parent
                // System.out.println(cl.getAstClass().parent);
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
