Class {
	#name : 'Medicamento',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'precioBase',
		'ventaLibre'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Medicamento class >> crearMedicamentoConNombre: unNombre precioBase: unPrecioBase ventaLibre: unaVentaLibre [

|m|
m := self new.
m 
inicializarMedicamentoConNombre: unNombre 
precioBase: unPrecioBase 
ventaLibre: unaVentaLibre.
^m 

]

{ #category : 'inicializadores' }
Medicamento >> inicializarMedicamentoConNombre: unNombre precioBase: unPrecioBase ventaLibre: unaVentaLibre [
nombre := unNombre.
precioBase := unPrecioBase.
ventaLibre := unaVentaLibre.
]

{ #category : 'visualizadores' }
Medicamento >> nombre [
^nombre 
]

{ #category : 'visualizadores' }
Medicamento >> precioBase [ 

	^ precioBase 
]

{ #category : 'modificadores' }
Medicamento >> precioBase: unPrecioBase [
precioBase := unPrecioBase 
]

{ #category : 'visualizadores' }
Medicamento >> ventaLibre [ 

	^ ventaLibre 
]

{ #category : 'modificadores' }
Medicamento >> ventaLibre: unaVentaLibre [

	ventaLibre := unaVentaLibre 
]
