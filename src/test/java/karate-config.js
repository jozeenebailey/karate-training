function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    apiUrl: 'https://conduit.productionready.io/api/'
  }
  if (env == 'dev') {
    // user 1
    config.userEmail = 'karatebailey@test.com'
    config.userPassword = 'KarateTesting'
  }

  if (env == 'e2e') {
    // user 2

  }

  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
}
