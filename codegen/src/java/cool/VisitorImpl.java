package cool;

import java.lang.StringBuilder;
import java.util.Map;
import java.util.HashMap;

class VisitorImpl extends ExpressionVisitorImpl {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    private void createStructs() {
        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        Global.out.println(Utils.getStructName(Global.Constants.ROOT_TYPE) + " = type {}");
        Global.classToVariableToIndexListMap.put(Global.Constants.ROOT_TYPE, new HashMap<>());

        for(InheritanceGraph.Node child: rootNode.getChildren()) {
            createStructsDFS(child);
        }

    }

    private void createStructsDFS(InheritanceGraph.Node node) {
        AST.class_ cl = node.getAstClass();
        StringBuilder builder = new StringBuilder(Utils.getStructName(cl.name));
        builder.append(" = type { ").append(Utils.getStructName(node.getParent().getAstClass().name));
        
        Map<String, String> variableToIndexListMap = new HashMap<>();
        Map<String, String> parentMap = Global.classToVariableToIndexListMap.get(node.getParent().getAstClass().name);
        for(Map.Entry<String, String> entry : parentMap.entrySet()) {
            variableToIndexListMap.put(entry.getKey(), " i32 0,"+entry.getValue());
        }

        int index = 0;
        for(AST.feature f : cl.features) {
            if(f instanceof AST.attr) {
                index++;
                AST.attr a = (AST.attr) f;
                builder.append(", ").append(Utils.convertType(a));
                variableToIndexListMap.put(a.name, " i32 0, i32 "+index);
            }
        }

        builder.append(" }");
        Global.out.println(builder.toString());

        Global.classToVariableToIndexListMap.put(cl.name, variableToIndexListMap);
        
        for(InheritanceGraph.Node child: node.getChildren()) {
            createStructsDFS(child);
        }
    }

    public void visit(AST.program prog) {

        // preparing inheritance graph
        Global.inheritanceGraph = new InheritanceGraph();
        for(AST.class_ cl: prog.classes) {
            Global.inheritanceGraph.addClass(cl);
        }

        Global.inheritanceGraph.update();

        Global.out.println();
        createStructs();
        Global.out.println();

        for(Map.Entry<String, Map<String, String>> entry : Global.classToVariableToIndexListMap.entrySet()) {
            System.out.println(entry.getKey());
            for(Map.Entry<String, String> e : entry.getValue().entrySet()) {
                System.out.println(e.getKey() + ":" + e.getValue());
            }
        }

    }

    public void visit(AST.class_ cl) {
        
    }

    public void visit(AST.attr at) {
        
    }

    public void visit(AST.method mthd) {
        
    }

    public void visit(AST.formal fm) {
        
    }

}
