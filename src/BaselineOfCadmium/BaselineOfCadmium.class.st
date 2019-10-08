Class {
	#name : #BaselineOfCadmium,
	#superclass : #BaselineOf,
	#category : #BaselineOfCadmium
}

{ #category : #baselines }
BaselineOfCadmium >> baseline: spec [
	<baseline>
	spec
		for: #common
		do:
			[ 
			spec baseline: 'ZincHTTPComponents' with: [
						spec
							loads: #('REST');
							repository: 'github://zweidenker/zinc/repository' ].
			
			spec package: 'Cadmium' with:[spec requires: #('ZincHTTPComponents')].

			spec
				group: 'core' with: #('Cadmium');
				group: 'default' with: #('core')
			]
]
