@error
model NotFoundError {
  code: "NOT_FOUND";
  message: string;
}
model ValidationError {
  code: "VALIDATION_ERROR";
  message: string;
  details: string[];
}
@error
model InternalServerError {
  code: "INTERNAL_SERVER_ERROR";
  message: string;
}
model BadRequest {
  code: "BAD_REQUEST";
  message: string;
}
