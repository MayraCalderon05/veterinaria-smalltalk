Class {
	#name : 'Vacunacion',
	#superclass : 'Object',
	#instVars : [
		'fechaVacunacion',
		'veterinario',
		'mascota',
		'vacuna'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Vacunacion class >> crearVacunacionConFecha: unaFecha veterinario: unMedico mascota: unaMascota vacuna: unaVacuna [

	| v |
	v := self new.
	v inicializarVacunacionConFecha: unaFecha veterinario: unMedico mascota: unaMascota unaVacuna: unaVacuna .
	^ v
]

{ #category : 'propios del tipo' }
Vacunacion >> contieneVacuna: unaVacuna [

	^ (vacuna equals: unaVacuna)
]

{ #category : 'propios del tipo' }
Vacunacion >> descripcionTextual [

	^ 'VACUNACIÓN', String lf,'Fecha de vacunacion: ' , fechaVacunacion printString , String lf
	  , 'Veterinario: ' , veterinario nombre asString , String lf
	  , 'Vacuna: ' , vacuna nombreVacuna asString , String lf
]

{ #category : 'propios del tipo' }
Vacunacion >> esMasRecienteQue: vacunacionMasReciente [
| rta |
rta := false.
((vacunacionMasReciente fechaMasViejaQue: fechaVacunacion) | (vacunacionMasReciente isNil)) ifTrue: [ rta := true ].
^rta 
]

{ #category : 'propios del tipo' }
Vacunacion >> esVigente [
|fechaLimite fechaHoy|

fechaLimite := (vacuna mesesDeVigencia) + fechaVacunacion.
fechaHoy := Date today.
^ fechaHoy <= fechaLimite.
]

{ #category : 'propios del tipo' }
Vacunacion >> fechaMasViejaQue: otraFechaVacunacion [

	^ (fechaVacunacion <= otraFechaVacunacion)
]

{ #category : 'visualizadores' }
Vacunacion >> fechaVacunacion [
^fechaVacunacion 
]

{ #category : 'inicializadores' }
Vacunacion >> inicializarVacunacionConFecha: unaFecha veterinario: unMedico mascota: unaMascota unaVacuna: unaVacuna [

fechaVacunacion := unaFecha .
veterinario := unMedico .
mascota := unaMascota .
	vacuna := unaVacuna
]

{ #category : 'visualizadores' }
Vacunacion >> mascota [

	^ mascota
]

{ #category : 'propios del tipo' }
Vacunacion >> perteneceA: unaMascota [

	^ mascota equals: unaMascota

]

{ #category : 'visualizadores' }
Vacunacion >> vacuna [
^vacuna 
]

{ #category : 'visualizadores' }
Vacunacion >> veterinario [ 
^veterinario 
]
