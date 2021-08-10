#!/bin/bash
#
# Run the remote Pharo examples in GtRemotePharoDeclarativeExamples
#
# Assumes that the environment should be located in `remote-pharo` below the 
# working directory, which is typically the image directory.
#
set -e

# Install the remote environment, if required
if [ ! -d remote-gemstone ]
then
	$SCRIPTS/setup-remote-gemstone.sh
fi

# Start the remote server
startnetldi -g
startstone
sleep 1
# Run the remote examples
./glamoroustoolkit GlamorousToolkit.image gtRemoteServerExamples --junit-xml-output --verbose

# Shutdown the GemStone servers
stopstone gs64stone DataCurator swordfish
stopnetldi

