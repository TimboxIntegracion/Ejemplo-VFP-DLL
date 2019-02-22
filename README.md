# Visual FoxPro 9.0
Una vez agregada la libreria y registrada correctamente se utilisa como se muestra acontinuacion.

## Timbrado
Para utilisar los metodos de timbrado es necesario crear una instancia de la clase TimbradoMethods y de la clase TimboxHelpers la cual nos permite realizar el request de la siguiente manera:
 
````
createrequestTimbrado = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimbradoMethods")
helper = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxHelpers")
````
Se configurar el entorno donde se realizara la peticion:
````
URL_TIMBRADO_STAGING_WDSL = "https://staging.ws.timbox.com.mx/timbrado_cfdi33/wsdl"
URL_TIMBRADO_STAGING_ACTION = "https://staging.ws.timbox.com.mx/timbrado_cfdi33/action"
````
Para la utilizacion de cualquier metodo bede haber una configuracion previa, la cual contiene los datos con los que se realizara la peticion: 

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")
````

### Timbrar CFDI
Para utilizar el methodo de timbrar_cfdi de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"

archivo = Filetostr("C:\Users\Current User\Your Files\ejemplo_cfdi_33.xml")
xml = STRCONV(archivo, 13)
config.xml = xml 

envelope = createrequestTimbrado.timbrar_cfdi(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````

### Timbrar CFDI Referencia
Para utilizar el methodo de timbrar_cfdi_referencia de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"

archivo = Filetostr("C:\Users\raul\Desktop\timbox-.net\ejemplo-.net\Archivos\ejemplo_cfdi_33.xml")
xml = STRCONV(archivo, 13)
config.xml = xml 
config.external_id = "9090909090090"

envelope = createrequestTimbrado.timbrar_cfdi_referencia(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
### Timbrar ZIP
Para utilizar el methodo de timbrar_zip de nuestro web services se debera realizar la siguiente configuracion:
````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"

config.zipbase64 = ""

envelope = createrequestTimbrado.timbrar_zip(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
### Buscar CFDIs
Para utilizar el methodo de buscar_cfdis de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
config.rfc_emisor = ""
config.rfc_receptor = ""
config.fecha_emision_inicio = ""
config.fecha_emision_fin = ""
config.fecha_timbrado_inicio = ""
config.fecha_timbrado_fin = ""
config.cancelado = ""
config.external_id = ""
config.uuid_id = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
config.folioid = ""
config.serie = ""
config.limit = ""
config.offset = ""
   
envelope = createrequestTimbrado.buscar_cfdis(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
### Buscar Acuse Recepcion
Para utilizar el methodo de buscar_acuse_recepcion de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"

uuid_buscar = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxUuid")
uuid_buscar.uuid = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
config.uuid = uuid_buscar
config.fecha_timbrado_inicio = ""
config.fecha_timbrado_fin = ""
                   
envelope = createrequestTimbrado.buscar_acuse_recepcion(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
### Recuperar Comprobante
Para utilizar el methodo de recuperar_comprobante de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
uuid_recuperar = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxUuid")
uuid_recuperar.uuid = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
config.uuid = uuid_recuperar

envelope = createrequestTimbrado.recuperar_comprobante(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````

### Recuperar Comprobante Referencia
Para utilizar el methodo de recuperar_comprobante_referencia de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
recuperar_externals = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxExternal")
recuperar_externals.external_id = "9090909090090"

config.external = recuperar_externals

envelope = createrequestTimbrado.recuperar_comprobante_referencia(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````

### Obtener Consumo
Para utilizar el methodo de obtener_consumo de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"

envelope = createrequestTimbrado.obtener_consumo(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)

````

### Consultar RFC
Para utilizar el methodo de consulta_rfc de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
config.rfc = "AAA010101AAA"

envelope = createrequestTimbrado.consulta_rfc(config)
request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````

## Cancelacion
Para utilisar los metodos de cancelacion es necesario crear una instancia de la clase CancelacionMethods y de la clase TimboxHelpers la cual nos permite realizar el request de la siguiente manera:
 
````
createrequestCancelacion = CREATEOBJECT("TimboxIntegracion.TimboxLib.CancelacionMethods")
helper = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxHelpers")
````

Se configurar el entorno donde se realizara la peticion:
````
URL_CANCELACION_STAGING_WSDL = "https://staging.ws.timbox.com.mx/cancelacion/wsdl"
URL_CANCELACION_STAGING_ACTION = "https://staging.ws.timbox.com.mx/cancelacion/action"
````
Para la utilizacion de cualquier metodo bede haber una configuracion previa la cual contiene los datos con los cuales se realizara una peticion: 

````
  config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")
````

### Cancelar CFDI
Para utilizar el methodo de cancelar_cfdi de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"            
config.rfc_emisor = "AAA010101AAA"

folio_cancelar = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxFolio")
folio_cancelar.uuid  = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
folio_cancelar.total = "7261.60"
folio_cancelar.rfc_receptor = "IAD121214B34"
config.folio = folio_cancelar 
config.cert_pem = Filetostr("C:\Users\Current User\Your Files\File.cer.pem")
config.llave_pem = Filetostr("C:\Users\Current User\Your Files\File.key.pem")

envelope = createrequestCancelacion.cancelar_cfdi(config)
request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````

### Consultar Estatus 
Para utilizar el methodo de consultar_estatus de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
config.rfc_emisor = "AAA010101AAA"
config.rfc_receptor = "IAD121214B34"
config.uuid_id = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
config.total = "7261.60"
                   
envelope = createrequestCancelacion.consultar_estatus(config)
request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
### Consultar Documento Relacionado
Para utilizar el methodo de consultar_documento_relacionado de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
config.uuid_id = "6E5BC378-6EDE-461F-8ABB-F941E19DF4D6"
config.rfc_receptor = "AAA010101AAA"
config.cert_pem = Filetostr("C:\Users\Current User\Your Files\File.cer.pem")
config.llave_pem = Filetostr("C:\Users\Current User\Your Files\File.key.pem")

envelope = createrequestCancelacion.consultar_documento_relacionado(config)
request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
### Consultar Peticiones Pendientes
Para utilizar el methodo de consultar_peticiones_pendientes de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
config.rfc_receptor = "AAA010101AAA"
config.cert_pem = Filetostr("C:\Users\Current User\Your Files\File.cer.pem")
config.llave_pem = Filetostr("C:\Users\Current User\Your Files\File.key.pem")

envelope = createrequestCancelacion.consultar_peticiones_pendientes(config)
request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)

````
### Procesar Respuesta
Para utilizar el methodo de procesar_respuesta de nuestro web services se debera realizar la siguiente configuracion:

````
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"
 config.rfc_receptor = "AAA010101AAA"
 
folio_respuesta = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxRespuesta")
folio_respuesta.uuid  = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
folio_respuesta.total = "7261.60"
folio_respuesta.rfc_emisor = "AAA010101AAA"
folio_respuesta.respuesta = "A"
config.respuesta = folio_respuesta
config.cert_pem = Filetostr("C:\Users\Current User\Your Files\File.cer.pem")
config.llave_pem = Filetostr("C:\Users\Current User\Your Files\File.key.pem")

envelope = createrequestCancelacion.procesar_respuesta(config)
request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
MESSAGEBOX(envelope)
MESSAGEBOX(request)
````
