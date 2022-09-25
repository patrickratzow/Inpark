/* eslint-disable linebreak-style */
import axios from "axios";
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as https from "https";

admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
// https://requestinspector.com/p/01g95hxxtjsec8w7gkhwqxvxm7
// https://localhost:5000

// eslint-disable-next-line max-len
exports.notifyAPIAboutUserCreation = functions.auth.user().onCreate(async (user) => {
  try {
    await axios({
      method: "post",
      url: "/user",
      baseURL: "https://a994-212-112-151-199.eu.ngrok.io",
      headers: {
        "X-Tenant": "99348443-55F7-4104-83CB-031D29D95A14",
      },
      httpsAgent: new https.Agent({
        rejectUnauthorized: false,
      }),
      data: {
        displayName: user.displayName,
        email: user.email,
        userId: user.uid,
        providers: user.providerData,
      },
    });
  } catch (err) {
    console.error(err);
    return err;
  }
});
