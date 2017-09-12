package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
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

	private boolean isCyclicUtil(int v, List<Boolean> visited, List<Boolean> recStack) {
	    if(visited.get(v) == false) {
	        visited.set(v, true);
	        recStack.set(v, true);
	 
	        if(graph.get(v).parentExists()) {
	        	int parentIndex = graph.get(v).getParentIndex();
	            if ( (!visited.get(parentIndex) && isCyclicUtil(parentIndex, visited, recStack)) || recStack.get(parentIndex) )
	                return true;
	        }
	 
	    }
	    recStack.set(v, false);
	    return false;
	}

	// TODO: return cycle if exists
	private boolean hasCyclePass() {

	    int V = graph.size();
	    List<Boolean> visited = new ArrayList<>();
	    List<Boolean> recStack = new ArrayList<>();
	    for(int i = 0; i < V; i++) {
	        visited.add(false);
	        recStack.add(false);
	    }
	 
	    for(int i = 0; i < V; i++)
	        if (isCyclicUtil(i, visited, recStack))
	            return true;
	 
	    return false;
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