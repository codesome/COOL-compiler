package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Stack;
import java.lang.StringBuilder;

public class InheritanceGraph {

	private static final String ROOT_CLASS_NAME = "Object";
	private static final int ROOT_CLASS_INDEX = 0;
	private static AST.class_ ROOT_AST_CLASS = new AST.class_(InheritanceGraph.ROOT_CLASS_NAME, null, null, null, 0);
	private static Node ROOT_AST_NODE = new Node(InheritanceGraph.ROOT_AST_CLASS, InheritanceGraph.ROOT_CLASS_INDEX);

	private Map<String,Integer> classNameToIndexMap;
	private List<Node> graph;
	private boolean hasMain;
	private List<Error> errors;

	// TODO: better way to store file name (only for 'No Main' error)
	private String filename;

	public InheritanceGraph() {
		
		graph = new ArrayList<>();
		graph.add(InheritanceGraph.ROOT_AST_NODE);
		
		classNameToIndexMap = new HashMap<>();
		classNameToIndexMap.put(InheritanceGraph.ROOT_CLASS_NAME, InheritanceGraph.ROOT_CLASS_INDEX);
		
		errors = new ArrayList<>();

		hasMain = false;
	}

	public void addClass(AST.class_ astClass) {
		if(classNameToIndexMap.containsKey(astClass.name)) {
			errors.add(new Error(astClass.filename, astClass.getLineNo(),new StringBuilder().append("class \"")
				.append(astClass.name).append("\" has been redeclared").toString()));
			return;
		}
		classNameToIndexMap.put(astClass.name, graph.size());
		graph.add(new Node(astClass, graph.size()));
		filename = astClass.filename;
		if("Main".equals(astClass.name)) {
			hasMain = true;
		}

	}

	public boolean hasMain() {
		return hasMain;
	}

	public void analyze() {
		parentUpdatePass();

		if(!hasMain()) {
			// TODO: what to do for line number
			errors.add(new Error(filename, 0,"'Main' class is missing."));
		}

		List<Stack<Node>> cycles = hasCyclePass();
		if(!cycles.isEmpty()) {
			for(Stack<Node> cycle: cycles) {
				StringBuilder errorString = new StringBuilder();
				errorString.append("Classes have cyclic dependency: ");
				int size = cycle.size();
				StringBuilder cyclePath = new StringBuilder();
				for(int i=0; i<size-1; i++) {
					cyclePath.append(cycle.pop().getAstClass().name).append(" -> ");
				}
				AST.class_ lastClass = cycle.pop().getAstClass();
				String lastClassName = lastClass.name;
				errorString.append(lastClassName).append(" -> ");
				errorString.append(cyclePath).append(lastClassName);
				errors.add(new Error(lastClass.filename, lastClass.getLineNo(), errorString.toString()));
			}
		}
	}

	private void parentUpdatePass() {
		for(Node cl: graph) {
			if(cl.getAstClass().parent!=null) {
				if(classNameToIndexMap.containsKey(cl.getAstClass().parent)) {
					int parentIndex = classNameToIndexMap.get(cl.getAstClass().parent);
					cl.setParent(graph.get(parentIndex));
					graph.get(parentIndex).addChild(cl);
				} else {
					errors.add(new Error(cl.getAstClass().filename, cl.getAstClass().getLineNo(), 
								new StringBuilder().append("Inherited class \"").append(cl.getAstClass().parent)
								.append("\" for \"").append(cl.getAstClass().name).append("\" has not been declared").toString()));
				}
			} else {
				if(!InheritanceGraph.ROOT_CLASS_NAME.equals(cl.getAstClass().name)) {
					cl.setParent(InheritanceGraph.ROOT_AST_NODE);
					InheritanceGraph.ROOT_AST_NODE.addChild(cl);
				}
			}
		}
	}

	private boolean isCyclicUtil(int v, List<Boolean> visited, List<Boolean> recStack, Stack<Node> cycle) {
		Node currentNode = graph.get(v);
	    cycle.push(currentNode);
	    if(visited.get(v) == false) {
	        visited.set(v, true);
	        recStack.set(v, true);
	        if(currentNode.parentExists()) {
	        	int parentIndex = currentNode.getParent().getIndex();
	        	if(parentIndex != Node.NO_PARENT) {
		            if ( (!visited.get(parentIndex) && isCyclicUtil(parentIndex, visited, recStack, cycle)) 
		            	  || recStack.get(parentIndex) ) {
		                return true;
		            }
	        	}
	        }
	    }
	    cycle.pop();
	    recStack.set(v, false);
	    return false;
	}

	public List<Stack<Node>> hasCyclePass() {

	    int V = graph.size();
	    List<Boolean> visited = new ArrayList<>();
	    List<Boolean> recStack = new ArrayList<>();
	    Stack<Node> cycle = new Stack<>();
	    for(int i = 0; i < V; i++) {
	        visited.add(false);
	        recStack.add(false);
	    }
	 	
	 	List<Stack<Node>> cycles = new ArrayList<>();
	    for(int i = 0; i < V; i++)
	        if (isCyclicUtil(i, visited, recStack, cycle)) {
	        	cycles.add(cycle);
	        	cycle = new Stack<>();
	        }
	 
	    return cycles;
	}

	public List<Error> getErrors() {
		return errors;
	}

}

class Node {

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

	public boolean parentExists() {
		return parent!=null;
	}

	public void addChild(Node child) {
		children.add(child);
	}

	public int getIndex() {
		return index;
	}

	public AST.class_ getAstClass() {
		return astClass;
	}

	public Node getParent() {
		return parent;
	}

	public void setParent(Node parent) {
		this.parent = parent;
	}

}