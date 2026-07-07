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

{ #category : 'propios del tipo' }
Farmacologico >> obtenerMonto [ 
|monto|

monto := (super obtenerMonto) + ((monodroga precioBase) * dosis).

(monto > 40000) ifTrue: [ monto := monto - ((monto * 10)/10) ].

^monto 

]
