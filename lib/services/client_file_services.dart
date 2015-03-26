part of aristadart.client;

@Injectable()
class ClientFileServices extends ClientService<FileDb>
{
    ClientFileServices () : super ("file");
  
    Future<FileDb> New (dom.FormElement form, 
                        {String type, String system})
    {
        
        Map<String, String> params = {};
        
        if (type != null)
            params['type'] = type;
        
        if (system != null)
            params['system'] = system;
        
        return Requester.privateForm
        (
            FileDb,
            Method.POST,
            pathBase,
            form,
            params: params
        );
    }
    
    Future<FileDb> GetMetadata (String id)
    {
        if (href == null)
            throw new ArgumentError.notNull ("Client Error: href es null");
        
        return Requester.decoded
        (
            FileDb,
            Method.GET,
            href (id) + '/metadata'
        );
    }
    
    Future<FileDb> UpdateFile (String id, dom.FormElement form)
    {
        if (href == null)
            throw new ArgumentError.notNull ("Client Error: href es null");
        
        return Requester.privateForm
        (
            FileDb,
            Method.PUT,
            href(id),
            form
        );
    }
}