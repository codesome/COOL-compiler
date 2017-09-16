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

		GlobalData.inheritanceGraph = new InheritanceGraph();

		for(AST.class_ cl: program.classes) {
			GlobalData.filename = cl.filename;
			GlobalData.inheritanceGraph.addClass(cl);
		}
		GlobalData.inheritanceGraph.analyze();

		if(GlobalData.errors.size() > 0) {
			reportError(GlobalData.errors);
		} else {



		}

	}
}
