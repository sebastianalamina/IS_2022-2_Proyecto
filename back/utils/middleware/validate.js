const Joi = require("joi");

/**
 * Valida que el body enviado sea correcto dado un esquema
 * @param {Function|Joi.schema} schema si es función debe regresar un Joi.schema
 */
function validate(schema, parametersLocation = "body") {
  if (schema instanceof Function) schema = schema(Joi);
  return function (req, res, next) {
    const { value, error } = schema.validate(req[parametersLocation]);
    if (error) {
      return res.status(400).json({ error: error.message });
    }

    req[parametersLocation] = value;
    next();
  };
}

module.exports = validate;
