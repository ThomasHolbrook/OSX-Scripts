#!/bin/bash

localDir="/tmp/031-86699"
pkgName="macOSUpd10.12.1Complete.pkg"

function downloadFile
{	
	fileURL=$1
	
	fileName=${fileURL##*/}  # retain the part after the last slash
	
	if [ ! -d $localDir ]
	then
		mkdir $localDir
	fi
	
	if [ ! -f $localDir/$fileName ]
	then
		
		echo "Downloading $fileName"
		
		curl -o $localDir/$fileName $1
	else
		echo "File $fileName exists skipping"
	fi
}

function buildProduct
{
	
	distXML="$(find $localDir -name '*.dist')"
	productbuild --distribution $distXML --package-path $localDir /tmp/$pkgName
	echo "Package avaliable at /tmp/$pkgName"
	open /tmp/
	
}

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/macOSUpd10.12.1.pkg 

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/macOSUpd10.12.1Patch.pkg

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/macOSUpd10.12.1.smd

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/FirmwareUpdate.pkg

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/FullBundleUpdate.pkg

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/031-86699.English.extraInfo

downloadFile http://swcdn.apple.com/content/downloads/00/27/031-86699/volvzezccz6wt97sc8zi3z55d7cinlnte3/031-86699.English.dist

buildProduct
