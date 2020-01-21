# fishfinder_app

An app to serve the fish classifying model

## App structure
                                    main.dart
                                        |
                                  wrapper.dart
                                  /         \
                 authentication.dart          home.dart
                /      |       \          /       |         \
         welcome    signin   register  camera  homescreen fishdex
                                         |        |       /
                                       loading - fish_info


## The main purpose

The main purpose of the app is to be able to make or select a photo of a fish and use our state
of the art machine learning solutions to identify it. Secondary goals are to create a PokeDex like
FishDex and to be able to share it with your friends