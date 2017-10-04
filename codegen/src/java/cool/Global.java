package cool;

import java.lang.StringBuilder;
import java.io.PrintWriter;

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

    // Contains graph after parsing all the classes and its parents
    // The base classes are also updated in this.
    public static InheritanceGraph inheritanceGraph;

    // Contains all the variables in the scope
    // mapped with their type: variable_name -> Type
    public static ScopeTable<String> scopeTable;

    public static PrintWriter out;

    static {
        scopeTable = new ScopeTable<>();
    }


    // Mangled name logic

    // Used for mangled name with class and without return type
    // And for arguments as AST.expression
    public static String getMangledName(String className, String functionName) {
        return new StringBuilder().append("_CN").append(className.length())
        .append(className).append("FN").append(functionName.length()).append(functionName)
        .append("_").toString();
    }

}
