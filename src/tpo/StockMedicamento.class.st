Class {
	#name : 'StockMedicamento',
	#superclass : 'Object',
	#instVars : [
		'cantidad',
		'medicamento'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
StockMedicamento class >> crearStockMedicamentoConCantidad: unaCantidad medicamento: unMedicamento [
|sm|
sm := self new.
sm 
inicializarStockMedicamentoConCantidad: unaCantidad 
medicamento: unMedicamento.
^sm
]

{ #category : 'propios del tipo' }
StockMedicamento >> aumentarCantidad: unaCantidad [
cantidad := cantidad + unaCantidad 
]

{ #category : 'visualizadores' }
StockMedicamento >> cantidad [
^cantidad 
]

{ #category : 'modificadores' }
StockMedicamento >> cantidad: unaCantidad [
cantidad := unaCantidad 
]

{ #category : 'propios del tipo' }
StockMedicamento >> encontrarMedicamento: unMedicamento [
^medicamento equals: unMedicamento .
]

{ #category : 'inicializadores' }
StockMedicamento >> inicializarStockMedicamentoConCantidad: unaCantidad medicamento: unMedicamento [
cantidad := unaCantidad.
medicamento := unMedicamento.
]

{ #category : 'visualizadores' }
StockMedicamento >> medicamento [

	^ medicamento 
]
