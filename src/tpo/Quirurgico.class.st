Class {
	#name : 'Quirurgico',
	#superclass : 'Tratamiento',
	#instVars : [
		'nombreProcedimiento',
		'nivelRiesgo',
		'tipoAnestesia'
	],
	#classInstVars : [
		'tablaDeRiesgo',
		'tablaDeAnestesia'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'propios del tipo' }
Quirurgico class >> agregarNivelRiesgo: unNivel porcentajeAumento: unAumento [
|exito|
exito := false.
( self existeNivelRiesgo: unNivel ) ifFalse: [ tablaDeRiesgo at: unNivel put: unAumento. exito:= true ].
^exito 
]

{ #category : 'propios del tipo' }
Quirurgico class >> agregarTipoAnestesia: unTipo conCosto: unPrecio [

	| exito |
	exito := false.
	(self existeTipoAnestesia: unTipo) ifFalse: [
		tablaDeAnestesia at: unTipo asString put: unPrecio.
		exito := true ].
	^ exito
]

{ #category : 'constructores' }
Quirurgico class >> crearTratQuirurgicoConFecha: unaFecha motivo: unMotivo nombreProcedimiento: unNombre nivelRiesgo: unNivel tipoAnestesia: unTipo [

	| t |
	self inicializarTablas.
	self inicializarCostoBase.
	t := self new.
	t inicializarTratamientoConFecha: unaFecha motivo: unMotivo.
	t
		inicializarQuirurgicoConNombreProcedimiento: unNombre
		nivelRiesgo: unNivel
		tipoAnestesia: unTipo.
	^ t
]

{ #category : 'propios del tipo' }
Quirurgico class >> eliminarNivelRiesgo: unNivel [

	^ tablaDeRiesgo removeKey: unNivel
]

{ #category : 'propios del tipo' }
Quirurgico class >> eliminarTipoAnestesia: unTipo [

	^ tablaDeAnestesia removeKey: unTipo asString
]

{ #category : 'propios del tipo' }
Quirurgico class >> existeNivelRiesgo: unNivel [

	^ tablaDeRiesgo includesKey: unNivel.
]

{ #category : 'propios del tipo' }
Quirurgico class >> existeTipoAnestesia: unTipo [

	^ tablaDeAnestesia includesKey: unTipo asString
]

{ #category : 'inicializadores' }
Quirurgico class >> inicializarTablas [

	tablaDeAnestesia ifNil: [
		tablaDeAnestesia := Dictionary new.
		tablaDeAnestesia
			at: 'Local' put: 30000;
			at: 'Regional' put: 60000;
			at: 'General' put: 100000 ].
		
	tablaDeRiesgo ifNil: [
		tablaDeRiesgo := Dictionary new.
		tablaDeRiesgo
			at: 1 put: 10;
			at: 2 put: 20 ]
]

{ #category : 'propios del tipo' }
Quirurgico class >> modificarNivelRiesgo: unNivel porcentajeAumento: unAumento [

	| exito |
	exito := false.
	(self existeNivelRiesgo: unNivel) ifTrue: [
		tablaDeRiesgo at: unNivel put: unAumento.
		exito := true ].
	^ exito
]

{ #category : 'propios del tipo' }
Quirurgico class >> modificarUnTipoAntestesia: unTipo conCosto: unPrecio [

	| exito |
	exito := false.
	(self existeTipoAnestesia: unTipo) ifTrue: [
		tablaDeAnestesia at: unTipo asString put: unPrecio.
		exito := true ].
	^ exito
]

{ #category : 'propios del tipo' }
Quirurgico class >> obtenerMontoAnestesiaDelTipoAnestesia: tipoAnestesia [
	|costo|
	
costo := 0.

tablaDeAnestesia at: tipoAnestesia ifPresent: [ :valor | costo := valor ].

^costo 
]

{ #category : 'propios del tipo' }
Quirurgico class >> obtenerValorAumentoRiesgoDeNivel: unNivel delMonto: unMonto [

	| valor |
	valor := 0.
	tablaDeRiesgo
		at: unNivel
		ifPresent: [ :porcentaje | valor := (unMonto * porcentaje)/100 ].
	^ valor
]

{ #category : 'visualizadores' }
Quirurgico class >> tablaDeAnestesia [

	^ tablaDeAnestesia
]

{ #category : 'visualizadores' }
Quirurgico class >> tablaDeRiesgo [

	^ tablaDeRiesgo
]

{ #category : 'propios del tipo' }
Quirurgico >> esValido [

	| validez |
	validez := false.
	((super esValido) & (nivelRiesgo = 2) & (tipoAnestesia = 'General'))
		ifTrue: [ validez := true ].
	^ validez
]

{ #category : 'inicializadores' }
Quirurgico >> inicializarQuirurgicoConNombreProcedimiento: unNombre nivelRiesgo: unNivel tipoAnestesia: elTipoAnestesia [
nombreProcedimiento := unNombre .
nivelRiesgo := unNivel .
tipoAnestesia := elTipoAnestesia .
]

{ #category : 'visualizadores' }
Quirurgico >> nivelRiesgo [
^nivelRiesgo 
]

{ #category : 'modificadores' }
Quirurgico >> nivelRiesgo: elNivel [
nivelRiesgo := elNivel .
]

{ #category : 'visualizadores' }
Quirurgico >> nombreProcedimiento [
^nombreProcedimiento 
]

{ #category : 'modificadores' }
Quirurgico >> nombreProcedimiento: elNombre [
nombreProcedimiento := elNombre 
]

{ #category : 'propios del tipo' }
Quirurgico >> obtenerMonto [

	| monto valor costo |
	monto := super obtenerMonto.
	valor := self class
		         obtenerValorAumentoRiesgoDeNivel: nivelRiesgo delMonto: monto.
	costo := self class obtenerMontoAnestesiaDelTipoAnestesia:
		         tipoAnestesia.

	^ monto + valor + costo
]

{ #category : 'visualizadores' }
Quirurgico >> tipoAnestesia [
^tipoAnestesia 
]

{ #category : 'modificadores' }
Quirurgico >> tipoAnestesia: elTipo [
tipoAnestesia := elTipo 
]
