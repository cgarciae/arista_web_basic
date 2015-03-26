part of aristadart.general;

class JsonAccessCredentials implements auth.AccessCredentials
{
    @Field()
    @override
    JsonAccessToken accessToken;

    @Field()
    @override
    String refreshToken;

    @Field()
    @override
    List<String> scopes;
    
    JsonAccessCredentials ();
  
    JsonAccessCredentials.create (this.accessToken, this.refreshToken, this.scopes);
    
    JsonAccessCredentials.fromAccessCredentials (auth.AccessCredentials credentials)
    {
        this.accessToken = credentials.accessToken;
        this.refreshToken = credentials.refreshToken;
        this.scopes = credentials.scopes;
    }
}

class JsonAccessToken implements auth.AccessToken
{
    
    @Field()
    @override
    String data;

    @Field()
    @override
    DateTime expiry;

    @Field()
    @override
    bool get hasExpired {
        return new DateTime.now().toUtc().isAfter(expiry);
    }

    @Field()
    @override
    String type;
    
    JsonAccessToken ();
    
    JsonAccessToken.create (String this.type, String this.data, DateTime this.expiry) 
    {
        if (type == null || data == null || expiry == null) {
            throw new ArgumentError('Arguments type/data/expiry may not be null.');
        }
    
        if (!expiry.isUtc) {
            throw new ArgumentError('The expiry date must be a Utc DateTime.');
        }
    }
    
    JsonAccessToken.fromAccessToken (auth.AccessToken token)
    {
        this.type = token.type;
        this.data = token.data;
        this.expiry = token.expiry;
    }
}