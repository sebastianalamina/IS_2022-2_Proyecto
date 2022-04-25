const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = exists =
  (collection) =>
  async ({ body }) => {
    let count = await prisma[collection].count({
      where: body,
    });
    if (count == 0)
      throw new Error(`${collection} with ${JSON.stringify(q)} has 0 elements`);
  };
