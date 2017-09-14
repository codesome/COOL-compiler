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

	// TODO: add assert statements if needed
	public static void testInheritanceGraph1() {
		System.out.println("testInheritanceGraph1:");
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
		for(Error error: ig.getErrors()) {
			reportError(error);
		}
	}

	public static void testInheritanceGraph2() {
		System.out.println("testInheritanceGraph2:");
		InheritanceGraph ig = new InheritanceGraph();
		ig.addClass(getEmptyClass("Classx", null));
		ig.addClass(getEmptyClass("Class1", "Class2"));
		ig.addClass(getEmptyClass("Class2", "Class3"));
		ig.analyze();
		for(Error error: ig.getErrors()) {
			reportError(error);
		}
	}

	public static void main(String[] args) {
		testInheritanceGraph1();
		testInheritanceGraph2();
	}
	
}