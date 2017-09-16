package cool;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
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
    private static StringBuilder initMangledName(String className, String type, String function) {
        StringBuilder mangledNameBuilder = new StringBuilder();

        mangledNameBuilder.append("_CN");
        if(className==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(className.length()).append(className);
        }

        mangledNameBuilder.append("N");
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
        return mangledNameBuilder;
    }
    public static String getMangledNameWithExpressions(String className, String type, String function, List<AST.expression> exprs) {
        StringBuilder mangledNameBuilder = initMangledName(className, type, function);
    
        if(exprs!= null) {
            mangledNameBuilder.append("Ar").append(exprs.size()).append("_");
            int counter = 0;
            for(AST.expression exp : exprs) {
                counter++;
                mangledNameBuilder.append(counter).append("N")
                .append(exp.type.length()).append(exp.type);
            }
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }
    public static String getMangledNameWithFormals(String className, String type, String function, List<AST.formal> formals) {
        StringBuilder mangledNameBuilder = initMangledName(className, type, function);

        if(formals!= null) {
            mangledNameBuilder.append("Ar").append(formals.size()).append("_");
            int counter = 0;
            for(AST.formal fm : formals) {
                counter++;
                mangledNameBuilder.append(counter).append("N")
                .append(fm.typeid.length()).append(fm.typeid);
            }
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }

}
