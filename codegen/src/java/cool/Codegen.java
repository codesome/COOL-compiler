package cool;

import java.io.PrintWriter;

public class Codegen{
	public Codegen(AST.program program, PrintWriter out, String fileName){
        out.println("; ModuleID = '" + fileName + "'");
        out.println("source_filename = \"" + fileName + "\"");
        out.println();
        Global.out = out;
		Visitor visitor = new VisitorImpl();
		program.accept(visitor);
	}
}
