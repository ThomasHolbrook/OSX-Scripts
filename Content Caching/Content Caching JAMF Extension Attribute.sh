#!/bin/bash

#Thomas Holbrook - Tom@Jigsaw24.com 
#v0.1 PoC 
#>= macOS 10.13

#!/bin/sh

cacheUsed=`AssetCacheManagerUtil status 2>&1 | grep CacheUsed`

echo "<result>$cacheUsed</result>"