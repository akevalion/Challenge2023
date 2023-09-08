Class {
	#name : #CInterference,
	#superclass : #Object,
	#instVars : [
		'mode',
		'position',
		'radius'
	],
	#category : #Challenge2023
}

{ #category : #initialization }
CInterference >> initialize [
	| r |
	super initialize.
	r := SharedRandom globalGenerator.
	self mode: (r next < 0.5
		ifTrue: [ #attract ]
		ifFalse: [ #reject ]).
	self radius: r next * 300
]

{ #category : #accessing }
CInterference >> mode [
	^ mode
]

{ #category : #initialization }
CInterference >> mode: aSymbol [
	mode := aSymbol
]

{ #category : #initialization }
CInterference >> position [
	^ position
]

{ #category : #initialization }
CInterference >> position: aPoint [
	position := aPoint
]

{ #category : #initialization }
CInterference >> radius [
	^ radius
]

{ #category : #initialization }
CInterference >> radius: aNumber [
	radius := aNumber
]
