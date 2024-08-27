class HttpError extends Error {
    code: string;
    statusCode: number;
    constructor(message: any, errorCode: string, statusCode: number) {
      super(message);
      Object.setPrototypeOf(this, new.target.prototype);
      this.message = message;
      this.code = errorCode;
      this.statusCode = statusCode;
      Error.captureStackTrace(this, this.constructor);
    }
  
    static badRequest(message: string) {
      return new HttpError(message, "bad-request", 400);
    }
  
    static referenceError(message: string) {
      return new HttpError(message, "reference-error", 400);
    }
  
    static notFound(params: string[]) {
      return new HttpError(
        params.map((param) => `${param} not found`).join(", "),
        "not-found",
        404
      );
    }
  
    static invalidParameters(params: string[]) {
      return new HttpError(
        params.map((param) => `Invalid ${param}`).join(", "),
        "invalid-parameters",
        400
      );
    }
  
    static missingParameters(params: string[]) {
      return new HttpError(
        params.map((param) => `${param} is required`).join(", "),
        "missing-parameters",
        400
      );
    }
  
    static duplicateValues(params: string[]) {
      return new HttpError(
        params.map((param) => `Duplicate ${param}`).join(", "),
        "duplicate-values",
        409
      );
    }
  
    static invalidContactNumber() {
      return new HttpError("Invalid contact number", "invalid-parameters", 400);
    }
  
    static invalidCredentials() {
      return new HttpError(
        "Invalid username or password",
        "invalid-parameters",
        400
      );
    }
  
    static unAuthorized() {
      return new HttpError(
        "User is not authorized for this action",
        "forbidden",
        403
      );
    }
  
    static invalidTokens() {
      return new HttpError("Tokens are missing or invalid", "unauthorized", 401);
    }
  }
  
  export { HttpError };