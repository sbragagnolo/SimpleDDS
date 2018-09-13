implemented
unregisterSubscriber: aCallerId from: aTopicName andCallerUri: anUri
	| topic participant ret |
	topic := domain topicDescriptorFor: aTopicName.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	[ 
	topic subscriber unsubscribe: participant.
	ret := 1 ]
		on: Error
		do: [ ret := 0 ].
	^ ret