#  Schema-Rundown

Podcast
- Id
- Name
- Network

PodcastEpisode
- Id
- PodcastId
- Title
- PublishDate

User
- Id

UserPocast
- Id
- UserId
- PodcastId

UserPodcastEpisode (will exist if user has started the episode or has played it completely) 
- Id
- UserPodcastId
- PickupTime

