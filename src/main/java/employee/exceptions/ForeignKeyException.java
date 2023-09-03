package employee.exceptions;

import org.springframework.dao.DataAccessException;

public class ForeignKeyException extends DataAccessException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5597223072299683184L;

	public ForeignKeyException(String msg) {
		super(msg);

	}

}
