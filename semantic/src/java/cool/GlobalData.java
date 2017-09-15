package cool;

import java.util.List;
import java.util.ArrayList;

public class GlobalData {

    public static final String INT_TYPE = "INT";
    public static final String BOOL_TYPE = "BOOL";
    public static final String STRING_TYPE = "STRING";

    // Initialised in Semantic.java
    public static String filename;

    public static List<Error> errors;

    // TODO: current context variables and methods
    // TODO: Scope data

    public static ScopeTable<String> variableScopeTable;

    static {
    	variableScopeTable = new ScopeTable<>();
    	errors = new ArrayList<>();
    } 

}

class NameType {
	public String name;
	public String type;
}