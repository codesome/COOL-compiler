package cool;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.lang.StringBuilder;

public class Global {

    // Type constants
    public static class Constants {
        public static final String ROOT_TYPE = "Object";
        public static final String IO_TYPE = "IO";
        public static final String INT_TYPE = "Int";
        public static final String BOOL_TYPE = "Bool";
        public static final String STRING_TYPE = "String";
        public static final String MAIN_TYPE = "Main";
    }

    // Current file name of the class
    // Updated before filling classes in inheritance graph
    public static String filename;

    // Contains graph after parsing all the classes and its parents
    // The base classes are also updated in this.
    public static InheritanceGraph inheritanceGraph;

    // Contains all the variables in the scope
    // mapped with their type: variable_name -> Type
    public static ScopeTable<String> scopeTable;

    // Constains all functions defined in inhetiance tree
    // mapped with their mangled name: function_name -> type_mangled_function_name
    public static ScopeTable<String> methodDefinitionScopeTable;

    // Map of function mangled names with its type
    // class_mangled_name_of_function -> return_type_of_function
    public static Map<String,String> mangledNameMap;
    
    // Used while visiting the AST classes
    // Should be updated when we start parsing a class
    public static String currentClass;

    // Used to report an error
    public static ErrorReporter errorReporter;

    static {
        currentClass = "";
        scopeTable = new ScopeTable<>();
        methodDefinitionScopeTable = new ScopeTable<>();
        mangledNameMap = new HashMap<>();
    }


    // Mangled name logic

    // Used for mangled name with class and without return type
    // And for arguments as AST.expression
    public static String getMangledNameWithExpressions(String className, String function, List<AST.expression> exprs) {
        StringBuilder mangledNameBuilder = new StringBuilder();

        // Adding class name and function name to mangled name
        addMangledNameClass(mangledNameBuilder, className);
        addMangledNameFunction(mangledNameBuilder, function);
    
        if(exprs!=null) {
            // Adding exressions to the mangled names
            mangledNameBuilder.append("_AN").append(exprs.size()).append("_");
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
            mangledNameBuilder.append("_AN0__FF");
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }

    // Used for mangled name with return type and without class name
    // And for arguments as AST.formal
    public static String getMangledNameWithType(String type, String function, List<AST.formal> formals) {
        StringBuilder mangledNameBuilder = new StringBuilder();
        addMangledNameType(mangledNameBuilder, type);
        addMangledNameFunction(mangledNameBuilder, function);

        if(formals!= null) {
            mangledNameBuilder.append("_AN").append(formals.size()).append("_");
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
            mangledNameBuilder.append("_AN0__FF");
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }


    // Used for mangled name with class name and without return type
    // And for arguments as AST.formal
    public static String getMangledNameWithClass(String className, String function, List<AST.formal> formals) {
        StringBuilder mangledNameBuilder = new StringBuilder();
        addMangledNameClass(mangledNameBuilder, className);
        addMangledNameFunction(mangledNameBuilder, function);

        if(formals!= null) {
            mangledNameBuilder.append("_AN").append(formals.size()).append("_");
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
            mangledNameBuilder.append("_AN0__FF");
        }

        mangledNameBuilder.append("_");
        return mangledNameBuilder.toString();
    }

    // If mangled name ends with _FT_, means that function has arguments
    // If it ends with _FF_, means that function doesnt have any arguments
    public static boolean hasArguments(String mangledName) {
        if(mangledName==null) return false;
        return "_FT_".equals(mangledName.substring(mangledName.length()-4));
    }

    // Adds class name to the mangled name
    private static void addMangledNameClass(StringBuilder mangledNameBuilder, String className) {
        mangledNameBuilder.append("_CN");
        if(className==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(className.length()).append(className);
        }
    }

    // Adds type to the mangled name
    private static void addMangledNameType(StringBuilder mangledNameBuilder, String type) {
        mangledNameBuilder.append("_TN");
        if(type==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(type.length()).append(type);
        }
    }

    // Adds function name to the mangled name
    private static void addMangledNameFunction(StringBuilder mangledNameBuilder, String function) {
        mangledNameBuilder.append("_FN");
        if(function==null) {
            mangledNameBuilder.append(0);
        } else {
            mangledNameBuilder.append(function.length()).append(function);
        }
    }
    

}
