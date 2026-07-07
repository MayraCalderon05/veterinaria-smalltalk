Class {
	#name : 'Farmacologico',
	#superclass : 'Tratamiento',
	#instVars : [
		'monodroga',
		'dosis',
		'frecuencia'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Farmacologico class >> crearTratFarmacologicoConFecha: unaFecha motivo: unMotivo monodroga: unMedicamento dosis: laDosis frecuencia: laFrecuencia [

	| t |
	self inicializarCostoBase .
	t := self new.
	t inicializarTratamientoConFecha: unaFecha motivo: unMotivo.
	t
		inicializarFarmacologicoConMonodroga: unMedicamento
		dosis: laDosis
		frencuencia: laFrecuencia.
	^ t
]

{ #category : 'visualizadores' }
Farmacologico >> dosis [
^dosis 
]

{ #category : 'modificadores' }
Farmacologico >> dosis: laDosis [
dosis := laDosis 
]

{ #category : 'propios del tipo' }
Farmacologico >> esValido [

	| validez |
	validez := true.
	(((super esValido) not) & ((monodroga esDeVentaLibre) not)) ifTrue: [
		validez := false ].
	^ validez
]

{ #category : 'visualizadores' }
Farmacologico >> frecuencia [
^frecuencia 
]

{ #category : 'modificadores' }
Farmacologico >> frecuencia: laFrecuencia [
frecuencia := laFrecuencia 
]

{ #category : 'inicializadores' }
Farmacologico >> inicializarFarmacologicoConMonodroga: unMedicamento dosis: laDosis frencuencia: laFrecuencia [
monodroga := unMedicamento .
dosis := laDosis .
frecuencia := laFrecuencia 
]

{ #category : 'visualizadores' }
Farmacologico >> monodroga [
^monodroga 
]

{ #category : 'modificadores' }
Farmacologico >> monodroga: unMedicamento [
monodroga := unMedicamento 
]
