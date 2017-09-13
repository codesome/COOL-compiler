package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Stack;
import java.lang.StringBuilder;

public class InheritanceGraph {

	public static final String ROOT_CLASS_NAME = "Object";

	private StringBuilder errorString;
	private Map<String,Integer> classNameToIndexMap;
	private List<Node> graph;
	private int totalNodes;
	private boolean hasMain;

	public InheritanceGraph() {

		errorString = new StringBuilder();
		
		graph = new ArrayList<>();
		graph.add(new Node(InheritanceGraph.ROOT_CLASS_NAME, 0));
		
		classNameToIndexMap = new HashMap<>();
		classNameToIndexMap.put(InheritanceGraph.ROOT_CLASS_NAME, 0);
		
		totalNodes = 1;
		hasMain = false;
	}

	public String addClass(String className) {
		return addClass(className, null);
	}

	public String addClass(String className, String parentClassName) {
		if(classNameToIndexMap.containsKey(className)) {
			return new StringBuilder().append("class \"").append(className).append("\" has been redeclared\n").toString();
		}
		graph.add(new Node(className, totalNodes, parentClassName));
		classNameToIndexMap.put(className, totalNodes);
		totalNodes++;

		if("Main".equals(className)) {
			hasMain = true;
		}

		return null;
	}

	public boolean hasMain() {
		return hasMain;
	}

	public String analyze() {
		boolean errorExists = false;
		StringBuilder errorString = new StringBuilder();
		String parentExistsPassError;
		if((parentExistsPassError = parentUpdatePass())!=null) {
			errorString.append(parentExistsPassError);
			errorExists = true;
		} else if(!hasMain()) {
			System.out.println("hello");
			errorString.append("'Main' class is missing.");
			errorExists = true;
		} else { 
			Stack<Node> cycle = hasCyclePass();
			if(!cycle.isEmpty()) {
				errorString.append("Classes have cyclic dependency: ");
				int size = cycle.size();
				StringBuilder cyclePath = new StringBuilder();
				for(int i=0; i<size-1; i++) {
					cyclePath.append(cycle.pop().getName()).append(" -> ");
				}
				String lastClassName = cycle.pop().getName();
				errorString.append(lastClassName).append(" -> ");
				errorString.append(cyclePath).append(lastClassName);
				errorExists = true;
			}
		}

		return (errorExists)? errorString.toString(): null;
	}

	private String parentUpdatePass() {
		for(Node cl: graph) {
			if(cl.parentExists()) {
				if(classNameToIndexMap.containsKey(cl.getParentName())) {
					int parentIndex = classNameToIndexMap.get(cl.getParentName());
					cl.setParentIndex(parentIndex);
					graph.get(parentIndex).addChild(cl);
				} else {
					return new StringBuilder().append("Parent class \"").append(cl.getParentName()).append("\" for \"")
						.append(cl.getName()).append("\" has not been declared\n").toString();
				}
			}
		}
		return null;		
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
					// System.out.println(currentNode.getName() + " -> " + currentNode.getParentName());
		            if ( (!visited.get(parentIndex) && isCyclicUtil(parentIndex, visited, recStack, cycle)) || recStack.get(parentIndex) ) {
		                return true;
		            }
	        	}
	        }
	 
	    }
	    cycle.pop();
	    recStack.set(v, false);
	    return false;
	}

	// TODO: return cycle if exists
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

}

class Node {

	public static final int NO_PARENT = -1;

	private String name;
	private int index;
	private String parentName;
	private int parentIndex;
	private List<Node> children;

	public Node(String name, int index, String parentName) {
		this.parentName = parentName;
		init(name, index);
	}

	public Node(String name, int index) {
		this.parentName = null;
		init(name, index);
	}

	private void init(String name, int index) {
		this.name = name;
		this.index = index;
		this.parentIndex = Node.NO_PARENT;
		children = new ArrayList<>();
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

	public String getName() {
		return name;
	}

	public String getParentName() {
		return parentName;
	}

	public int getParentIndex() {
		return parentIndex;
	}

	public void setParentIndex(int parentIndex) {
		this.parentIndex = parentIndex;
	}

}