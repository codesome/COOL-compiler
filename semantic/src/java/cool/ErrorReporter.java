package cool;

interface ErrorReporter {
	public void report(String filename, int lineNo, String error);
}