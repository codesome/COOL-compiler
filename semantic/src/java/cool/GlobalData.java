package cool;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.lang.StringBuilder;

public class GlobalData {

    public static final String INT_TYPE = "Int";
    public static final String BOOL_TYPE = "Bool";
    public static final String STRING_TYPE = "String";

    // Initialised in Semantic.java
    public static String filename;
    public static List<Error> errors;

    // Constains all the variables in the scope
    // mapped with their type
    public static ScopeTable<String> scopeTable;

    // Contains graph after parsing all the classes and its parents
    // The base classes are also updated in this.
    public static InheritanceGraph inheritanceGraph;

    // Map of function mangled names with its type
    // mangled_name_of_function -> return_type_of_function
    public static Map<String,String> mangledNameMap;
    
    // Used while visiting the AST classes
    // Should be updated when we start parsing a class
    public static String currentClass;

    static {
        currentClass = "";
    	scopeTable = new ScopeTable<>();
    	errors = new ArrayList<>();
        mangledNameMap = new HashMap<>();
    }

    // TODO: update this temporary implementation
    public static String getMangledName(String type, String function, List<AST.expression> exprs) {
        StringBuilder mangledNameBuilder = new StringBuilder();
        mangledNameBuilder.append("_N");
        if(type==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(type.length()).append(type);
        }

        mangledNameBuilder.append("FN");
        if(function==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(function.length()).append(function);
        }

        if(exprs!= null) {
            mangledNameBuilder.append("Ar");
            mangledNameBuilder.append(exprs.size());
            mangledNameBuilder.append("_");
            int counter = 0;
            for(AST.expression exp : exprs) {
                counter++;
                mangledNameBuilder.append(counter);
                mangledNameBuilder.append("N");
                mangledNameBuilder.append(exp.type.length());
                mangledNameBuilder.append(exp.type);
            }
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }

}
