# iOS Workshop Part III, Step 1 Done (Programatic UI Completed)
## Prerequisites
* Workshop Parts I-II Complete 

## Installing CocoaPods

### Without latest ruby installed (currently 2.3.1):
* Install rbenv if you do not have it already: `brew install rbenv`
* Install most recent, stable version of ruby: `rbenv install 2.3.1` 

### With Ruby already installed: 
* Install CocoaPods: `gem install cocoapods`

## Setting up Project
### Install Xcode
* Download Xcode from the Apple App Store

### Clone Repo 
* clone repo: `git@github.com:Cramsden/iOS.git`
* run `./RestExample/scripts/bootstrap`
* open the project: `open RestExample/HelloRest.xcworkspace` 

### Start the server
* From the main directory, `cd server`
* Install dependencies, `npm install`
* Start server, `npm start`

## Workshop Agenda
1. Implement a UI programatically using PureLayout
2. Add a new view, using storyboards that allows a person to be added to your contacts
  * Goal is to have a high fidelity UI
  * You will need to add the backend service that enables this functionality

## Readings 
### PureLayout
* https://github.com/PureLayout/PureLayout

# Next Branch: `add_new_person`


