library aristadart.client;

//Dependencies
import 'dart:convert';
import 'dart:async';
import 'dart:html' as dom;

import 'package:GestionSystem/arista.dart';
import 'package:redstone_mapper/mapper.dart';
import 'package:angular/angular.dart';
import "package:googleapis_auth/auth_browser.dart" as auth;
import 'package:googleapis/oauth2/v2.dart' as oauth;

//Components
//part 'components/main_controller.dart';
//part 'components/evento/evento.dart';
//part 'components/widgets/loader/loader.dart';
//part 'components/widgets/acordeon/acordeon.dart';
//part 'components/widgets/titulo_dinamico/titulo_dinamico.dart';
//part 'components/vista/vista.dart';
//part 'components/vista/construccion_ra/construccion_ra.dart';
//part 'components/login/login.dart';
//part 'components/login/nuevo_usuario.dart';
//part 'components/home/home.dart';
//part 'components/admin/admin.dart';
//part 'components/admin/model.dart';
//part 'components/admin/target.dart';
part 'routing/router.dart';

//Services
//part 'services/client_file_services.dart';
//part 'services/client_user_services.dart';
//part 'services/client_evento_services.dart';
//part 'services/client_objeto_unity_services.dart';
//part 'services/client_cloud_target_services.dart';
//part 'services/client_local_target_services.dart';
//part 'services/client_vista_services.dart';
//part 'services/core/client_service.dart';
//part 'services/core/requester.dart';

/////////////////
//PROPERTIES
/////////////////
dom.Storage get storage => dom.window.localStorage;
bool get loggedIn => notNullOrEmpty(userId);
bool get loggedAdmin => storage['admin'] == true.toString();
set loggedAdmin (bool value) => storage['admin'] = value.toString();
String get userId => storage['userId'];
set userId (String id) => storage['userId'] = id;

/////////////////
//FUNCTIONS
/////////////////

logout ()
{
    storage.remove('userId');
    storage.remove('admin');
}

printReqError (e, s) => print ("${e.target.responseText}\n$s");
ifProgEvent (e) => e is dom.ProgressEvent;

String appendRequestParams (String path, Map<String,dynamic> params)
{
    path += '?';
    for (String key in params.keys)
    {
        path += '${key}=${Uri.encodeQueryComponent(params[key].toString())}&';
    }
    return path;
}



dom.FormElement getFormElement (dom.MouseEvent event)
    => (event.target as dom.ButtonElement).parent as dom.FormElement;



