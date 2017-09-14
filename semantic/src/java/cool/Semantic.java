package cool;

public class Semantic{
	private boolean errorFlag = false;
	public void reportError(String filename, int lineNo, String error){
		errorFlag = true;
		System.err.println(filename+":"+lineNo+": "+error);
	}
	public boolean getErrorFlag(){
		return errorFlag;
	}

/*
	Don't change code above this line
*/

	List<AST.class_> classes;
	InheritanceGraph ig;

	public void reportError(Error error) {
		reportError(error.getFilename(), error.getLineNo(), error.getError());
	}

	public void reportError(List<Error> errors) {
		for(Error error: errors) {
			reportError(error);
		}
	}

	public Semantic(AST.program program){
		//Write Semantic analyzer code here
		classes = program.classes;
		ig = new InheritanceGraph();

		for(AST.class_ cl: classes) {
			ig.addClass(cl);
		}
		ig.analyze();

		List<Error> igErrors = ig.getErrors();

		if(igErrors.size() > 0) {
			reportError(igErrors);
		} else {



		}

	}
}
