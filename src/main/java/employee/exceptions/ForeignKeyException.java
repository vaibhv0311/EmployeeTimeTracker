package employee.exceptions;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;

public class ForeignKeyException extends DataIntegrityViolationException {

	private static final long serialVersionUID = 5597223072299683184L;

	public ForeignKeyException(String msg) {
		super(msg);

	}

}
