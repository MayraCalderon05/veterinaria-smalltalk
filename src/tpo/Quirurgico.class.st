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

{ #category : 'constructores' }
Quirurgico class >> crearTratQuirurgicoConFecha: unaFecha motivo: unMotivo nombreProcedimiento: unNombre nivelRiesgo: unNivel tipoAnestesia: unTipo [

	| t |
	self inicializarTablas.
	self inicializarCostoBase .
	t := self new.
	t inicializarTratamientoConFecha: unaFecha motivo: unMotivo.
	t
		inicializarQuirurgicoConNombreProcedimiento: unNombre
		nivelRiesgo: unNivel
		tipoAnestesia: unTipo.
	^ t
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
