package cool;

import java.io.PrintWriter;

public class Codegen{
	public Codegen(AST.program program, PrintWriter out){
        Global.out = out;
		Visitor visitor = new VisitorImpl();
		program.accept(visitor);
	}
}
