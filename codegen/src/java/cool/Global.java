package cool;

import java.lang.StringBuilder;
import java.io.PrintWriter;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

public class Global {

    public static class Constants {
        public static final String ROOT_TYPE = "Object";
        public static final String IO_TYPE = "IO";
        public static final String INT_TYPE = "Int";
        public static final String BOOL_TYPE = "Bool";
        public static final String STRING_TYPE = "String";
        public static final String MAIN_TYPE = "Main";
        public static final String DIVIDE_BY_ZERO_ERROR = "\nDivide by 0 exception at line no ";
        public static final String DIVIDE_BY_ZERO_FUNCTION = "print_div_by_zero_err_msg";
        public static final String VOID_CALL_ERROR = "\nDispatch to void at line no ";
        public static final String VOID_CALL_FUNCTION = "print_dispatch_on_void_error";
    }

    // Contains graph after parsing all the classes and its parents
    // The base classes are also updated in this.
    public static InheritanceGraph inheritanceGraph;

    // this set is updated with the names of method
    // parameters when visiting a method (set is cleared before)
    public static Set<String> methodParams;

    // stores label mapped to its count
    // used to avoid same name for different labels
    public static Map<String,Integer> labelToCountMap;

    // has a map of class_name->size_of_struct for that class
    public static Map<String,Integer> classSizeMap;

    // current number of string constants
    // used to give name to global string constant register
    public static int stringRegisterCounter;

    // Its a map of string_constant->global register name for that string constant
    public static Map<String,String> stringConstantToRegisterMap;

    // This map is used to get index list for getelementpointer for a particular variable in the struct
    // this stores double map of class_name->variable_name->index list as string
    // so for GEP index list of variable 'a' in class 'A', you will search for (map('A'))('a')
    public static Map<String,Map<String,String>> classToVariableToIndexListMap;
    
    // The writer to which the IR should be written
    public static PrintWriter out;

    // current counter of register in the function
    public static int registerCounter;

    // Name of current class which is being visited
    public static String currentClass;

    // All the functions present in the program, stored as mangled names
    public static Set<String> functionMangledNames;

    // return type of the main
    // populated while visiting the classes
    public static String mainReturnType;

    static {
        methodParams = new HashSet<>();
        functionMangledNames = new HashSet<>();
        labelToCountMap = new HashMap<>();
        classSizeMap = new HashMap<>();
        stringConstantToRegisterMap = new HashMap<>();
        classToVariableToIndexListMap = new HashMap<>();
        registerCounter = 0;
        stringRegisterCounter = 0;
    }



}
