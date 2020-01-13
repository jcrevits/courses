const sgMail = require('@sendgrid/mail');
const keys = require('../config/keys');

async function sendMail({ subject, recipients }, content) {
  sgMail.setApiKey(keys.sendGridKey);

  msg = {
    from: 'no-reply@emaily.com',
    to: recipients,
    subject,
    html: content,
    tracking_settings: {
      click_tracking: { enable: true, enable_text: true },
      open_tracking: { enable: true },
    },
  };

  await sgMail.send(msg);
}

module.exports = sendMail;
