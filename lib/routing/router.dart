part of aristadart.client;

const String loginRoute = "view/login_view.html";


void recipeBookRouteInitializer(Router router, RouteViewFactory view) 
{
    
    ifLoggedIn (String route)
    {
        return (RouteEnterEvent e)
        {
            if (loggedIn)
            {
                view (route) (e);
            }
            else
            {
                router.go
                (
                    'login', {},
                    forceReload: true
                );
            }
        };
    }
    
    ifAdmin (String route)
    {
        return (RouteEnterEvent e)
        {
            if (loggedAdmin)
            {
                view (route) (e);
            }
            else
            {
                router.go
                (
                    'home', {},
                    forceReload: true
                );
            }
        };
    }
    
    view.configure
    ({
        
        
    });
} 


