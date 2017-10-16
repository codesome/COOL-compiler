package cool;

public class Utils {
    
    public static boolean isPrimitiveType(String type) {
        return Global.Constants.STRING_TYPE.equals(type)
                || Global.Constants.INT_TYPE.equals(type)
                || Global.Constants.BOOL_TYPE.equals(type);
    }

    public static boolean isDefaultClass(String name) {
        return Global.Constants.IO_TYPE.equals(name) || Global.Constants.INT_TYPE.equals(name) 
        || Global.Constants.STRING_TYPE.equals(name) || Global.Constants.BOOL_TYPE.equals(name)
        || Global.Constants.ROOT_TYPE.equals(name);
    }

    public static String getStructName(String className) {
        return "%class." + className;
    }

    public static String getMangledName(String className, String functionName) {
        return new StringBuilder().append("_CN").append(className.length())
        .append(className).append("_FN").append(functionName.length()).append(functionName)
        .append("_").toString();
    }

    public static String getDefaultValue(String type) {
        if(Global.Constants.INT_TYPE.equals(type)) {
            return "0";
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "0";
        } else if(Global.Constants.STRING_TYPE.equals(type)) {
            return IRPrinter.createStringGEP("");
        } else {
            return "undef";
        }
    }

    public static String getBasicType(String type) {
        if(Global.Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        } else if(Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        } else if("i64".equals(type)) {
            return "i64";
        } else if("i1".equals(type)) {
            return "i1";
        }
        return Utils.getStructName(type);
    }

    public static String getBasicTypeOrPointer(String type) {
        // same as getBasicType but the last one has an extra *
        if(Global.Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        } else if(Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        } else if("i64".equals(type)) {
            return "i64";
        } else if("i1".equals(type)) {
            return "i1";
        }
        return Utils.getStructName(type) + "*";
    }

    public static int getSizeForStruct(String type) {
        if(Global.Constants.INT_TYPE.equals(type)) {
            return 4;
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return 1;
        } else {
            // pointers
            return 8;
        }
    }

    // returns the name of the nearest parent with the given method name
    public static String getNearestParentWithMethod(String className, String mthdName) {
        while(!Global.functionMangledNames.contains(Utils.getMangledName(className, mthdName))) {
            className = Global.inheritanceGraph.getParentClassName(className);
        }
        return className;
    }

}