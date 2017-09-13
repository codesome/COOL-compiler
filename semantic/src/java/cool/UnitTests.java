package cool;

public class UnitTests {

	private static AST.class_ getEmptyClass(String name, String parentName) {
		return new AST.class_(name, null, parentName, null, 0);
	}

	// TODO: add assert statements if needed
	public static void testInheritanceGraph1() {
		System.out.println("testInheritanceGraph1:");
		InheritanceGraph ig = new InheritanceGraph();
		ig.addClass(getEmptyClass("Main", null));
		ig.addClass(getEmptyClass("Classx", null));
		ig.addClass(getEmptyClass("Class1", "Class2"));
		ig.addClass(getEmptyClass("Class2", "Class3"));
		ig.addClass(getEmptyClass("Class3", "Class1"));
		ig.addClass(getEmptyClass("Classx", "Classy"));
		ig.analyze();
		for(String error: ig.getErrors()) {
			System.out.println(error);
		}
	}

	public static void testInheritanceGraph2() {
		System.out.println("testInheritanceGraph2:");
		InheritanceGraph ig = new InheritanceGraph();
		ig.addClass(getEmptyClass("Classx", null));
		ig.addClass(getEmptyClass("Class1", "Class2"));
		ig.addClass(getEmptyClass("Class2", "Class3"));
		ig.analyze();
		for(String error: ig.getErrors()) {
			System.out.println(error);
		}
	}

	public static void main(String[] args) {
		testInheritanceGraph1();
		testInheritanceGraph2();
	}
	
}