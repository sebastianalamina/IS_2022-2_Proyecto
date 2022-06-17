const { PrismaClient } = require("@prisma/client");

const roles = require("../constants/roles");

const prisma = new PrismaClient();

/**
 * Middleware de autenficación.
 * @param {express.Request} req Express request
 * @param {express.Response} res Express response
 * @param {express.RequestHandler} next Express request handler callback
 */
async function bearerAuth(req, res, next) {
  let token;
  req.authenticated = false;
  req.user = null;

  // Toma token y cabezeras
  if (req.headers && req.headers.authorization) {
    const parts = req.headers.authorization.split(" ");
    if (parts.length === 2) {
      const [scheme, credentials] = parts;
      if (/^Bearer$/i.test(scheme)) {
        token = credentials;
      } else {
        return res.status(400).json({ error: "Invalid token type" });
      }
    } else {
      return res.status(400).json({ error: "Invalid authorization header" });
    }
  }

  if (!token) {
    return next();
  } else {
    const user = await prisma.usuario.findFirst({
      where: {
        token,
      },
    });
    if (!user) {
      return next();
    } else {
      req.user = user;
      req.authenticated = true;
      return next();
    }
  }
}

function hasRole() {
  let roles = Array.from(arguments);
  return function hasRole(req, res, next) {
    if (req.user && roles.includes(req.user.rol)) return next();
    return res.status(403).json({
      error: `route only available to ${roles}.`,
    });
  };
}

const esInvitado = hasRole(roles.INVITADO);
const esCliente = hasRole(roles.CLIENTE);
const esMesero = hasRole(roles.MESERO);
const esCocinero = hasRole(roles.COCINERO);
const esAdministrador = hasRole(roles.ADMINISTRADOR);
const esRepartidor = hasRole(roles.REPARTIDOR);

const estaAutenticado = hasRole(
  roles.CLIENTE,
  roles.MESERO,
  roles.COCINERO,
  roles.ADMINISTRADOR,
  roles.REPARTIDOR
);

module.exports = {
  bearerAuth,
  hasRole,
  esInvitado,
  esCliente,
  esMesero,
  esCocinero,
  esAdministrador,
  esRepartidor,
  estaAutenticado,
};
