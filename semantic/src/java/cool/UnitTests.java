package cool;

public class UnitTests {

	// TODO: add assert statements
	public static void testInheritanceGraph() {
		InheritanceGraph ig = new InheritanceGraph();
		System.out.println(ig.addClass("Main"));
		System.out.println(ig.addClass("Classx"));
		System.out.println(ig.addClass("Class1", "Class2"));
		System.out.println(ig.addClass("Class2", "Class3"));
		System.out.println(ig.addClass("Class3", "Class1"));
		System.out.println(ig.analyze());
	}

	public static void main(String[] args) {
		testInheritanceGraph();
	}
	
}