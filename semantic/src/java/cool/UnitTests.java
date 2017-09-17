package cool;

public class UnitTests {

    public static void reportError(String filename, int lineNo, String error){
        System.err.println(filename+":"+lineNo+": "+error);
    }
    public static void reportError(Error error) {
        reportError(error.getFilename(), error.getLineNo(), error.getError());
    }

    private static AST.class_ getEmptyClass(String name, String parentName) {
        return new AST.class_(name, "MyFile.cool", parentName, null, 0);
    }

    public static void testInheritanceGraph1() {
        GlobalData.errors.clear();
        System.out.println("\ntestInheritanceGraph1:");
        InheritanceGraph ig = new InheritanceGraph();
        ig.addClass(getEmptyClass("Main", null));
        ig.addClass(getEmptyClass("Class1", "Class2"));
        ig.addClass(getEmptyClass("Class2", "Class3"));
        ig.addClass(getEmptyClass("Class3", "Class1"));
        ig.addClass(getEmptyClass("Classx", "Classy"));
        ig.addClass(getEmptyClass("Classy", "Classz"));
        ig.addClass(getEmptyClass("Classz", "Classx"));
        ig.addClass(getEmptyClass("Classx", null));
        ig.analyze();
        for(Error error: GlobalData.errors) {
            reportError(error);
        }
    }

    public static void testInheritanceGraph2() {
        GlobalData.errors.clear();
        System.out.println("\ntestInheritanceGraph2:");
        InheritanceGraph ig = new InheritanceGraph();
        ig.addClass(getEmptyClass("Classx", null));
        ig.addClass(getEmptyClass("Class1", "Class2"));
        ig.addClass(getEmptyClass("Class2", "Class3"));
        ig.analyze();
        for(Error error: GlobalData.errors) {
            reportError(error);
        }
    }

    public static void testInheritanceGraph3() {
        GlobalData.errors.clear();
        System.out.println("\ntestInheritanceGraph3:");
        InheritanceGraph ig = new InheritanceGraph();
        ig.addClass(getEmptyClass("ClassTest1", "IO"));
        ig.addClass(getEmptyClass("ClassTest2", "Int"));
        ig.addClass(getEmptyClass("ClassTest3", "Bool"));
        ig.addClass(getEmptyClass("ClassTest4", "String"));
        ig.addClass(getEmptyClass("IO", null));
        ig.addClass(getEmptyClass("Bool", null));
        ig.addClass(getEmptyClass("String", null));
        ig.addClass(getEmptyClass("Int", null));
        ig.addClass(getEmptyClass("Main", null));
        ig.analyze();
        for(Error error: GlobalData.errors) {
            reportError(error);
        }
    }

    public static void main(String[] args) {
        testInheritanceGraph1();
        testInheritanceGraph2();
        testInheritanceGraph3();
    }
    
}
