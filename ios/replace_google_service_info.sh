#! /bin/bash

# https://medium.com/flutter-jp/flavor-b952f2d05b5d
if [[ $CONFIGURATION == *"Development"* ]]; then
    cp $PRODUCT_NAME/Firebase/GoogleService-Info-Development.plist $PRODUCT_NAME/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Production"* ]]; then
    cp $PRODUCT_NAME/Firebase/GoogleService-Info-Production.plist $PRODUCT_NAME/GoogleService-Info.plist
else
    echo "configuration didn't match to Acceptance, Experiment, Development, Staging or Production"
    echo $CONFIGURATION
    exit 1
fi
