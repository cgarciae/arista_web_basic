part of aristadart.client;

@Injectable()
class ClientUserServices extends ClientService<User>
{
    ClientUserServices () : super ("user");
    
    Future<User> NewOrLogin (User user)
    {
        return json (Method.POST, pathBase, user);
    }
    
    Future<BoolResp> IsAdmin (String id)
    {
        return Requester.private (BoolResp, Method.GET, '${href(id)}/isAdmin');
    }
}