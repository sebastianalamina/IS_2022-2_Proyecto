const Joi = require("joi");

class ValidationError extends Error {
  constructor(joiError) {
    super(joiError.name); // (1)
    const details = {
      original: joiError._original,
      details: joiError.details,
    };
    this.name = JSON.stringify(details, null, 2);
  }
}

/**
 * Valida que la respuesta sea correcto dado un esquema
 * @param {Function|Joi.schema} schema si es función debe regresar un Joi.schema
 */
function validate(schema, parametersLocation = "body") {
  if (schema instanceof Function) schema = schema(Joi);
  return function (res) {
    let { error } = schema.validate(res.body);
    if (error) throw new ValidationError(error);
  };
}

module.exports = validate;
