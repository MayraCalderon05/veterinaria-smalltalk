Class {
	#name : 'Diagnostico',
	#superclass : 'Object',
	#instVars : [
		'fechaDiagnostico',
		'descripcion',
		'veterinario',
		'mascota',
		'colTratamientos'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Diagnostico class >> crearDiagnosticoConFecha: unaFecha descripcion: unaDescripcion veterinario: unMedico mascota: unaMascota [
| d |
d := self new.
d inicializarDiagnosticoConFecha: unaFecha descripcion: unaDescripcion veterinario: unMedico mascota: unaMascota .
^d
	
]

{ #category : 'propios del tipo' }
Diagnostico >> agregarTratamiento: unTratamiento [
colTratamientos add: unTratamiento 
]

{ #category : 'propios del tipo' }
Diagnostico >> calcularMontoFinal [

|montoFinal|

montoFinal := colTratamientos inject: 0 into: [ :monto :cadaTratamiento | monto + (cadaTratamiento obtenerMonto) ].

^montoFinal 
]

{ #category : 'visualizadores' }
Diagnostico >> descripcion [
^descripcion 
]

{ #category : 'modificadores' }
Diagnostico >> descripcion: unaDescripcion [
descripcion := unaDescripcion 
]

{ #category : 'propios del tipo' }
Diagnostico >> equals: otroDiagnostico [

	| rta |
	rta := false.
	((fechaDiagnostico = otroDiagnostico fechaDiagnostico)
	& (descripcion = otroDiagnostico descripcion)
	& (veterinario equals: otroDiagnostico veterinario)
	& (mascota equals: otroDiagnostico mascota)) ifTrue: [ rta := true ].
	^ rta
]

{ #category : 'visualizadores' }
Diagnostico >> fechaDiagnostico [
^fechaDiagnostico 
]

{ #category : 'inicializadores' }
Diagnostico >> inicializarDiagnosticoConFecha: unaFecha descripcion: laDescripcion veterinario: unMedico mascota: unaMascota [

	fechaDiagnostico := unaFecha.
	descripcion := laDescripcion.
	veterinario := unMedico.
	mascota := unaMascota.
	colTratamientos := OrderedCollection new.
]

{ #category : 'visualizadores' }
Diagnostico >> mascota [
^mascota 
]

{ #category : 'propios del tipo' }
Diagnostico >> perteneceA: unaMascota [

	^ mascota equals: unaMascota
]

{ #category : 'propios del tipo' }
Diagnostico >> registrarNuevoTratamiento: unTratamiento [

	| exito |
	exito := false.
	(unTratamiento esValido) ifTrue: [
		colTratamientos add: unTratamiento.
		exito := true ].
	^ exito
]

{ #category : 'visualizadores' }
Diagnostico >> tratamientos [
^colTratamientos 
]

{ #category : 'visualizadores' }
Diagnostico >> veterinario [
^veterinario 
]
