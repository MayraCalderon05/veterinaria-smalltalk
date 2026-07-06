Class {
	#name : 'Vacuna',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'laboratorio',
		'especieDestino',
		'cantMesesVigencia'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Vacuna class >> crearVacunaConNombre: unNombre laboratorio: elLaboratorio especieDestino: laEspecie cantMesesDeVigencia: unaCant [
| v |
v := self new.
v inicializarVacunaConNombre: unNombre laboratorio: elLaboratorio especieDestino: laEspecie cantMesesDeVigencia: unaCant .
^v
]

{ #category : 'modificadores' }
Vacuna >> cantMesesVigencia: unaCant [
cantMesesVigencia := unaCant 
]

{ #category : 'visualizadores' }
Vacuna >> especieDestino [
^especieDestino 
]

{ #category : 'modificadores' }
Vacuna >> especieDestino: laEspecie [
especieDestino := laEspecie 
]

{ #category : 'inicializadores' }
Vacuna >> inicializarVacunaConNombre: unNombre laboratorio: elLaboratorio especieDestino: laEspecieDestino cantMesesDeVigencia: unaCantMeses [
nombre := unNombre .
laboratorio := elLaboratorio .
especieDestino := laEspecieDestino .
cantMesesVigencia := unaCantMeses .
]

{ #category : 'visualizadores' }
Vacuna >> laboratorio [
^laboratorio 
]

{ #category : 'modificadores' }
Vacuna >> laboratorio: elLab [
laboratorio := elLab .
]

{ #category : 'visualizadores' }
Vacuna >> mesesDeVigencia [
^cantMesesVigencia 
]

{ #category : 'visualizadores' }
Vacuna >> nombreVacuna [
^nombre 
]

{ #category : 'modificadores' }
Vacuna >> nombreVacuna: unNombre [
nombre := unNombre .
]
