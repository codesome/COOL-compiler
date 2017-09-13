package cool;

public class Error {

	private String filename;
	private int lineNo;
	private String error;
	
	public Error(String filename, int lineNo, String error) {
		this.filename = filename;
		this.lineNo = lineNo;
		this.error = error;
	}

	public int getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getLineNo() {
		return lineNo;
	}
	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
}