&& Create instance TimboxWebServices
createrequestTimbrado = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimbradoMethods")
createrequestCancelacion = CREATEOBJECT("TimboxIntegracion.TimboxLib.CancelacionMethods")
helper = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxHelpers")

URL_TIMBRADO_STAGING_WDSL = "https://staging.ws.timbox.com.mx/timbrado_cfdi33/wsdl"
URL_TIMBRADO_STAGING_ACTION = "https://staging.ws.timbox.com.mx/timbrado_cfdi33/action"
URL_CANCELACION_STAGING_WSDL = "https://staging.ws.timbox.com.mx/cancelacion/wsdl"
URL_CANCELACION_STAGING_ACTION = "https://staging.ws.timbox.com.mx/cancelacion/action"

&& Create a object config type TimboxWebServicesData
config = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxWebServicesData")

&& Set only static config params
&& Username & Password
config.username = "AAA010101000"
config.password = "h6584D56fVdBbSmmnB"

&& cer.pem file & key.pem file
config.cert_pem = Filetostr("C:\Users\Current User\Your Files\File.pem")
config.llave_pem = Filetostr("C:\Users\Current User\Your Files\File.key.pem")

&&  Set the method to test
timbox_method = "cancelar_cfdi"
DO CASE
CASE timbox_method = "timbrar_cfdi"

	archivo = Filetostr("C:\Users\Current User\Your Files\ejemplo_cfdi_33.xml")
	&& Convert xml to base64
	xml = STRCONV(archivo, 13)
	config.xml = xml 

	envelope = createrequestTimbrado.timbrar_cfdi(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
	
CASE timbox_method = "timbrar_cfdi_referencia"

	archivo = Filetostr("C:\Users\raul\Desktop\timbox-.net\ejemplo-.net\Archivos\ejemplo_cfdi_33.xml")
	&& Convert xml to base64
	xml = STRCONV(archivo, 13)
	config.xml = xml 
	config.external_id = "9090909090090"

	envelope = createrequestTimbrado.timbrar_cfdi_referencia(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
	
CASE timbox_method = "timbrar_zip"
	config.zipbase64 = ""

	envelope = createrequestTimbrado.timbrar_zip(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
	
CASE timbox_method = "buscar_cfdis"

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

CASE timbox_method = "buscar_acuse_recepcion"

	uuid_buscar = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxUuid")
	uuid_buscar.uuid = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"

	config.uuid = uuid_buscar
	config.fecha_timbrado_inicio = ""
	config.fecha_timbrado_fin = ""
                   
	envelope = createrequestTimbrado.buscar_acuse_recepcion(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
	
CASE timbox_method = "recuperar_comprobante"

	uuid_recuperar = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxUuid")
	uuid_recuperar.uuid = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"

	config.uuid = uuid_recuperar

	envelope = createrequestTimbrado.recuperar_comprobante(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
	
CASE timbox_method = "recuperar_comprobante_referencia"

	recuperar_externals = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxExternal")
	recuperar_externals.external_id = "9090909090090"

	config.external = recuperar_externals

	envelope = createrequestTimbrado.recuperar_comprobante_referencia(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)

CASE timbox_method = "obtener_consumo"

	envelope = createrequestTimbrado.obtener_consumo(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
	
CASE timbox_method = "consulta_rfc"

	config.rfc = "AAA010101AAA"

	envelope = createrequestTimbrado.consulta_rfc(config)
	request  = helper.request(URL_TIMBRADO_STAGING_WDSL, URL_TIMBRADO_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)

    && TEST TYPE_CANCELACION
CASE timbox_method = "cancelar_cfdi"

	config.rfc_emisor = "AAA010101AAA"

	folio_cancelar = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxFolio")
	folio_cancelar.uuid  = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
	folio_cancelar.total = "7261.60"
	folio_cancelar.rfc_receptor = "IAD121214B34"
	config.folio = folio_cancelar 

	envelope = createrequestCancelacion.cancelar_cfdi(config)
	request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)

CASE timbox_method = "consultar_estatus"

	config.rfc_emisor = "AAA010101AAA"
	config.rfc_receptor = "IAD121214B34"
	config.uuid_id = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
	config.total = "7261.60"
                   
	envelope = createrequestCancelacion.consultar_estatus(config)
	request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)

CASE timbox_method = "consultar_documento_relacionado"
     config.uuid_id = "6E5BC378-6EDE-461F-8ABB-F941E19DF4D6"
      config.rfc_receptor = "AAA010101AAA"

	envelope = createrequestCancelacion.consultar_documento_relacionado(config)
	request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)

CASE timbox_method = "consultar_peticiones_pendientes"
	config.rfc_receptor = "AAA010101AAA"
                   
	envelope = createrequestCancelacion.consultar_peticiones_pendientes(config)
	request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)

CASE timbox_method = "procesar_respuesta"

 	config.rfc_receptor = "AAA010101AAA"
 	
	folio_respuesta = CREATEOBJECT("TimboxIntegracion.TimboxLib.TimboxRespuesta")
	folio_respuesta.uuid  = "406F17E0-C70B-48C3-BF82-5B2C72D0BCEE"
	folio_respuesta.total = "7261.60"
	folio_respuesta.rfc_emisor = "AAA010101AAA"
	folio_respuesta.respuesta = "A"
	config.respuesta = folio_respuesta
	
	envelope = createrequestCancelacion.procesar_respuesta(config)
	request  = helper.request(URL_CANCELACION_STAGING_WSDL, URL_CANCELACION_STAGING_ACTION, envelope)
	MESSAGEBOX(envelope)
	MESSAGEBOX(request)
                   
OTHERWISE
    MESSAGEBOX('Select timbox_method')
ENDCASE

