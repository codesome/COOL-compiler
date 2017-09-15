package cool;

import java.util.List;
import java.util.ArrayList;

public class GlobalData {

    public static final String INT_TYPE = "Int";
    public static final String BOOL_TYPE = "Bool";
    public static final String STRING_TYPE = "String";

    // Initialised in Semantic.java
    public static String filename;
    public static List<Error> errors;
    public static ScopeTable<String> scopeTable;

    static {
    	scopeTable = new ScopeTable<>();
    	errors = new ArrayList<>();
    }

}
