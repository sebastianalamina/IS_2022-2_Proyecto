const { PrismaClient } = require("@prisma/client");

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
      return res.status(400).json({ error: "Invalid token" });
    } else {
      req.user = user;
      req.authenticated = true;
      return next();
    }
  }
}
