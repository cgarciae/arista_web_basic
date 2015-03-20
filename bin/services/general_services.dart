part of aristadart.server;


@app.Route('/query/:collection', methods: const [app.POST])
@Private(ADMIN)
@Catch()
queryCollection (@app.Body(app.JSON) Map query, String collection)
{
    return db.collection (collection)
            .find(query)
            .toList();
}
