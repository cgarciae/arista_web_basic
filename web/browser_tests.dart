library aristadart.client.tests;

import 'package:GestionSystem/arista.dart';
import 'package:GestionSystem/arista_client.dart';

import 'package:redstone_mapper/mapper.dart';
import 'package:redstone_mapper/mapper_factory.dart';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

part 'test/client_user_services_tests.dart';

main ()
{
    useHtmlConfiguration();
    bootstrapMapper();
    
    runClientUserServicesTest();
}

