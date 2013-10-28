module.exports =
    development:
        db: 'mongodb://localhost/twf'
        app:
            name: 'twf'

        facebook:
            clientID: "clientID"
            clientSecret: "clientSecret"
            callbackURL: "http://localhost:3000/auth/facebook/callback"


      production:
        db: process.env.MONGOLAB_URI || process.env.MONGOHQ_URL
        app:
            name: 'twf'

        facebook:
            clientID: "clientID"
            clientSecret: "clientSecret"
            callbackURL: "{{production callbackURL}}"
