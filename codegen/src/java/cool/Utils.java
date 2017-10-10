package cool;

public class Utils {
	
    public static String getMangledName(String className, String functionName) {
        return new StringBuilder().append("_CN").append(className.length())
        .append(className).append("FN").append(functionName.length()).append(functionName)
        .append("_").toString();
    }

    public static String getStructName(String className) {
        return "%class." + className;
    }

    public static String convertType(AST.attr at) {
        if(Global.Constants.INT_TYPE.equals(at.typeid)) {
            return "i32";
        } else if(Global.Constants.BOOL_TYPE.equals(at.typeid)) {
            return "i8";
        } else {
            return Utils.getStructName(at.typeid);
        }
    }

    public static String convertType(String type) {
    /*    if("i32".equals(type) || Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        } else if("i8".equals(type) || Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        } else if("i8*".equals(type)) {
            return "i8*";
        } else {
            return Utils.getStructName(type);
        } */
        if("i32".equals(type) || "i8".equals(type) || "i1".equals(type)) {
            return type;
        }
        if("i32*".equals(type) || "i8*".equals(type) || "i1*".equals(type)) {
            return type;
        }
        return Utils.getStructName(type);
    }

    public static String convertTypeWithPtr(String type) {
    /*    if("i32".equals(type) || Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        } else if("i8".equals(type) || Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        } else if("i8*".equals(type)) {
            return "i8*";
        } else if(Global.Constants.PTR_TYPE.equals(type)) {
            return "i8*";
        } else if("i1".equals(type)) {
            return "i1";
        } else {
            return Utils.getStructName(type) + "*";
        } */
        if("i32".equals(type) || "i8".equals(type) || "i1".equals(type)) {
            return type;
        }
        if("i32*".equals(type) || "i8*".equals(type) || "i1*".equals(type)) {
            return type;
        }
        return Utils.getStructName(type) + "*";
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

}