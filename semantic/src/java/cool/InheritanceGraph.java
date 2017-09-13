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

	private Map<String,Integer> classNameToIndexMap;
	private List<Node> graph;
	private int totalNodes;
	private boolean hasMain;
	private List<String> errors;

	public InheritanceGraph() {
		
		graph = new ArrayList<>();
		graph.add(new Node(new AST.class_(InheritanceGraph.ROOT_CLASS_NAME, null, null, null, 0)
			, InheritanceGraph.ROOT_CLASS_INDEX));
		
		classNameToIndexMap = new HashMap<>();
		classNameToIndexMap.put(InheritanceGraph.ROOT_CLASS_NAME, InheritanceGraph.ROOT_CLASS_INDEX);
		
		errors = new ArrayList<>();

		totalNodes = 1;
		hasMain = false;
	}

	public void addClass(AST.class_ astClass) {
		if(classNameToIndexMap.containsKey(astClass.getName())) {
			errors.add(new StringBuilder().append("class \"").append(astClass.getName())
				.append("\" has been redeclared").toString());
			return;
		}
		graph.add(new Node(astClass, totalNodes, astClass.getParentName()));
		classNameToIndexMap.put(astClass.getName(), totalNodes);
		totalNodes++;

		if("Main".equals(astClass.getName())) {
			hasMain = true;
		}

	}

	public boolean hasMain() {
		return hasMain;
	}

	public void analyze() {
		parentUpdatePass();

		if(!hasMain()) {
			errors.add("'Main' class is missing.");
		}

		Stack<Node> cycle = hasCyclePass();
		if(!cycle.isEmpty()) {
			StringBuilder errorString = new StringBuilder();
			errorString.append("Classes have cyclic dependency: ");
			int size = cycle.size();
			StringBuilder cyclePath = new StringBuilder();
			for(int i=0; i<size-1; i++) {
				cyclePath.append(cycle.pop().getAstClass().getName()).append(" -> ");
			}
			String lastClassName = cycle.pop().getAstClass().getName();
			errorString.append(lastClassName).append(" -> ");
			errorString.append(cyclePath).append(lastClassName);
			errors.add(errorString.toString());
		}
	}

	private void parentUpdatePass() {
		for(Node cl: graph) {
			if(cl.parentExists()) {
				if(classNameToIndexMap.containsKey(cl.getParentName())) {
					int parentIndex = classNameToIndexMap.get(cl.getParentName());
					cl.setParentIndex(parentIndex);
					cl.setParent(graph.get(parentIndex));
					graph.get(parentIndex).addChild(cl);
				} else {
					errors.add(new StringBuilder().append("Parent class \"").append(cl.getParentName())
									.append("\" for \"").append(cl.getAstClass().getName())
									.append("\" has not been declared").toString());
				}
			} else {
				if(!InheritanceGraph.ROOT_CLASS_NAME.equals(cl.getAstClass().getName())) {
					cl.setParentName(InheritanceGraph.ROOT_CLASS_NAME);
					cl.setParentIndex(InheritanceGraph.ROOT_CLASS_INDEX);
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
	        	int parentIndex = currentNode.getParentIndex();
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

	public Stack<Node> hasCyclePass() {

	    int V = graph.size();
	    List<Boolean> visited = new ArrayList<>();
	    List<Boolean> recStack = new ArrayList<>();
	    Stack<Node> cycle = new Stack<>();
	    for(int i = 0; i < V; i++) {
	        visited.add(false);
	        recStack.add(false);
	    }
	 
	    for(int i = 0; i < V; i++)
	        if (isCyclicUtil(i, visited, recStack, cycle))
	            return cycle;
	 
	    return cycle;
	}

	public List<String> getErrors() {
		return errors;
	}

}

class Node {

	public static final int NO_PARENT = -1;

	private AST.class_ astClass;
	private int index;
	private String parentName;
	private int parentIndex;
	private Node parent;
	private List<Node> children;
	private boolean isInitiated;

	public Node(AST.class_ astClass, int index, String parentName) {
		this.parentName = parentName;
		this.isInitiated = false;
		init(astClass, index);
	}

	public Node(AST.class_ astClass, int index) {
		this.parentName = null;
		this.isInitiated = false;
		init(astClass, index);
	}

	private void init(AST.class_ astClass, int index) {
		if(isInitiated) return;
		this.astClass = astClass;
		this.index = index;
		this.parentIndex = Node.NO_PARENT;
		this.children = new ArrayList<>();
		this.parent = null;
		this.isInitiated = true;
	}

	public boolean parentExists() {
		return parentName!=null || parentIndex!=Node.NO_PARENT;
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

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public int getParentIndex() {
		return parentIndex;
	}

	public void setParentIndex(int parentIndex) {
		this.parentIndex = parentIndex;
	}

	public Node getParent() {
		return parent;
	}

	public void setParent(Node parent) {
		this.parent = parent;
	}

}