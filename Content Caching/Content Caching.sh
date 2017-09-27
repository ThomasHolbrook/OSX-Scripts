#!/bin/bash

#Thomas Holbrook - Tom@Jigsaw24.com 
#v0.1 PoC 
#>= macOS 10.13

enableCache() {
		
		AssetCacheManagerUtil isActivated		
		if [ $? -eq 0 ]
		then
		  echo "Content Caching is already running"
		else	  
		  AssetCacheManagerUtil canActivate
		  	if [ $? -eq 0 ]
		  	then
		  		AssetCacheManagerUtil Activate
		  		if [ $? -eq 0 ]
		  		then
		  			echo "Content Caching has been activated"
		  		else
		  			echo "Content Caching failed to activate"
		  		fi
		  	else
		  		echo "Content Caching is not ready to be Activated"
		  	fi
		fi

}

cachePrefs() {
		sudo -u _assetcache defaults write /Library/Preferences/com.apple.AssetCache.plist CacheLimit 30000000000
		sudo -u _assetcache defaults write /Library/Preferences/com.apple.AssetCache.plist PersonalCacheLimit 10000000000
		}

setupCache() {	
	
	AssetCacheManagerUtil isActivated
	
	if [ $? -eq 1 ]
	then			
		cachePrefs
		AssetCacheManagerUtil reloadSettings
		enableCache
	else
		AssetCacheManagerUtil deactivate
		cachePrefs
		AssetCacheManagerUtil reloadSettings
		enableCache
	fi
	
	}
	
setupCache
