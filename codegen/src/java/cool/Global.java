package cool;

import java.lang.StringBuilder;
import java.io.PrintWriter;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

public class Global {

    // Type constants
    public static class Constants {
        public static final String ROOT_TYPE = "Object";
        public static final String IO_TYPE = "IO";
        public static final String INT_TYPE = "Int";
        public static final String BOOL_TYPE = "Bool";
        public static final String STRING_TYPE = "String";
        public static final String MAIN_TYPE = "Main";
        public static final String PTR_TYPE = "i8*";
    }

    // Contains graph after parsing all the classes and its parents
    // The base classes are also updated in this.
    public static InheritanceGraph inheritanceGraph;

    public static Set<String> methodParams;

    public static Map<String,Integer> labelToCountMap;

    public static Map<String,Integer> classSizeMap;

    public static int stringRegisterCounter;
    public static Map<String,String> stringConstantToRegisterMap;

    public static Map<String,Map<String,String>> classToVariableToIndexListMap;
    
    public static PrintWriter out;

    public static int registerCounter;

    public static String currentClass;

    public static boolean needPointer;

    static {
        methodParams = new HashSet<>();
        labelToCountMap = new HashMap<>();
        classSizeMap = new HashMap<>();
        stringConstantToRegisterMap = new HashMap<>();
        classToVariableToIndexListMap = new HashMap<>();
        registerCounter = 0;
        stringRegisterCounter = 0;
        needPointer = false;
    }



}
