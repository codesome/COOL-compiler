package cool;

import java.util.List;

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


	public void reportError(Error error) {
		reportError(error.getFilename(), error.getLineNo(), error.getError());
	}

	public void reportError(List<Error> errors) {
		for(Error error: errors) {
			reportError(error);
		}
	}

	public Semantic(AST.program program){
		Visitor visitor = new VisitorImpl();
		program.accept(visitor);
		reportError(GlobalData.errors);
	}
}
