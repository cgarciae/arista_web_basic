part of aristadart.client.tests;

runClientUserServicesTest ()
{
    group ("User Services:", ()
    {
        User user;
        ClientUserServices services = new ClientUserServices();
        
        setUp(()
        {
            user = new User()
            ..nombre = "Juan"
            ..apellido = "Perez"
            ..email = "juanperez@gmail.com";
            
           
            return services.NewOrLogin(user).then((User resp)
            {
                user = resp;
                userId = resp.id;
            });
        });
        
        tearDown(()
        {
            return services.DeleteGeneric(user.id).then((_)
            {
                logout();
            });
        });
        
        test ("Login", ()
        {
            
            return services.NewOrLogin(user).then((User _user){
            
            expect (_user.nombre, user.nombre);
            expect (_user.apellido, user.apellido);
            expect (_user.email, user.email);
            });
        });
        
        test ("Update", ()
        {
            var delta = new User ()
                ..apellido = "Garcia";
            
            return services.UpdateGeneric(user.id, delta).then((User resp){
            
            expect (resp.nombre, user.nombre);
            expect (resp.apellido, delta.apellido);
            expect (resp.email, user.email);
            });
        });
        
        test ("Is Admin", ()
        {
            
            return services.IsAdmin(user.id).then((BoolResp resp){
            
            expect (resp.value, false);
            });
        });
    });
}