importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyCIhRlsy_78IcVjPWUeYcIpCf35G0e_d5E",
  authDomain: "flutter-base-a428c.firebaseapp.com",
  projectId: "flutter-base-a428c",
  storageBucket: "flutter-base-a428c.appspot.com",
  messagingSenderId: "590499560296",
  appId: "1:590499560296:web:ab7a44902781a3e33674dd"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});