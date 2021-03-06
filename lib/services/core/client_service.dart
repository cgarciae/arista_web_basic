part of aristadart.client;

abstract class ClientService<T extends Ref>
{
    final String pathBase;
    
    ClientService (this.pathBase);
    
    String href (String id) => '$pathBase/$id';
    
    
    ////////////////
    //BASIC METHODS
    ////////////////
    
    Future<T> NewGeneric ({Map queryParams})
    {
        return private
        (
            Method.POST,
            pathBase,
            params: queryParams
        );
    }
    
    Future<T> GetGeneric (String id, {Map queryParams})
    {
        return private
        (
            Method.GET,
            href(id),
            params: queryParams
        );
    }
    
    Future<T> UpdateGeneric (String id, T delta, {Map queryParams})
    {
        return privateJson
        (
            Method.PUT,
            href(id),
            delta,
            params: queryParams
        );
    }
    
    Future<Ref> DeleteGeneric (String id, {Map queryParams})
    {
        return Requester.private
        (
            Ref,
            Method.DELETE,
            href(id),
            params: queryParams
        );
    }
    
    Future AllGeneric (Type type, {Map queryParams})
    {
        return Requester.private
        (
            type,
            Method.GET,
            '$pathBase/all',
            params: queryParams
        );
    }
    
    ////////////////
    //Requests
    ////////////////
    
    Future<T> decoded (String method, String path, {dynamic data, 
        Map headers, void onProgress (dom.ProgressEvent p), 
        String userId, Map<String,String> params})
    {
        return Requester.decoded
        (
            T, method, path, data: data, headers: headers,
            onProgress: onProgress, userId: userId, params: params
        );
    }
    
    Future<T> private (String method, String path, {dynamic data, 
                            Map headers, void onProgress (dom.ProgressEvent p), 
                            Map<String,String> params})                      
    {
        return Requester.private
        (
            T, method, path, data: data, headers: headers,
            onProgress: onProgress, params: params
        );
    }
    
    Future<T> form (String method, String path, dom.FormElement form, {Map headers, 
                            void onProgress (dom.ProgressEvent p), String userId,
                            Map<String,String> params})
    {
        return Requester.form
        (
            T, method, path, form, headers: headers,
            onProgress: onProgress,userId: userId,
            params: params
        );
    }
    
    Future<T> privateForm (String method, String path, dom.FormElement form, {Map headers, 
                            void onProgress (dom.ProgressEvent p),
                            Map<String,String> params})
    {
        return this.form 
        (
           method, path, form, headers: headers,
           onProgress: onProgress, params: params,
           userId: userId 
        );
    }
    
    Future<T> json (String method, String path, T obj, 
                    {Map headers, void onProgress (dom.ProgressEvent p), 
                    String userId, Map<String,String> params})
    {   
        return Requester.json
        (
            T, method, path, obj, headers: headers,
            onProgress: onProgress, userId: userId,
            params: params
        );
    }
    
    Future<T> privateJson (String method, String path, T obj, 
                                    {Map headers, void onProgress (dom.ProgressEvent p), 
                                    Map<String,String> params})
    {   
        return json
        (
            method, path, obj, headers: headers,
            onProgress: onProgress, params: params,
            userId: userId
        );
    }
}