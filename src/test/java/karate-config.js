function fn() {
  var env = karate.env; // get system property 'karate.env'

  if (env === 'pre') {
    karate.log('ENV PRE >>>>>>>>>>>>>');
  } else if (env === 'des') {
    karate.log('ENV DES >>>>>>>>>>>>>');
  }

  var petstore = 'https://petstore.swagger.io/';
  //var petstore = karate.properties['url'];

  var config = {
    env: env,
    myVarName: 'someValue',
    petstore: petstore
  }

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}