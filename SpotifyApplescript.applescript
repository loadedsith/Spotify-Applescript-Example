---
-- This AppleScript program shows how to manipulate and pull application and 
-- track specific information from Spotify. 
--
-- This script has no real value as is. It should be used as an example
-- to build a custom application that serves an actual purpose (example:
-- interfacing with GeekTools)
--
-- Author: Josh Grochowski (josh at kastang dot com)
---

set response to display dialog "Choose an Example:" buttons {"Current Track Info", "Manipulate Spotify", "Display Spotify App Info"} with title {"Spotify Applescript Example"}

if button returned of response is "Current Track Info" then
	displayTrackInformation()
else if button returned of response is "Manipulate Spotify" then
	manipulateSpotify()
else if button returned of response is "Display Spotify App Info" then
	displayApplicationInformation()
end if

---
-- This function manipulates Spotify. If this function is called, the user will
-- be prompted with an option to play, pause, select the next track, or select
-- the previous track within Spotify
---
on manipulateSpotify()
	
	set action to ""
	repeat while action is not equal to {"Quit"}
		
		set actionList to {"Play Track", "Pause Track", "Next Track", "Previous Track", "Quit Example"}
		set action to choose from list actionList with prompt "Choose an Option:"
		
		if action is "Quit Example" then
			--close
		else if action is {"Play Track"} then
			tell application "Spotify" to play
		else if action is {"Pause Track"} then
			tell application "Spotify" to pause
		else if action is {"Next Track"} then
			tell application "Spotify" to next track
		else if action is {"Previous Track"} then
			tell application "Spotify" to previous track
		end if
	end repeat
	
end manipulateSpotify

---
-- What this function displays:
-- Sound volume set within spotify (0-100)
-- The current state of a song in Spotyify (play, paused, or stopped)
-- The current position of the current song (seconds)
-- Is repeating enabled? (true, false)
-- Is shuffling enabled? (true, false)
---
on displayApplicationInformation()
	tell application "Spotify"
		
		--the sound volume set in Spotify (0-100)
		set a_sndvol to sound volume
		
		--stopped, playing, or paused
		set a_playstate to player state
		
		--the curret position (in seconds) of the current song playing
		set a_playpos to player position
		
		--is repeating enabled or disabled (boolean value)
		set a_repeat to repeating
		
		--is shuffling enabled or disabled (boolean value)
		set a_shuffle to shuffling
	end tell
	
	display dialog "
	Sound Volume: " & a_sndvol & "
	Player State: " & a_playstate & "
	Player Position: " & a_playpos & "
	Repeating: " & a_repeat & "
	Shuffling: " & a_shuffle
	
	
end displayApplicationInformation

---
-- What this function displays:
-- Artist, Album, Disc Number, Duration, Play Count, Track Number, Popularity,
-- Id, name, artwork, album artist, and url of the current track. Also displays
-- if the current track is starred. 
---
on displayTrackInformation()
	tell application "Spotify"
		set t_artist to artist of current track
		set t_album to album of current track
		set t_discnum to disc number of current track
		set t_duration to duration of current track
		set t_playcount to played count of current track
		set t_tracknumber to track number of current track
		set t_starred to starred of current track
		set t_popularity to popularity of current track
		set t_id to id of current track
		set t_name to name of current track
		set t_artwork to artwork of current track
		set t_albartist to album artist of current track
		set t_url to spotify url of current track
	end tell
	
	display dialog "
	Artist: " & t_artist & "
	Album: " & t_album & "
	Disc Number: " & t_discnum & "
	Duration: " & t_duration & "
	Play Count: " & t_playcount & "
	Track Number: " & t_tracknumber & "
	Is Starred: " & t_starred & "
	Popularity: " & t_popularity & "
	Track Id: " & t_id & "
	Track Name: " & t_name & "
	Album Artist: " & t_albartist & "
	URL: " & t_url
	
end displayTrackInformation
