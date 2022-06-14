const nodemailer = require("nodemailer");
const fs = require("fs").promises;
var hogan = require("hogan.js");

/**
 * Mailer class representa una instancia de enviador de correo.
 * @example
 * new Mailer().send({
 *  to: "davidalencia@gmail.com",
 *  subject: "otra prueba",
 *  //message: "hi",
 *  html: "utils/email/templates/confirmaCorreo.mustache",
 *  context: {
 *    username: "david",
 *  },
 *});
 */
class Mailer {
  static myemail = "findmyrestaurant@outlook.es"; //nuestro correo
  static mypass = "encuentramirestaurante1"; //nuestra contraseña
  constructor() {
    //singleton para tener una sola conexion con al servidor de correos
    if (Mailer.transport == undefined)
      Mailer.transport = nodemailer.createTransport({
        host: "smtp-mail.outlook.com", // hostname "Hotmail"
        port: 587, // port for secure SMTP
        secureConnection: false,
        tls: {
          ciphers: "SSLv3",
        },
        auth: {
          user: Mailer.myemail,
          pass: Mailer.mypass,
        },
      });
  }

  /**
   * Método para enviar un correo
   * @param {object} info
   * @param {string} info.to A quien va el correo
   * @param {string} info.subject El asunto del correo
   * @param {string?} info.message Mensaje del correo
   * @param {string?} info.html Ruta donde se encuentra el archivo en mustache
   * @param {object?} info.context Objeto con las variables del archivo mustache
   */
  async send(info) {
    //if (info.html != undefined) await this.sendTemplate(info);
    //else await this.sendMessage(info);
  }

  sendMessage({ to, subject, message }) {
    const msg = {
      from: Mailer.myemail,
      to: to,
      subject: subject,
      text: message,
    };
    return new Promise((res, rej) => {
      Mailer.transport.sendMail(msg, function (err, info) {
        if (err) return rej(err);
        res();
      });
    });
  }
  async sendTemplate({ to, subject, html, context }) {
    const mustache = (await fs.readFile(html)).toString();
    const template = hogan.compile(mustache);

    const msg = {
      from: Mailer.myemail,
      to,
      subject,
      text: "Algo salio mal",
      html: template.render(context),
    };
    return new Promise((res, rej) => {
      Mailer.transport.sendMail(msg, function (err, info) {
        if (err) return rej(err);
        res();
      });
    });
  }
}

module.exports = Mailer;
