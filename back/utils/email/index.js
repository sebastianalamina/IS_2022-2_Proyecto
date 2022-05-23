const nodemailer = require("nodemailer");
const fs = require("fs").promises;
var hogan = require("hogan.js");

// // construct template string
// var template = "Hello {{world}}!";

// // compile template
// var hello = hogan.compile(template);

class Mailer {
  static myemail = "findmyrestaurant@outlook.es";
  static mypass = "encuentramirestaurante1";
  constructor() {
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

  async send(info) {
    if (info.html != undefined) await this.sendTemplate(info);
    else await this.sendMessage(info);
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

new Mailer().send({
  to: "davidalencia@gmail.com",
  subject: "otra prueba",
  //message: "hi",
  //html: "<h1>hola {{username}}<h1/>",
  html: "utils/email/templates/confirmaCorreo.mustache",
  context: {
    username: "david",
  },
});
