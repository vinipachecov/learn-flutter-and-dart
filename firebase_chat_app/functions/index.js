const functions = require("firebase-functions");
const admin = require('firebase-admin')

// require to use admin features
admin.initializeApp();

exports.myFunction = functions.firestore
    .document("chat/{message}")
    .onCreate((snapshot, context) => {
        return admin.messaging().sendToTopic('chat', {
            notification: {
                title: snapshot.data().username,
                body: snapshot.data().text,
                clickAction: 'FLUTTER_NOTIFICATION_CLICK'
            }
        }).
    //   console.log(snapshot.data());

      return;
    });
