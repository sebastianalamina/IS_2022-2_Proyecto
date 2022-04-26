const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = exists =
  (collection) =>
  async ({ body }) => {
    let count = await prisma[collection].count({
      where: body,
    });
    if (count == 0)
      throw new Error(
        `Hay 0 ${collection}s con: ${JSON.stringify(body, null, 2)}`
      );
  };
