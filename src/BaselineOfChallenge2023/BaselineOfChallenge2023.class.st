Class {
	#name : #BaselineOfChallenge2023,
	#superclass : #BaselineOf,
	#category : #BaselineOfChallenge2023
}

{ #category : #baselines }
BaselineOfChallenge2023 >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec package: 'Challenge2023'.
		spec group: 'default' with: #('Challenge2023').
		 ].
]
