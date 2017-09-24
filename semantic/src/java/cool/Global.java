package cool;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.lang.StringBuilder;

public class Global {

    public static class Constants {
        public static final String ROOT_TYPE = "Object";
        public static final String IO_TYPE = "IO";
        public static final String INT_TYPE = "Int";
        public static final String BOOL_TYPE = "Bool";
        public static final String STRING_TYPE = "String";
    }


    // Initialised in Semantic.java
    public static String filename;

    // Contains all the variables in the scope
    // mapped with their type
    public static ScopeTable<String> scopeTable;

    // Constains all functions defined in inhetiance tree
    // mapped with their mangled name: function_name -> mangled_function_name
    public static ScopeTable<String> methodDefinitionScopeTable;

    // Contains graph after parsing all the classes and its parents
    // The base classes are also updated in this.
    public static InheritanceGraph inheritanceGraph;

    // Map of function mangled names with its type
    // mangled_name_of_function -> return_type_of_function
    public static Map<String,String> mangledNameMap;
    
    // Used while visiting the AST classes
    // Should be updated when we start parsing a class
    public static String currentClass;

    public static ErrorReporter errorReporter;

    static {
        currentClass = "";
        scopeTable = new ScopeTable<>();
        methodDefinitionScopeTable = new ScopeTable<>();
        mangledNameMap = new HashMap<>();
    }


    // TODO: update this temporary implementation
    private static void initMangledNameClass(StringBuilder mangledNameBuilder, String className) {
        mangledNameBuilder.append("_CN");
        if(className==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(className.length()).append(className);
        }
    }

    private static void initMangledNameType(StringBuilder mangledNameBuilder, String type) {
        mangledNameBuilder.append("N");
        if(type==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(type.length()).append(type);
        }
    }

    private static void initMangledNameFunction(StringBuilder mangledNameBuilder, String function) {
        mangledNameBuilder.append("FN");
        if(function==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(function.length()).append(function);
        }
    }
    public static String getMangledNameWithExpressions(String className, String function, List<AST.expression> exprs) {
        StringBuilder mangledNameBuilder = new StringBuilder();
        initMangledNameClass(mangledNameBuilder, className);
        initMangledNameFunction(mangledNameBuilder, function);
    
        if(exprs!=null) {
            mangledNameBuilder.append("Ar").append(exprs.size()).append("_");
            int counter = 0;
            for(AST.expression exp : exprs) {
                counter++;
                mangledNameBuilder.append(counter).append("N")
                .append(exp.type.length()).append(exp.type);
            }
            if(exprs.size()>0)
                mangledNameBuilder.append("_FT");
            else
                mangledNameBuilder.append("_FF");
        } else {
            mangledNameBuilder.append("_FF");
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }
    public static String getMangledNameWithType(String className, String type, String function, List<AST.formal> formals) {
        StringBuilder mangledNameBuilder = new StringBuilder();
        initMangledNameClass(mangledNameBuilder, className);
        initMangledNameType(mangledNameBuilder, type);
        initMangledNameFunction(mangledNameBuilder, function);

        if(formals!= null) {
            mangledNameBuilder.append("Ar").append(formals.size()).append("_");
            int counter = 0;
            for(AST.formal fm : formals) {
                counter++;
                mangledNameBuilder.append(counter).append("N")
                .append(fm.typeid.length()).append(fm.typeid);
            }
            if(formals.size()>0)
                mangledNameBuilder.append("_FT");
            else
                mangledNameBuilder.append("_FF");
        } else {
            mangledNameBuilder.append("_FF");
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }
    public static String getMangledNameWithoutType(String className, String function, List<AST.formal> formals) {
        StringBuilder mangledNameBuilder = new StringBuilder();
        initMangledNameClass(mangledNameBuilder, className);
        initMangledNameFunction(mangledNameBuilder, function);

        if(formals!= null) {
            mangledNameBuilder.append("Ar").append(formals.size()).append("_");
            int counter = 0;
            for(AST.formal fm : formals) {
                counter++;
                mangledNameBuilder.append(counter).append("N")
                .append(fm.typeid.length()).append(fm.typeid);
            }
            if(formals.size()>0)
                mangledNameBuilder.append("_FT");
            else
                mangledNameBuilder.append("_FF");
        } else {
            mangledNameBuilder.append("_FF");
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }
    public static boolean hasArguments(String mangledName) {
        if(mangledName==null) return false;
        return "_FT_".equals(mangledName.substring(mangledName.length()-4));
    }

}
