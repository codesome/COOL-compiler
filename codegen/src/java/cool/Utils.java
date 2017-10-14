package cool;

public class Utils {
	
    public static String getMangledName(String className, String functionName) {
        return new StringBuilder().append("_CN").append(className.length())
        .append(className).append("_FN").append(functionName.length()).append(functionName)
        .append("_").toString();
    }

    public static String getStructName(String className) {
        return "%class." + className;
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

    public static boolean isPrimitiveType(String type) {
        return Global.Constants.STRING_TYPE.equals(type)
                || Global.Constants.INT_TYPE.equals(type)
                || Global.Constants.BOOL_TYPE.equals(type);
    }

    public static int getAttrSize(String type) {
        if(Global.Constants.INT_TYPE.equals(type)) {
            return 4;
        }
        else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return 1;
        }
        return 8;
    }

    public static String getBasicType(String type) {
        if(Global.Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        }
        else if(Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        }
        else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        }
        return Utils.getStructName(type);
    }

    public static String getBasicTypeOrPointer(String type) {
        if(Global.Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        }
        else if(Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        }
        else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        }
        return Utils.getStructName(type) + "*";
    }

    public static int getSizeForStruct(String type) {
        if(Global.Constants.INT_TYPE.equals(type)) {
            return 4;
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return 1;
        } else {
            return 8;
        }
    }

    public static String getNearestParentWithMethod(String className, String mthdName) {
        while(!Global.functionMangledNames.contains(Utils.getMangledName(className, mthdName))) {
            className = Global.inheritanceGraph.getParentClassName(className);
        }
        return className;
    }

}